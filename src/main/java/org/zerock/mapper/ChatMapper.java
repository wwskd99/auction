package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChatStorageVO;
import org.zerock.domain.ChatVO;

public interface ChatMapper {
	public void insertChat(ChatVO chat);
	public List<ChatVO> SelectChat(int room_id);
	public void insertStorage(ChatStorageVO storage);
	public void deleteLog(int room_id);
}
