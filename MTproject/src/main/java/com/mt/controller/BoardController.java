package com.mt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;
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

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	글등록/로그인된 누구나
	@RequestMapping("/insert.do")
	public String insert(RedirectAttributes ra, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.insert(bvo)) {
			ra.addFlashAttribute("insert",bvo.getB_seq());
			return "redirect:/board/selectBoard?p_city="+bvo.getB_city()+"&p_select=1";
		} else {
			return "/";
		}
}


	@RequestMapping("/remove.do")
	public String delete(RedirectAttributes ra, BoardVO bvo,HttpServletRequest request) {
		
		bvo.setB_id((String)request.getAttribute("USERID"));
		
		if (bs.delete(bvo)) { 
			ra.addFlashAttribute("remove", bvo.getB_seq());
			return "redirect:/board/selectBoard?p_city="+bvo.getB_city()+"&p_select=1";
		} else { 
			return "/";
		}
	}

//―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――	
	@RequestMapping("/showUpdateBoardForm")
	public ModelAndView showUpdateBoardForm(ModelAndView mv, PageVO pvo) {
		
		//p_select(1~3)에 따라 쿼리문에 치환될 문자를 pvo에 셋팅
		pvo = SystemClass.selectBoardName(pvo);
		
		BoardVO bvo = bs.read(pvo);

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
	@RequestMapping("/modify.do")
	public ModelAndView update(ModelAndView mv, BoardVO bvo) {

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
		
		//pvo.p_select으로 pvo.selectName 선택
		pvo = SystemClass.selectBoardName(pvo);
		//pvo.p_select으로 게시판 리스트 view선택
		mv = SystemClass.selectListView(mv, pvo);
		//페이지 계산
		pvo = SystemClass.countPage(pvo,1,bs,rs);

		List<ResultVO> list = new ArrayList<ResultVO>();
		
		list = bs.list(pvo); 

		svo.setS_city(pvo.getP_city());
		svo = bs.selectStyle(svo);
	
		log.info("pvo == : "+pvo);
		
		mv.addObject("pvo", pvo); //pvo 페이지 정보
		mv.addObject("svo", svo); //svo 스타일 정보
		mv.addObject("list", list); //list 게시판리스트
	
		return mv;
	}

	@RequestMapping({"/read.do","/modify"})
	public ModelAndView read(ModelAndView mv,PageVO pvo,HttpServletResponse response,HttpServletRequest request) {
		
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		
		String url = urlPathHelper.getOriginatingRequestUri(request);
		
		log.info("url : "+url);
		
		if(url.equals("/board/read.do")) {
			mv = SystemClass.selectReadView(mv, pvo);
		}else {
			mv.setViewName("board/modifyForm");
		}

		response.setContentType("text/html;charset=UTF-8");

		//p_select에 따라 파라미터를 보낼 게시판을 선택해서 mv에 셋
		
		log.info("input pvo==="+pvo);
		
		
		//p_select에 따라 mapper에서 문자열 치환에 필요한 selectname을 선택
		pvo = SystemClass.selectBoardName(pvo);
		
		//pvo의 정보에 따라 조건에 맞는 Rvo 1개 선택
		//Rvo는 ResultVO이며 모든 게시판의 최하 자손 => 모든 멤버변수 사용가능 =>mapper에서 resultType으로 사용가능(mapper에서 resulttype은 1개만 사용가능해서 상속한 것임:우리는 1개 mapper에서 3개를 다룸)
		ResultVO Rvo = bs.read(pvo);
		
		//pvo의 정보에 따라 댓글개수 카운트 및 페이징 정보 세팅
		pvo = SystemClass.countPage(pvo,3,bs,rs);
		
		//댓글의 ArrayList를 위한 생성
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		
		//mapper에서 해당 게시판종류-지역번호-글번호에 따른 댓글 선택하여 리스트에 저장
		list = rs.showAllReply(pvo);
		
		
		log.info("view=>"+mv.getViewName());
		log.info("list : "+list);
		log.info("Rvo : "+Rvo);
		log.info("pvo : "+pvo);
		
		
		if(list!=null) {
			mv.addObject("list", list); //댓글 리스트
			mv.addObject("Rvo", Rvo); //글1개 bvo
			mv.addObject("pvo", pvo); //페이지 정보
		}else {
			mv.setViewName("/");
		}
		
		return mv;
	}
	
	@GetMapping("/insertForm")
	public void insertForm() {
	}
	
	
	//////////////////////////////////////////////////////////////////
	@RequestMapping("/areaMain")
	public ModelAndView area(ModelAndView mv, @ModelAttribute("cityNum") int cityNum) {
		
		StyleVO svo = bs.selectStyle(cityNum);
		mv.addObject("svo", svo);
		mv.setViewName("/board/areaMain");
		return mv;
	}
	
	@RequestMapping("/freeBoard")
	public ModelAndView free(ModelAndView mv, PageVO pvo) {
		log.info("확인  "+pvo);
		List<BoardVO> freelist = bs.selectFree(1);
		return mv;
	}

}
