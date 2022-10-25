package org.zerock.domain;


import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String user_id;
	private String name;
	private String pw;
	private String phone;
	private String birth;
	private List<AuthVO> authList;
}
