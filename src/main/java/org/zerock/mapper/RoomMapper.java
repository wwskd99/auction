package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Room;

public interface RoomMapper {
	public void insertRoom(Room room);
	public List<Room> selectAllRoom();
	public List<Room> selectSellerRoom(String seller);
}
