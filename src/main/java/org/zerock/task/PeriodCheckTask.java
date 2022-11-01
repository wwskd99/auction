package org.zerock.task;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.domain.ProductVO;
import org.zerock.domain.Room;
import org.zerock.mapper.ProductMapper;
import org.zerock.mapper.RoomMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class PeriodCheckTask {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductMapper pMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private RoomMapper rMapper;
	
	@Scheduled(cron="0 0 0/1 1/1 * ?")
	public void checkFiles(){
		log.info("게시글 체크 task run............");
		Date now = new Date();
		List<ProductVO> productList = pMapper.getList();
		
		productList.forEach(product -> {


			Date productDate = product.getDate();
			
			long diffTime = now.getTime() - productDate.getTime();
			
			if(diffTime >= 259200000 && diffTime < 864000000) {
				// 3일 지난 상태
				// 채팅방 개설
				
				String Buyer_id = pMapper.BuyerIsWho(product.getProduct_id());

				log.info(Buyer_id);

				if(Buyer_id == null) { // 유저아이디가 없으면 
					// 혹시나 게시글 삭제할 경우 여기다가
					return;
				}
				Room room = new Room();
				
				room.setProduct_id(product.getProduct_id());
				room.setRoomName(product.getTitle());
				room.setBuyer(Buyer_id);
				room.setSeller(product.getUser_id());
				
				rMapper.insertRoom(room);
				
				// 혹시나 게시글 삭제할 경우 여기다가
				return;	// 유저아이디가 없으면 
				
			}
			else if(diffTime >= 864000000) {
				// 10일 지난 상태
				// 채팅방 폭파
			}
		});
	}
}
