package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChatVO;

public interface ChatMapper {
	public void insertChat(ChatVO chat);
	public List<ChatVO> SelectChat(int room_id);
}
