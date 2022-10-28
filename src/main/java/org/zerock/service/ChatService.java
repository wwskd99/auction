package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChatVO;

public interface ChatService {

	public void insertChat(ChatVO chat);
	public List<ChatVO> SelectChat(int room_id);
}
