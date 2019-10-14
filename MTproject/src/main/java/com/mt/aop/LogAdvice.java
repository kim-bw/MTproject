package com.mt.aop;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Aspect
@Slf4j
@Log4j
@Component
public class LogAdvice {

	@Before( "execution(* com.mt.controller.*.*(..))" )
	//패키지 경로에서 MemService~로 시작하는 클래스의 모든 메서드(..)은 모든 파라미터를 뜻함. 파라미터까지 명시해 주어야 함
	public void logBefore() {
		log.warn("============== Controller ==================");
	}
	
	@Before( "execution(* com.mt.service.MemService*.loadUserByUsername(String)) && args(userName)")
	//패키지경로의 메서드 지정하여 적용(파라미터까지 지정) 한 후 해당 aop 어드바이스의 파라미터로 넣으면 사용 가능함
	public void methodBefore(String userName) {
		log.warn("============== Security  ==================");
		log.warn("UserID : " +userName);
	}
	
	@AfterThrowing(pointcut = "execution(* com.mt.service.*.*(..))", throwing="exception")
	  public void logException(Exception exception) {
	    log.warn("============= Exception   =================");
	    log.warn("Exception : "+ exception);
	  }
	
	
	
}
//FreeVO