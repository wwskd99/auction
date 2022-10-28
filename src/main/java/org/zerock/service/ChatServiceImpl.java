package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ChatVO;
import org.zerock.mapper.ChatMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("ChatService")
public class ChatServiceImpl implements ChatService{
	
	private ChatMapper chatmapper;
	
	@Override
	public void insertChat(ChatVO chat) {
		chatmapper.insertChat(chat);
	}

	@Override
	public List<ChatVO> SelectChat(int room_id) {
		return chatmapper.SelectChat(room_id);		
	}
	
}
