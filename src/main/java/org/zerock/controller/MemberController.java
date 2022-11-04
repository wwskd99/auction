package org.zerock.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService mService;
	private ProductService pService;

	@PostMapping("/loginb")
	public String memberLogin(@RequestParam("user_id") String user_id, @RequestParam("pw") String pw,
			HttpServletRequest request) {
		HttpSession session = request.getSession();

		log.info(user_id);
		log.info(pw);

		if (user_id == null || user_id == "") {
			session.setAttribute("login_message", "아이디 넣어주세요");
			return "member/login";
		}
		if (pw == null || pw == "") {
			session.setAttribute("login_message", "비밀번호 넣어주세요");
			return "member/login";
		}

		MemberVO mVo = mService.MemberRead(user_id);
		if (mVo == null) {
			session.setAttribute("login_message", "해당하는 회원이 없습니다.");
			return "member/login";
		}
		if (mVo.getUser_id().equals(user_id)) {
			// id 일치

			if (mVo.getPw().equals(pw)) {
				// pw 일치

				session.setAttribute("sessionMember", mVo);
				session.setAttribute("userid", mVo.getUser_id());
				session.setAttribute("sessionUser", mVo.getUser_id());
				return "main";

			} else {
				// pw 불일치
				session.setAttribute("login_message", "로그인 실패 패스워드 불일치");
				return "member/login";
			}

		} else {
			// id 불일치
			session.setAttribute("login_message", "로그인 실패 아이디 불일치");
			return "member/login";
		}

	}

	@RequestMapping("/login")
	public void memberLogin() {

	}

	@RequestMapping("/logout")
	@ResponseBody
	public ModelAndView memberLogout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.invalidate();
		mv.setViewName("/main");
		return mv;
	}

	@RequestMapping("/join")
	public void memberJoin() {

	}

	@PostMapping("/joinb")
	public ModelAndView memberJoin(@RequestParam("user_id") String user_id, @RequestParam("pw") String pw,
			@RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("birth") String birth,
			HttpServletRequest request) {

		MemberVO mVo = mService.MemberRead(user_id);
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		mv.setViewName("/member/join");

		Pattern pattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
		Matcher matcher = pattern.matcher(phone);

		if (user_id == null || user_id == "") {
			session.setAttribute("join_message", "아이디 넣어주세요.");
			return mv;
		} else if (pw == null || pw == "") {
			session.setAttribute("join_message", "비밀번호 넣어주세요.");
			return mv;
		} else if (name == null || name == "") {
			session.setAttribute("join_message", "이름 넣어주세요.");
			return mv;
		} else if (mVo != null) {
			session.setAttribute("join_message", "존재하는 회원입니다.");
			return mv;
		} else if (!matcher.matches()) {
			session.setAttribute("join_message", "유효하지 않는 전화번호입니다. ex: XXX-XXXX-XXX");
			return mv;
		} else {
			MemberVO mVo1 = new MemberVO();
			mVo1.setUser_id(user_id);
			mVo1.setPw(pw);
			mVo1.setName(name);
			mVo1.setPhone(phone);
			mVo1.setBirth(birth);

			mService.joinMember(mVo1);
			mv.addObject("message", "회원가입을 했습니다.");
			mv.setViewName("/main");
			return mv;
		}
	}

	@RequestMapping("/resign")
	@ResponseBody
	public ModelAndView memberResign(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		int result = pService.IsExist(userid);
		if (result == 1) {
			mv.addObject("message", "판매 게시글이 존재하여 불가능합니다.");
			mv.setViewName("/main");
			return mv;
		} else {

			mService.deleteBid_history(userid);
			mService.deleteTrade(userid);
			mService.resignMember(userid);

			session.invalidate();
			mv.addObject("message", "탈퇴 처리를 했습니다.");
			mv.setViewName("/main");
			return mv;
		}
	}

	@RequestMapping("/update")
	public ModelAndView memberUpdate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		mv.addObject("mVo", session.getAttribute("sessionMember"));
		mv.setViewName("/member/update");

		return mv;
	}

	@PostMapping("/updateb")
	public ModelAndView memberUpdate(@RequestParam("pw") String pw, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("birth") String birth, HttpServletRequest request) {
		MemberVO mVo = new MemberVO();
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("sessionUser");
		mv.setViewName("/member/update");

		Pattern pattern = Pattern.compile("\\d{3}-\\d{4}-\\d{4}");
		Matcher matcher = pattern.matcher(phone);

		if (pw == null || pw == "") {
			session.setAttribute("update_message", "비밀번호 넣어주세요.");
			return mv;
		} else if (name == null || name == "") {
			session.setAttribute("update_message", "이름 넣어주세요.");
			return mv;
		} else if (!matcher.matches()) {
			session.setAttribute("update_message", "유효하지 않는 전화번호입니다. ex: XXX-XXXX-XXX");
			return mv;
		} else {
			mVo.setUser_id(user_id);
			mVo.setPw(pw);
			mVo.setName(name);
			mVo.setPhone(phone);
			mVo.setBirth(birth);

			mService.updateMember(mVo);
			mv.addObject("message", "회원정보를 수정했습니다.");
			mv.setViewName("/main");
			return mv;
		}
	}
}
