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
		
		log.warn("User Login Checking.........");
		
		Principal prin = request.getUserPrincipal();
		
		if(prin!=null) {
	
			String userid = prin.getName();
			
			log.warn("Authenticated User ID : "+prin.getName());
			log.warn("Destination : "+uhp.getOriginatingRequestUri(request));
			request.setAttribute("USERID", userid);
			return true;

		}else {
		
			log.warn("prin = Null ");
			log.warn("Redirect.... ");
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
