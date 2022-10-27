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
import org.zerock.domain.MemberVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
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
		log.info("----- view page controller start -----");
		List<ProductPicVO> picList = pService.piclistRead(product_id);
		model.addAttribute("piclist",picList);	
		
		int picCount = pService.picCountRead(product_id);
		model.addAttribute("piccount",picCount);
		
		log.info("----- view page controller end -----");
		
		ProductVO pVo = pService.productRead(product_id);
		model.addAttribute("productView",pVo);		
		
		Date date = pVo.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss"); 
		String regDate = "'" + simpleDateFormat.format(date) + "'";
		
		model.addAttribute("regDate",regDate);
		
		String currentPriceUser = pService.currentPriceUserRead(product_id);
		model.addAttribute("currentPriceUser",currentPriceUser);
		
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
	
	//// 아래 동길
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", pService.getList());
	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr) {
		log.info("register: " + product);
		pService.register(product);
		rttr.addFlashAttribute("result", product.getProduct_id());
		return "redirect:/product/list";
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
