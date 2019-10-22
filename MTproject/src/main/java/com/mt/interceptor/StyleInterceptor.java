package com.mt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mt.domain.StyleVO;
import com.mt.service.BodService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Log4j
public class StyleInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	@Qualifier("board")
	BodService bs;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.warn("실행===");
		int cityNum = Integer.parseInt((String)request.getParameter("cityNum"));
		StyleVO svo = bs.selectStyle(cityNum);
		if(svo!=null) {
			log.warn("Style select success SVO :"+svo);
			request.setAttribute("svo", svo);
			return true;
		}else {
			log.warn("거부===");
			log.warn("StyleVO가 확인되지 않습니다.");
			return false;
		}
	}

}
