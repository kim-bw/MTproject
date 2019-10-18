package com.mt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mt.domain.Criteria;

public class PageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int pageNum = (Integer.parseInt((String)request.getParameter("pageNum")));
		int amount = (Integer.parseInt((String)request.getParameter("amount")));
		
		request.setAttribute("cri",new Criteria(pageNum,amount));
		return true;
	}

	
	
}
