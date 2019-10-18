package com.mt.interceptor;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.UrlPathHelper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		UrlPathHelper uhp = new UrlPathHelper();
		
		log.warn("=======================");
		log.warn("User의 로그인 정보를 확인합니다.");
		
		Principal prin = request.getUserPrincipal();
		
		if(prin!=null) {
	
			String userid = prin.getName();
			
			log.warn("인증된 User ID : "+prin.getName());
			log.warn("진행경로  : "+uhp.getOriginatingRequestUri(request));
			request.setAttribute("USERID", userid);
			return true;

		}else {
		
			log.warn("==========================");
			log.warn("로그인 세션정보가 확인되지 않습니다.");
			log.warn("Redirect로 최초 페이지로 돌아갑니다.");
			response.sendRedirect("/");
			return false;
			}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv)
			throws Exception {
		log.warn("AuthInterceptor PostHandle Start.......");

	}

}
