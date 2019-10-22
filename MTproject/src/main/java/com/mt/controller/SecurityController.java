package com.mt.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
public class SecurityController {

	//접근제한으로 접근이 거부되었을 때 아래 url을 날리도록 해놨음
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("mt 접근거부 : "+auth);
	}
	
	/*
	 * @GetMapping("/customLogin") public void loginInput(String error, String
	 * logout, Model model) {
	 * 
	 * log.info("error : "+error); log.info("logout : "+logout);
	 * 
	 * 
	 * //일반적인 상황 : error : null / logout : null //패스워드 실패 : error : "" / logout :
	 * if(error != null) {
	 * model.addAttribute("error","Login Error Check Your Account"); } if(logout !=
	 * null) { model.addAttribute("logout","logout!~!"); } }
	 * 
	 * @GetMapping("/customLogout")
	 *  public void logoutGET() {
	 * log.info("custom logout"); }
	 * 
	 * @PostMapping("/customLogout") 
	 * public void logoutPost() {
	 * log.info("post custom logout"); }
	 */
	
	@GetMapping("/member/customLogin")
	public void customLogin() {
		log.info("mt알림 : move custom login page");
		//return이 없으면 받은 url을 그대로 돌려준다 url ->controller -> url.jsp 출력
	}
	
	@GetMapping("/customLogout")
	public String customLogout() {
		log.info("mt알림 : loggout....");
	return "/security/logout";
	}
	
}
