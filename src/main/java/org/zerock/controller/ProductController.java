package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		
	}

		
}
