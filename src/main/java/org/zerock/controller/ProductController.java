package org.zerock.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import org.zerock.domain.ScoreVO;
import org.zerock.domain.TradeVO;
import org.zerock.service.MemberService;
import org.zerock.service.ProductService;
import org.zerock.service.RoomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private RoomService rService;
	
	@GetMapping("/view")
	public String productView(@RequestParam("product_id") int product_id, Model model) {
		
		ProductVO pVo = pService.productRead(product_id);
		
		if(pVo == null) {
			
			model.addAttribute("message", "존재하지 않는 게시글 입니다.");
			
			return "/main";
		}
		
		List<ProductPicVO> picList = pService.piclistRead(product_id);
		model.addAttribute("piclist", picList);

		int picCount = pService.picCountRead(product_id);

		model.addAttribute("piccount", picCount);

		log.info("----- view page controller end -----");

		model.addAttribute("piccount", picCount);
		
		model.addAttribute("productView", pVo);

		Date date = pVo.getDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String regDate = "'" + simpleDateFormat.format(date) + "'";

		model.addAttribute("regDate", regDate);

		String currentPriceUser = pService.currentPriceUserRead(product_id);

		model.addAttribute("currentPriceUser",currentPriceUser);
		
		TradeVO tVo = pService.selectTrade(pVo.getUser_id());
		if (tVo == null || tVo.getTotal_count_s() == 0) {
			model.addAttribute("msg", "첫 경매 판매자입니다.");
		} else {
			model.addAttribute("trade", tVo);
			float SuccessRate = ((float) (tVo.getTotal_count_s() - tVo.getFail_count_s()) / tVo.getTotal_count_s())
					* 100;
			model.addAttribute("rate", SuccessRate);
		}
		
		// 평점과 유저정보
		List<ScoreVO> scores = rService.selectScore(pVo.getUser_id());
		log.info(scores);
		float average=0.0f;
		int count=0;
		if (scores.isEmpty()) {
			model.addAttribute("info_msg", "평가받은 적이 없는 사람입니다.");
		} else {
			for(int i=0; i<scores.size(); i++) {
				average+=scores.get(i).getUser_score();
				count++;
			}
			model.addAttribute("average", average / count);
		}
		model.addAttribute("member", mService.MemberRead(pVo.getUser_id()));	
		
		return "/product/view";
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
		
		log.info(product);
		
		gpsVo.setProduct_id(product.getProduct_id());
		
		if(product.getNeighborhood() == null) {
			
			product.setNeighborhood("NO");
			
		}
			if(product.getNeighborhood().equals("YES")) {
			
				if(gpsVo.getLatitude() != null) {
					pService.productGPSRegist(gpsVo);
				}

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
	
	@ResponseBody
	@RequestMapping(value = "/productDelete", produces = "application/json; charset=utf8")
	public String productDelete(@RequestParam("product_id") int product_id ,HttpServletRequest request) {
		
		String requestMessage;
		HttpSession session = request.getSession();
		String sessionUser = (String)session.getAttribute("sessionUser");
		
		ProductVO pVo = pService.productRead(product_id);
		
		
		Date date = new Date();
		Date regDate = pService.regDateRead(product_id);
		long endDate = regDate.getTime()+259200000;
		long currentDate = date.getTime();
		
		if(endDate < currentDate) {
			
			requestMessage = "마감된 경매 입니다.";
			
		}else {
		
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
	

		}
		return requestMessage;
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
	
	@GetMapping("/new")
	public String pronew(Model model) {
		List<ProductVO> pnew = pService.pronew();
		model.addAttribute("list", pnew);
		return "/product/new";
	}
	
	@GetMapping("/5km")
	public String distance(Model model, HttpServletRequest request) {

		BigDecimal latitude = new BigDecimal(request.getParameter("latitude"));
		BigDecimal longitude = new BigDecimal(request.getParameter("longitude"));
		double lat = latitude.doubleValue();
		double lnt = longitude.doubleValue();
		List<ProductVO> pdist = pService.distance();
		List<ProductVO> innerList = new ArrayList<ProductVO>();
 		pdist.forEach(product -> {
			GPSVO gps = pService.selectGPS(product.getProduct_id());
			double distance = getDistance(lat, lnt, gps.getLatitude().doubleValue(), gps.getLongitude().doubleValue());
			log.info(distance);
			if(distance<5) {
				innerList.add(product);
			} else {
				return;
			}
		});
 		log.info(latitude);
 		log.info(longitude);
		model.addAttribute("list", innerList);
		return "/product/5km";
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
	
	private Double getDistance(Double lat, Double lnt, Double lat2, Double lnt2) {

	    double theta = lnt - lnt2;
	    double dist = Math.sin(deg2rad(lat))* Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat))*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta));
	    dist = Math.acos(dist);
	    dist = rad2deg(dist);
	    dist = dist * 60*1.1515*1609.344;

	    return dist/1000;	// 킬로미터단위
	}

	//10진수를 radian(라디안)으로 변환
	private static double deg2rad(double deg){
	    return (deg * Math.PI/180.0);
	}
	//radian(라디안)을 10진수로 변환
	private static double rad2deg(double rad){
	    return (rad * 180 / Math.PI);
	}
}

