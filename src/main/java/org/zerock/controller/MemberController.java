package org.zerock.controller;

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

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService mService; 
	
	@PostMapping("/loginb")
	public String memberLogin(@RequestParam("user_id") String user_id,@RequestParam("pw") String pw, HttpServletRequest request) {
		
		MemberVO mVo = mService.MemberRead(user_id);
		
		if(mVo.getUser_id().equals(user_id)) {
			// id 일치

			if(mVo.getPw().equals(pw)) {
				//pw 일치
				
				HttpSession session = request.getSession();
				session.setAttribute("sessionMember", mVo);
				session.setAttribute("userid", mVo.getUser_id());
				session.setAttribute("sessionUser", mVo.getUser_id());
				return "main";
				
			}else {
				//pw 불일치
				System.out.println("로긴실패 pw불일치 - 나중에 printwriter 알아서");
				
				return "login";
			}
			
		} else {
			//id 불일치
			System.out.println("로긴 실패 해당하는 id 없음 - 나중에 printwirter 알아서");
			
			return "login";
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
}
