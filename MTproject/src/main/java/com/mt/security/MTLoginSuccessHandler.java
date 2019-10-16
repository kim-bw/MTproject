package com.mt.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.Data;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Data
public class MTLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	//1
	private RequestCache requestCache = new HttpSessionRequestCache();
	//2
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	//3
	private String targetUrl;
	private String defaultUrl;
	private boolean useReferer;
	int result = 0;
	
	
	public MTLoginSuccessHandler() {
		targetUrl = "";
		defaultUrl = "/";
		useReferer = false;
	}

	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {

		SavedRequest saveRequest = requestCache.getRequest(request, response);
		
		
		if(saveRequest!=null) {
			String targetUrl = saveRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
		
		
		

//		log.warn("Login Success");
//		
//		//id나 이름 1개에 여러개의 권한 1+N의 관계이다.
//		List<String> roleNames = new ArrayList<String>();
//		
//		//권한 출력 : 각 권한을 authority에 넣고 list인 roleNames에 권한을 get하여 저장해 리스트를 만든다.
//		auth.getAuthorities().forEach(authority -> roleNames.add(authority.getAuthority()));
//		
//		log.warn("ROLE_NAMES :"+roleNames);
//		
//		//리스트에 다음 내용이 포함되어 있다면
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/board/register");
//			return;
//		}
//
//		if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/sample/member");
//			return;
//		}
//		response.sendRedirect("/");
	}

}
