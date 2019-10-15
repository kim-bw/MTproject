package com.mt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.SelectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ResultVO;
import com.mt.domain.StyleVO;
import com.mt.service.BodService;
import com.mt.service.RepService;
import com.mt.util.SystemClass;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/board")
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
	@RequestMapping("/insert.do")
	public String insert(RedirectAttributes ra, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.insert(bvo)) {
			ra.addFlashAttribute("result",bvo.getB_seq());
			return "redirect:/board/selectBoard?p_city="+bvo.getB_city()+"&p_select=1";
		} else {
			return "/";
		}
}


	@RequestMapping("/delete.do")
	public ModelAndView delete(ModelAndView mv, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.delete(bvo)) { 
			mv.setViewName("result");
			mv.addObject("msg","게시글이 삭제되었습니다.");
		} else { 
			mv.setViewName("result");
			mv.addObject("msg","게시글이 삭제를 실패하였습니다.");
		}
		return mv;
	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	
	@RequestMapping("/showUpdateBoardForm")
	public ModelAndView showUpdateBoardForm(ModelAndView mv, PageVO pvo) {
		
		//p_select(1~3)에 따라 쿼리문에 치환될 문자를 pvo에 셋팅
		pvo = SystemClass.selectBoardName(pvo);
		
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
	@RequestMapping("/updateBoard")
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
	@RequestMapping("/selectBoard")
	public ModelAndView selectBoard(ModelAndView mv,PageVO pvo,StyleVO svo) {
		
		
		pvo = SystemClass.selectBoardName(pvo);
		mv = SystemClass.selectViewName(mv, pvo);
		pvo = SystemClass.countPage(pvo,1,bs,rs);

		List<ResultVO> list = new ArrayList<ResultVO>();
		
		list = bs.list(pvo); 

		svo.setS_city(pvo.getP_city());
		svo = bs.selectStyle(svo);
	
		mv.addObject("pvo", pvo); //pvo 페이지 정보
		mv.addObject("svo", svo); //svo 스타일 정보
		mv.addObject("list", list); //list 게시판리스트
	
		return mv;
	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
//	@RequestMapping("/showDetailBoard")
//	public ModelAndView detailBoard(ModelAndView mv,PageVO pvo,HttpServletResponse response) {
//		
//		response.setContentType("text/html;charset=UTF-8");
//
//		//p_select에 따라 파라미터를 보낼 게시판을 선택해서 mv에 셋
//		mv = SystemClass.selectBoardView(mv, pvo);
//		
//		//p_select에 따라 mapper에서 문자열 치환에 필요한 selectname을 선택
//		pvo = SystemClass.selectName(pvo);
//		
//		//pvo의 정보에 따라 조건에 맞는 Rvo 1개 선택
//		//Rvo는 ResultVO이며 모든 게시판의 최하 자손 => 모든 멤버변수 사용가능 =>mapper에서 resultType으로 사용가능(mapper에서 resulttype은 1개만 사용가능해서 상속한 것임:우리는 1개 mapper에서 3개를 다룸)
//		ResultVO Rvo = bs.showDeatailBoard(pvo);
//		
//		//pvo의 정보에 따라 댓글개수 카운트 및 페이징 정보 세팅
//		pvo = SystemClass.countPage(pvo,3,bs,rs);
//		
//		//댓글의 ArrayList를 위한 생성
//		List<ReplyVO> list = new ArrayList<ReplyVO>();
//		
//		//mapper에서 해당 게시판종류-지역번호-글번호에 따른 댓글 선택하여 리스트에 저장
//		list = rs.showAllReply(pvo);
//		
//		if(list!=null) {
//			mv.addObject("list", list); //댓글 리스트
//			mv.addObject("Rvo", Rvo); //글1개 bvo
//			mv.addObject("pvo", pvo); //페이지 정보
//		}else {
//			mv.setViewName("result");
//			mv.addObject("msg", "상세글보기 실패");
//		}
//		
//		return mv;
//	}
	
	
	@RequestMapping("/areaMain") 
	public ModelAndView areaMain(ModelAndView mv,StyleVO svo) {
		
		svo = bs.selectStyle(svo);
		
		mv.addObject("svo", svo);
		mv.setViewName("board/areaMain");
		return mv;
		}
	
	
	@GetMapping("/register")
	public void register() {
	}
}
