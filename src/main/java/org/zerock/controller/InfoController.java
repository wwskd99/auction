package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.Bid_historyVO;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/info/*")
@AllArgsConstructor
public class InfoController {

	private ProductService pService;

	@ResponseBody
	@GetMapping("/bid")
	public ModelAndView bid(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		List<Bid_historyVO> BidList = new ArrayList<Bid_historyVO>();

		String user_id = (String) session.getAttribute("sessionUser");
		log.info(user_id);

		BidList = pService.readBidList(user_id);

		mv.addObject("BidList", BidList);

		return mv;
	}
}