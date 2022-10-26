package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private MemberMapper mMapper;
	
	public MemberVO MemberRead(String user_id) {
		
		return mMapper.readMember(user_id);
		
	}
	
}
