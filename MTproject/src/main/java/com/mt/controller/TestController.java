package com.mt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.domain.BoardVO;
import com.mt.domain.MemberVO;
import com.mt.domain.PageVO;
import com.mt.domain.PlaceVO;
import com.mt.domain.ReplyVO;
import com.mt.service.ActService;
import com.mt.service.BodService;
import com.mt.service.MemService;
import com.mt.service.RepService;
import com.mt.util.SystemClass;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Log4j
@Controller
public class TestController {
	//Impl
	@Autowired
	@Qualifier("board")
	public BodService  bs;
	
	@Autowired
	@Qualifier("member")
	public MemService  ms;
	
	@Autowired
	@Qualifier("reply")
	public RepService  rs;
	
	@Autowired
	@Qualifier("action")
	public ActService as;
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― T1/댓글작성/김병우
	//테스트 홈으로 가기
	@RequestMapping("test-home") 
	public ModelAndView goTestHome(ModelAndView mv) {
		mv.setViewName("test/testhome");
		return mv;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― T1/댓글작성/김병우
	@RequestMapping("test-showMyPage") 
	public ModelAndView showMyPage(ModelAndView mv,HttpServletRequest request,PageVO pvo) {

		pvo = SystemClass.sessionCheck(pvo, request);
		
		List<BoardVO> myBoard = new ArrayList<BoardVO>();
		PageVO bod_pvo = SystemClass.countPage(bs, pvo,3);
		myBoard = bs.showMyBoard(pvo);
		
		List<ReplyVO> myReply = new ArrayList<ReplyVO>();
		PageVO rep_pvo = SystemClass.countPage(rs, pvo,4);
		myReply = rs.showMyReply(pvo);
		
		System.out.println("bod_pvo :"+bod_pvo);
		System.out.println("rep_pvo :"+rep_pvo);
		System.out.println("보드 :"+myBoard);
		System.out.println("댓글 :"+myReply);
		
		mv.setViewName("test/myPage");
		mv.addObject("myBoard", myBoard);
		mv.addObject("myReply", myReply);
		return mv;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― T1/댓글작성/김병우
	@RequestMapping("test-goMission")
	@ResponseBody
	public ModelAndView mission(ModelAndView mv,HttpServletRequest request,HttpServletResponse response, MemberVO mvo) {
		System.out.println("들어옴");
		mvo = SystemClass.sessionCheck(mvo, request);
		response.setContentType("text/html;charset=UTF-8");
		List<PlaceVO> pList = new ArrayList<PlaceVO>();
		//Gson gson = new Gson();
		pList = as.goMission();
		System.out.println(pList);
	//	String result = gson.toJson(pList);

		if(pList!=null) {
			mv.addObject("mvo", mvo); //사용자 정보
			mv.addObject("pList", pList); //랜덤여행지 리스트
			mv.addObject("pListResult", 1); //지도홈을 자주 가기 때문에 이 값이 1일때는 미션버튼을 눌러서 온 것이라고 인식하게 끔
			
		}else {
			mv.addObject("msg", "미션 날리기 실패");
			mv.setViewName("result");
		}
		
		mv.setViewName("jsonView");
		return mv;
	}//m end
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― T1/지도홈/최건영
	

	@RequestMapping("test-jidohome") 
	public ModelAndView gotestjidohome(ModelAndView mv) {
		mv.setViewName("test/testJidohome");
		return mv;
	}	
	
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― T1/지도홈/최건영

	@RequestMapping("testpagetest") 
	public ModelAndView testpagetest(ModelAndView mv,BoardVO bvo) {
		log.info("bvo = "+bvo);
		return mv;
	}	
	
	@RequestMapping("/admin/admin")
	public void adminpage() {
		log.info("admin/admin... 이동");
	}
	
	@RequestMapping("/member/test-inter")
	public void testtest() {
		log.info("컨트롤러까지 왔습니다.");
		
	}
	///insertReply
}// class end
