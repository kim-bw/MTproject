package com.mt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
public class NullCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
		
		if(mv.getModel().get("result")!=null) {
			log.warn("Post Interceptor Check Parameter : "+mv.getModel().get("result"));
		}else {
			log.warn("해당 파라미터가 NULL 입니다.");
			response.sendRedirect("/error/null");
		}
	}

}
