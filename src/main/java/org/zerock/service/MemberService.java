package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public MemberVO MemberRead(String user_id);
	public void joinMember(MemberVO mVo);
	public void resignMember(String user_id);
	public void updateMember(MemberVO mVo);
}
