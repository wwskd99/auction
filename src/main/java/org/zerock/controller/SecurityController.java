package org.zerock.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

// Spring security를 적용하기 위해서 별도의 Controller가 필요한 것은 아니다.
// security 기능이 동작하는지 교육하기 위해 만든 것이다.

@Controller
@RequestMapping("/security/*")
@Log4j
public class SecurityController {
	// 가정 : 모든 사용자가 접근할 수 있는 페이지 
	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사용자가 접근할 수 있음");
	}	// View 페이지 이름 : /security/all.jsp
	
	// 가정 : 회원만이 접근할 수 있는 페이지 
	@GetMapping("/member")
	public void doMember() {
		log.info("회원만이 접근할 수 있음");
	}	// View 페이지 이름 : /security/member.jsp
		
	// 가정 : 관리자만 접근할 수 있는 페이지 
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자만 접근할 수 있음");
	}	// View 페이지 이름 : /security/admin.jsp

}
