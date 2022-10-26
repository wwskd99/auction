package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.zerock.domain.Room;
import org.zerock.domain.ScoreVO;
import org.zerock.service.RoomService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/chatting/*")
public class ChatController {
	

	@Setter(onMethod_ = @Autowired)
	private RoomService rService;
	
	List<Room> roomList = new ArrayList<Room>();
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting/chat");
		return mv;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting/room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		String buyer = (String) params.get("buyer");
		String seller = (String) params.get("seller");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomName(roomName);
			room.setBuyer(buyer);
			room.setSeller(seller);
			rService.insertRoom(room);
			
			roomList.add(room);
		}
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		roomList = rService.selectAllRoom();
//		roomList = rService.selectSellerRoom("seller"); // 특정인만 출력
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int room_id = Integer.parseInt((String) params.get("room_id"));
		
		List<Room> new_list = roomList.stream().filter(o->o.getRoom_id()==room_id).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("room_id", params.get("room_id"));
			mv.setViewName("chatting/chat");
		}else {
			mv.setViewName("chatting/room");
		}
		return mv;
	}
	
	@GetMapping("/score")
	public ModelAndView score(@RequestParam("user_id") String user_id, @RequestParam("product_id") int product_id, @RequestParam("user_score") int user_score, @RequestParam("cause") String cause) {

		ModelAndView mv = new ModelAndView();
		ScoreVO score = new ScoreVO();
		score.setUser_id(user_id);
		score.setProduct_id(product_id);
		score.setUser_score(user_score);
		score.setCause(cause);
		rService.insertScore(score);
		mv.setViewName("chatting/room");
		return mv;
	}
}