package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
import org.zerock.service.MemberService;
import org.zerock.service.ProductService;
import org.zerock.service.TotalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/info/*")
@AllArgsConstructor
public class InfoController {

	private TotalService tService;
	private ProductService pService;
	private MemberService mService;
	@GetMapping("/bid")
	public void bid(HttpServletRequest request, Model model) {
		
		//list 자체
		HttpSession session = request.getSession();
		List<Bid_historyVO> BidList = new ArrayList<Bid_historyVO>();
		String user_id = (String) session.getAttribute("sessionUser");
		BidList = tService.TotalBidRead(user_id);
		model.addAttribute("BidList", BidList);
		
		
		//title 가져오기
		List<String> title_list = new ArrayList<String>();
		
		for (int i = 0 ; i < BidList.size(); i++) {
			
			int product_id = BidList.get(i).getProduct_id();
			String title = pService.TitleRead(product_id);
			title_list.add(title);
			
		}
		
		model.addAttribute("BidListTitle", title_list);
		
		//날짜형식변경(fmt안쓰기)
		List<String> Date_list = new ArrayList<String>();
		
		for (int i = 0; i < BidList.size(); i++) {
			
			Date BidDate = BidList.get(i).getBid_date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String Bid_Date = simpleDateFormat.format(BidDate);
			
			Date_list.add(Bid_Date);
			
		}
		
		model.addAttribute("BidListDate", Date_list);
		
		//기타메시지
		List<String> Bid_etc = new ArrayList<String>();
		
		for (int i = 0; i < BidList.size(); i++) {
			String etc;
			int product_id = BidList.get(i).getProduct_id();
			String currentUser = pService.currentPriceUserRead(product_id);	
			
			Date date = new Date();
			Date regDate = pService.regDateRead(product_id);
			long endDate = regDate.getTime()+259200000;
			long currentDate = date.getTime();
			
			if(endDate < currentDate) {
				
				etc = "경매가 마감되었습니다.";
				
			}else {
				
				
				if(BidList.get(i).getUser_id().equals(currentUser)) {
					etc = "최상위 입찰입니다.";
				} else {
					etc = "상위 입찰이 존재합니다.";
				}
				
			}
				
			Bid_etc.add(etc);		
		}
		
		model.addAttribute("BidListEtc", Bid_etc);
		
		
		//등록리스트
		List<ProductVO> product_list = new ArrayList<ProductVO>();
		
		product_list = tService.ProductlistRead(user_id);
		
		model.addAttribute("productList",product_list);

		//등록리스트 날짜 형식
		List<String> date_list_reg = new ArrayList<String>();
		
		for (int i = 0; i < product_list.size(); i++) {
			
			Date regDate = product_list.get(i).getDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			String reg_date = simpleDateFormat.format(regDate);
			
			date_list_reg.add(reg_date);
			
		}
		
		
		model.addAttribute("RegListDate", date_list_reg);
		
		
		//낙찰리스트,마감날짜, 판매자 전화번호
		List<ProductVO> award_list = new ArrayList<ProductVO>();
		List<String> endDate_list = new ArrayList<String>();
		List<String> phoneNum = new ArrayList<String>();
		
		for(int i = 0; i < BidList.size(); i++) {
			
			
			int product_id = BidList.get(i).getProduct_id();
			String currentUser = pService.currentPriceUserRead(product_id);
			
			
			Date date = new Date();
			Date regDate = pService.regDateRead(product_id);
			long endDate = regDate.getTime()+259200000;
			long currentDate = date.getTime();
			
			//마감되었다면
			if(endDate < currentDate) {
				
				//최상위입찰자라면
				if(user_id.equals(currentUser)) {
					//awadlist add
					ProductVO awardPvo = new ProductVO();					
					awardPvo = pService.productRead(product_id);
					award_list.add(awardPvo);
					//endDate add
					Date awardDate = new Date(endDate);
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
					String awardDateString = simpleDateFormat.format(awardDate);
					endDate_list.add(awardDateString);
					//phoneNum add
					MemberVO mVo = new MemberVO();
					String sellerId = awardPvo.getUser_id();
					mVo = mService.MemberRead(sellerId);
					String sellerPhone = mVo.getPhone();
					phoneNum.add(sellerPhone);
					
					
					
				}
				
			}
			//리스트더하기
			
		}
		
		model.addAttribute("AwardList", award_list);
		model.addAttribute("AwardDate", endDate_list);
		model.addAttribute("AwardNum", phoneNum);
		
		
		
		
		
	}


}