package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.domain.Criteria;

import org.zerock.domain.GPSVO;

import org.zerock.domain.MemberVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
import org.zerock.service.MemberService;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {


	@Autowired
	private ProductService pService;

	private MemberService mService;
	
	@GetMapping("/view")
	public void productView(@RequestParam("product_id") int product_id, Model model) {

		List<ProductPicVO> picList = pService.piclistRead(product_id);
		model.addAttribute("piclist", picList);

		int picCount = pService.picCountRead(product_id);

		model.addAttribute("piccount", picCount);

		log.info("----- view page controller end -----");

		model.addAttribute("piccount", picCount);

		ProductVO pVo = pService.productRead(product_id);
		model.addAttribute("productView", pVo);

		Date date = pVo.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String regDate = "'" + simpleDateFormat.format(date) + "'";

		model.addAttribute("regDate", regDate);

		String currentPriceUser = pService.currentPriceUserRead(product_id);
		model.addAttribute("currentPriceUser", currentPriceUser);

	}

	@ResponseBody
	@PostMapping("/currentPrice")
	public int currentPriceUpdate(@RequestParam("product_id") int product_id,
			@RequestParam("current_price") int current_price, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mVo = (MemberVO) session.getAttribute("sessionMember");
		String user_id = mVo.getUser_id();

		pService.currentPriceInsert(product_id, current_price, user_id);
		pService.currentPriceUpdate(product_id, current_price);
		int currentPrice = pService.currentPriceRead(product_id);
		model.addAttribute("currentPrice", currentPrice);

		return currentPrice;
	}

	@GetMapping("/register")
	public void register(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String sessionUser = (String)session.getAttribute("sessionUser");
		model.addAttribute("loginUser", sessionUser);
	}

	@PostMapping("/register")
	public String register(ProductVO product, GPSVO gpsVo, RedirectAttributes rttr, Model model) {

		System.out.println(gpsVo.getLatitude());
		System.out.println(gpsVo.getLongitude());
		// 게시글 등록
		pService.productRegist(product);
		// 셀렉트키 리턴
		gpsVo.setProduct_id(product.getProduct_id());

		if (gpsVo.getLatitude() != null) {
			pService.productGPSRegist(gpsVo);
		}

		rttr.addFlashAttribute("result", product.getProduct_id());

		return "redirect:/product/view?product_id=" + product.getProduct_id();

	}

	@ResponseBody
	@PostMapping("/currentPriceUserId")
	public String currentPriceUserId(@RequestParam("product_id") int product_id) {

		String currentUser = pService.currentPriceUserRead(product_id);
		System.out.println(currentUser);
		return currentUser;

	}

	//// 아래 동길

	@GetMapping("/list")
	public void list(Model model) {
		List<ProductVO> p = pService.getList();
		log.info("list---------------------");
		model.addAttribute("list", p);
	}
	
	@GetMapping("/price")
	public String price_desc(Model model){
		List<ProductVO> pdesc = pService.price_desc();
		model.addAttribute("list", pdesc);
		return "/product/price";
	}
	
	@GetMapping("/searchList")
	public String searchList(Criteria cri, Model model) {
		log.info("cri: " + cri);
		List<ProductVO> list = pService.searchList(cri);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
		}
		return "/product/list";
	}
}

