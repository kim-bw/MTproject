package com.mt.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.mt.service.MemServiceImpl;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringJUnit4ClassRunner.class) : spring test를 실행함
//@WebAppConfiguration : 웹을 이용한 test 진행 -> WebApplicationContext 이용
//@ContextConfiguration : test시 참조  설정 파일
//@Log4j : 로그

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class TestControllerTest {
	
	@Autowired
	private PasswordEncoder pwencoder;
	

	public void pass() {
		String password = pwencoder.encode("3333");
		log.info("password : " +password);
	}
		
}//class end
