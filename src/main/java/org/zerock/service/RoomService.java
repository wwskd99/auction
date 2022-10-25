package org.zerock.service;

import java.util.List;

import org.zerock.domain.Room;

public interface RoomService {

	public void insertRoom(Room room);
	public List<Room> selectAllRoom();
	public List<Room> selectSellerRoom(String seller);
}
