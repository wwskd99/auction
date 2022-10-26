package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Room;
import org.zerock.domain.ScoreVO;
import org.zerock.mapper.RoomMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("RoomService")
public class RoomServiceImpl implements RoomService{

	private RoomMapper roomMapper;
	
	@Override
	public void insertRoom(Room room) {
		roomMapper.insertRoom(room);
	}

	@Override
	public List<Room> selectAllRoom() {
		return roomMapper.selectAllRoom();
	}

	@Override
	public List<Room> selectSellerRoom(String seller) {
		// TODO Auto-generated method stub
		return roomMapper.selectSellerRoom(seller);
	}

	@Override
	public void insertScore(ScoreVO score) {
		roomMapper.insertScore(score);
		
	}
}
