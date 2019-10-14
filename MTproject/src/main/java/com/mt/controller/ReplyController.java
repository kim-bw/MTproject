package com.mt.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;
import com.mt.service.BodService;
import com.mt.service.RepService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Log4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Setter(onMethod_ = { @Autowired, @Qualifier("reply")})
	public RepService rs;
	
	@Setter(onMethod_ = { @Autowired, @Qualifier("board")})
	public BodService bs;

	int result1; // int 결과값을 위한 변수
	int result; // int 결과값을 위한 변수


//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― R1/댓글작성/김병우
	@RequestMapping("/insertReply")
	public ModelAndView insertReply(ModelAndView mv, ReplyVO rvo,HttpServletRequest request) {
	
		
	if(rvo.getR_root()!=0) {
		rvo.setR_step(1);	
	}
	
	//내용이 null일때 오류방지
	if(rvo.getR_content()==null) {
		rvo.setR_content("오류방지코드 작동!");
	}
	
	log.info("rvo DB 전은  =>"+rvo);
	//DB에 저장
//	rs.insertReply(rvo);

	//원댓글 r_root=0
	//원댓글이면 seq=root를 강제적으로 해주고
	//댓댓글이면 seq=root가 되어서 들어온다.
//	if(rvo.getR_root()==0) {
//		rs.changeRoot(rvo);
//		log.info("아빠댓글 : root 동기화 성공");
//	}else {
//		rvo.setR_step(1);
//		log.info("아들댓글 : root 동기화 하지 않았습니다.");
//	}	
	log.info("시작");
	rs.insertReply(rvo);
	log.info("끝");
	
		if (true) {
			
			if(rvo.getR_root()==0) {
				rs.changeRoot(rvo);
				log.info("아빠댓글 : root 동기화 성공");		
			}else {
				log.info("아들댓글 : root 동기화 하지 않았습니다.");
			}	
			mv.addObject("insertreply","result");
			
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","댓글등록 실패!");
		}

		mv.setViewName("jsonView");	
		
	return mv;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― R2/댓글삭제/김병우
	@RequestMapping("/deleteReply")
	public ModelAndView deleteReply(ModelAndView mv, ReplyVO rvo) {
		System.out.println("딜리트 리플 들어옴");
System.out.println(rvo);
		
		log.info("delete reply 들어옴");
		log.info("rvo :"+rvo);

		if (rs.deleteReply(rvo)) { 
			mv.addObject("deletereply","result");
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","댓글삭제실패");
		}
		mv.setViewName("jsonView");
		return mv;
	}
//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――R3/댓글수정/김병우
	@RequestMapping("/updateReply")
	@ResponseBody
	public ModelAndView updateReply(ModelAndView mv, ReplyVO rvo, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("업데이트 리플 들어옴");
		System.out.println("vo는 =>"+rvo);
		System.out.println("result 는 =>"+result);
		
		log.info("업데이트 리플 들어옴");
		log.info("rvo :"+rvo);
		
		if (rs.updateReply(rvo)) { 
		//	mv.setViewName("board/boardDetail");
			mv.addObject("update","result");
		} else { 
			mv.setViewName(null);
			mv.addObject(null);
		}
		mv.setViewName("jsonView");
		return mv;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― R4/게시글열람시 댓글도 함께 출력/김병우
	public List<ReplyVO> showReply(BoardVO bvo,PageVO pvo) {
		
		List<ReplyVO> rList = new ArrayList<ReplyVO>();
		System.out.println(bvo);
		
		rList = rs.showAllReply(pvo);
		System.out.println(bvo);
		
		return rList;
	}
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― R4/게시글열람시 댓글도 함께 출력/김병우
	@RequestMapping("showMyReply") //내가 쓴 글 보기
	public ModelAndView showMyReply(ModelAndView mv, PageVO pvo,HttpServletRequest request) {
		
		List<ReplyVO> myReply = new ArrayList<ReplyVO>();
		
		pvo.setP_id((String)request.getAttribute("USERID"));

		myReply = rs.showMyReply(pvo);
		
		if(myReply!=null) {
			mv.addObject("myReply", myReply);
			mv.setViewName("board/myReply");
		}else {
			mv.addObject("msg", "내글보기 실패");
			mv.setViewName("result");
		}
		return mv;
	}
	
}
