package com.mt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mt.domain.BoardVO;
import com.mt.domain.Criteria;
import com.mt.domain.PageVO;
import com.mt.service.BodService;
import com.mt.service.RepService;

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

	
	@RequestMapping("/areaMain")
	public ModelAndView area(ModelAndView mv, Criteria cri) {
		mv.setViewName("/board/areaMain");
		return mv;
	}
	
	
	//in : cityNum, pageNum, select
	@RequestMapping("/selectBoard")
	public ModelAndView selectbo(ModelAndView mv, Criteria cri,int select) {
		int total =0;
		switch (select) {
		case 1: 
			total = bs.freeTotalCount(cri);
			mv.addObject("result", bs.selectFree(cri));
			mv.setViewName("/board/freeBoard");
			break;
		case 2: 
			total = bs.foodTotalCount(cri);
			mv.addObject("result", bs.selectFood(cri));
			mv.setViewName("/board/foodBoard");
			break;
		case 3: 
			total = bs.placeTotalCount(cri);
			mv.addObject("result", bs.selectPlace(cri));
			mv.setViewName("/board/placeBoard");
			break;
		}
		mv.addObject("pvo", new PageVO(cri,total));
		return mv;
	}
	
	@RequestMapping({"/read.do","modifyForm"})
	public ModelAndView read(ModelAndView mv,Criteria cri,int select) {
		
		switch (select) {
		case 1: mv.addObject("result", bs.readFree(cri)); 
				mv.setViewName("/board/freeDetail");	break;
		case 2: mv.addObject("result", bs.readFood(cri));
				mv.setViewName("/board/foodDetail");	break;
		case 3: mv.addObject("result", bs.readPlace(cri));
				mv.setViewName("/board/placeDetail");	break;
		case 11: mv.addObject("result", bs.readFree(cri));
				 mv.setViewName("/board/modifyForm");	break;
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
	
	@RequestMapping("/remove.do")
	public String delete(RedirectAttributes ra, Criteria cri) {
		
		if (bs.delete(cri)) { 
			ra.addFlashAttribute("remove", cri.getSeqNum());
			return "redirect:/board/selectBoard?cityNum="+cri.getCityNum()+"&select=1";
		} else { 
			return "/";
		}
	}
		
	
}
