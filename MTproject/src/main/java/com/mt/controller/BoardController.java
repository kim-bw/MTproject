package com.mt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;
import com.mt.domain.ResultVO;
import com.mt.domain.StyleVO;
import com.mt.service.BodService;
import com.mt.service.RepService;
import com.mt.util.SystemClass;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
public class BoardController {

	@Autowired
	@Qualifier("board")
	public BodService bs;
	
	@Autowired
	@Qualifier("reply")
	public RepService rs;
	
	//int로 return되는 결과값 저장용
	public int result;

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	인증/로그인상태
	@RequestMapping("/insertBoard")
	public ModelAndView insertBoard(ModelAndView mv, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.insertBoard(bvo)) { 
			mv.setViewName("result");
			mv.addObject("msg","글 등록 성공");
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","글 등록 실패");
		}
		return mv;
}


	@RequestMapping("deleteBoard")
	public ModelAndView deleteBoard(ModelAndView mv, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.deleteBoard(bvo)) { 
			mv.setViewName("result");
			mv.addObject("msg","게시글이 삭제되었습니다.");
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","게시글이 삭제를 실패하였습니다.");
		}
		return mv;
	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	
	@RequestMapping("showUpdateBoardForm")
	public ModelAndView showUpdateBoardForm(ModelAndView mv, PageVO pvo) {
		
		//p_select(1~3)에 따라 쿼리문에 치환될 문자를 pvo에 셋팅
		pvo = SystemClass.selectName(pvo);
		
		BoardVO bvo = bs.showDeatailBoard(pvo);

		if (bvo!=null) { 
			mv.setViewName("board/updateForm");
			mv.addObject("bvo",bvo);
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","게시글 불러오기 실패");
		}
		return mv;
	}
	
//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	
	@RequestMapping("updateBoard")
	public ModelAndView updateBoard(ModelAndView mv, BoardVO bvo) {
		
		//오류방지 : b_adrimage가 null이면 noimage 삽입해서 오류방지
		if(bvo.getB_adrimage()==null) {
			bvo.setB_adrimage("noimage");
		}
		
		log.info("bvo :"+bvo);

		if (bs.updateBoard(bvo)) {
			mv.setViewName("result");
			mv.addObject("msg", "게시글 수정에 성공하였습니다.");
		} else {
			mv.setViewName("result");
			mv.addObject("msg", "게시글 수정 실패");
		}
		return mv;

	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	
	@RequestMapping("selectBoard")
	public ModelAndView selectBoard(ModelAndView mv,PageVO pvo,StyleVO svo) {
		
		List<ResultVO> list = new ArrayList<ResultVO>();
		
		//p_select에 따라 p_selectname이 셋팅되어 문자열치환
		pvo = SystemClass.selectName(pvo);
		
		//p_select에 따라 파라미터를 보낼 게시판을 선택하여 setView
		mv = SystemClass.selectAreaView(mv, pvo);

		//p_curPage에 따라 전체 게시글 수와 페이징 정보 세팅
System.out.println(pvo);
		pvo = SystemClass.countPage(pvo,1,bs,rs);
System.out.println(pvo);
		//pvo의 정보에 따라 게시글 list 리턴
		list = bs.showAllBoard(pvo); 
		
		//p_city에 따라 지역에 따른 스타일 선택
		svo = bs.selectStyle(pvo);
	
		mv.addObject("pvo", pvo); //pvo 페이지 정보
		mv.addObject("svo", svo); //svo 스타일 정보
		mv.addObject("list", list); //list 게시판리스트
	
		return mv;
	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
	@RequestMapping("showDetailBoard")

	public ModelAndView detailBoard(ModelAndView mv,PageVO pvo,HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");

		//p_select에 따라 파라미터를 보낼 게시판을 선택해서 mv에 셋
		mv = SystemClass.selectBoardView(mv, pvo);
		
		//p_select에 따라 mapper에서 문자열 치환에 필요한 selectname을 선택
		pvo = SystemClass.selectName(pvo);
		
		//pvo의 정보에 따라 조건에 맞는 Rvo 1개 선택
		//Rvo는 ResultVO이며 모든 게시판의 최하 자손 => 모든 멤버변수 사용가능 =>mapper에서 resultType으로 사용가능(mapper에서 resulttype은 1개만 사용가능해서 상속한 것임:우리는 1개 mapper에서 3개를 다룸)
		ResultVO Rvo = bs.showDeatailBoard(pvo);
		
		//pvo의 정보에 따라 댓글개수 카운트 및 페이징 정보 세팅
		pvo = SystemClass.countPage(pvo,3,bs,rs);
		
		//댓글의 ArrayList를 위한 생성
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		
		//mapper에서 해당 게시판종류-지역번호-글번호에 따른 댓글 선택하여 리스트에 저장
		list = rs.showAllReply(pvo);
		
		if(list!=null) {
			mv.addObject("list", list); //댓글 리스트
			mv.addObject("Rvo", Rvo); //글1개 bvo
			mv.addObject("pvo", pvo); //페이지 정보
		}else {
			mv.setViewName("result");
			mv.addObject("msg", "상세글보기 실패");
		}
		
		return mv;
	}
	
//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
	@RequestMapping("showMyBoard")
	public ModelAndView showMyBoard(ModelAndView mv, PageVO pvo,HttpServletRequest request) {
		
		List<BoardVO> myList = new ArrayList<BoardVO>();

		pvo.setP_id((String)request.getAttribute("USERID"));
		
		myList = bs.showMyBoard(pvo);
		
		if(myList!=null) {
			mv.addObject("myList", myList);
			mv.setViewName("board/myBoard");
		}else {
			mv.addObject("msg", "내글보기 실패");
			mv.setViewName("result");
		}
		return mv;
	}
		
//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 내 정보 페이지 보기

		

}
