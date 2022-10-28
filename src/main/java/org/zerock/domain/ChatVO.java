package org.zerock.domain;

import lombok.Data;

@Data
public class ChatVO {
	private int chat_num;
	private String user_id;
	private String chat;
	private int room_id;
}
