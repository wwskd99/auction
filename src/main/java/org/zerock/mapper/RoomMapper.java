package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CompleteVO;
import org.zerock.domain.Room;
import org.zerock.domain.ScoreVO;

public interface RoomMapper {
	public void insertRoom(Room room);
	public List<Room> selectAllRoom();
	public List<Room> selectSellerRoom(String seller);
	public List<Room> selectBuyerRoom(String buyer);
	public Room selectOneRoom(int room_id);
	public Room selectOneRoomByProduct_id(int product_id);
	public void deleteRoom(int room_id);
	
	public void insertScore(ScoreVO score);
	
	public void insertComplete(CompleteVO complete);
	public void updateBuyerCheck(CompleteVO complete);
	public void updateSellerCheck(CompleteVO complete);
	public CompleteVO resultCheck(int product_id);
	public void updateResult(int product_id);
	
	public void insertSuccessTradeSeller(String user_id);
	public void insertSuccessTradeBuyer(String user_id);
}
