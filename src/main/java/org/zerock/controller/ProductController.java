package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.GPSVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.TradeVO;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	private ProductService pService; 
	
	@GetMapping("/view")
	public void productView(@RequestParam("product_id") int product_id, Model model) {
		
		List<ProductPicVO> picList = pService.piclistRead(product_id);
		model.addAttribute("piclist",picList);	
		
		int picCount = pService.picCountRead(product_id);
		model.addAttribute("piccount",picCount);
		
	
		
		ProductVO pVo = pService.productRead(product_id);
		model.addAttribute("productView",pVo);		
		
		Date date = pVo.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss"); 
		String regDate = "'" + simpleDateFormat.format(date) + "'";
		
		model.addAttribute("regDate",regDate);
		
		String currentPriceUser = pService.currentPriceUserRead(product_id);
		model.addAttribute("currentPriceUser",currentPriceUser);
		
		TradeVO tVo = pService.selectTrade(pVo.getUser_id());
		if (tVo == null) {
			model.addAttribute("msg", "첫 경매 판매자입니다.");
		} else {
			model.addAttribute("trade", tVo);
			float SuccessRate = ((float) (tVo.getTotal_count_s() - tVo.getFail_count_s()) / tVo.getTotal_count_s())
					* 100;
			model.addAttribute("rate", SuccessRate);
		}
	}
	
	@ResponseBody
	@PostMapping("/currentPrice")
	public int currentPriceUpdate(@RequestParam("product_id") int product_id, @RequestParam("current_price") int current_price,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mVo = (MemberVO)session.getAttribute("sessionMember");
		String user_id = mVo.getUser_id();
		
		pService.currentPriceInsert(product_id,current_price,user_id);
		pService.currentPriceUpdate(product_id,current_price);
		int currentPrice = pService.currentPriceRead(product_id);
		model.addAttribute("currentPrice",currentPrice);
		
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
		if(product.getNeighborhood() == "YES") {
			gpsVo.setProduct_id(product.getProduct_id());
		
			if(gpsVo.getLatitude() != null) {
				pService.productGPSRegist(gpsVo);
			}
		}
		rttr.addFlashAttribute("result", product.getProduct_id());
		
		return "redirect:/product/view?product_id="+product.getProduct_id();
		
		
	}
	
	@ResponseBody
	@PostMapping("/currentPriceUserId")
	public String currentPriceUserId(@RequestParam("product_id") int product_id) {
		
		String currentUser = pService.currentPriceUserRead(product_id);
		System.out.println(currentUser);
		return currentUser;
	
	}
	
	@ResponseBody
	@RequestMapping(value = "/productDelete", produces = "application/json; charset=utf8")
	public String productDelete(@RequestParam("product_id") int product_id ,HttpServletRequest request) {
		
		String requestMessage;
		HttpSession session = request.getSession();
		String sessionUser = (String)session.getAttribute("sessionUser");
		
		ProductVO pVo = pService.productRead(product_id);
		
		if (sessionUser.equals(pVo.getUser_id())) {
			
			if (pVo.getCurrent_price() != 0) {
				requestMessage = "현재 경매 입찰중입니다. 삭제할 수 없습니다.";				
			}else {
				pService.productDelete(product_id);
				requestMessage = "경매 삭제 완료";
			}
			
		
		}else {
			
			requestMessage = "아이디 정보가 없습니다. 정상적인 경로로 접근해주십시오";
			
		}
	
		return requestMessage;
	}
		
	
	
	//// 아래 동길
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", pService.getList());
	}

	



	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("product_id") Integer product_id, Model model) {
		log.info("/get or /modify");
		model.addAttribute("product", pService.get(product_id));
	}

	@PostMapping("/modify")
	public String modify(ProductVO product, RedirectAttributes rttr) {
		log.info("modify:" + product);
		if (pService.modify(product)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/product/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Integer product_id, RedirectAttributes rttr) {
		log.info("remove..." + product_id);
		if(pService.remove(product_id)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/product/list";
	}
	
}
