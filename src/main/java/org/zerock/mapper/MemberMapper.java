package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {
	public MemberVO readMember(String user_id);
	public void joinMember(MemberVO mVo);
	public void resignMember(String user_id);
	public void updateMember(MemberVO mVo);
}
