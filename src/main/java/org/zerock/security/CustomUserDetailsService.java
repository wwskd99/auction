package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.CustomUser;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_=@Autowired)
	private MemberMapper memberMapper;
	
	// 반환형 : UserDetails interface -> CustomUser(MemberVO) 객체를 반환
	// 사용자 프로파일에 접근할 수 있는 메소드를 가지고 있다.
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userName);
		// userName means userid
		MemberVO vo = memberMapper.read(userName);
		log.warn("queried by member mapper: " + vo);
		return vo == null ? null : new CustomUser(vo);
	}

}
