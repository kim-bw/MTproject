package com.mt.util;

import org.springframework.web.servlet.ModelAndView;

import com.mt.domain.PageVO;
import com.mt.service.BodService;
import com.mt.service.RepService;

public class SystemClass {
	
	//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― bs-pvo : row카운팅과 페이지 셋팅
		public static PageVO countPage(PageVO pvo, int selectNum,BodService bs, RepService rs) {
			
			int currentPage = 1;
			int totalPage = 0;
			//현재 페이지가 1이 아니고 1보다 크면(=2~마지막 페이지 = 페이지를 클릭해서 들어왔을 경우)
			if(pvo.getP_curpage() > 1) {       
				currentPage = pvo.getP_curpage(); //현재페이지 = 클릭한 페이지 숫자  
			}					
			//1. pvo에 현제페이지 셋
			pvo.setP_curpage(currentPage);

			//db에 쓰일 시작 글 row번호
			//페이지당 10개를 가져올 것
			// 1페이지의 경우 1* 10 = 10 = row 10 번까지 가져옴
			//2.pvo에 시작하는 rownum 셋
			pvo.setP_start(pvo.getP_curpage() * pvo.getAmount());
			
			//끝나는row번호
			//1페이지의 경우 start=10 이므로 10 - 10 = 0
			//row 0번부터 10번까지 선택
			pvo.setP_end(pvo.getP_start() - pvo.getAmount()-1);
			
			//num=1 이면  게시글 카운팅
			//num=2이면 댓글 개수 카운팅
			//num=3이면 내 게시글 카운팅
			//num=4이면 내 댓글 카운팅
			
			switch (selectNum) {
			case 1: pvo.setP_totrow(bs.totalRow(pvo));break;
			case 2: pvo.setP_totrow(bs.myTotalRow(pvo));break;
			case 3: pvo.setP_totrow(rs.totalRow(pvo));break;
			case 4: pvo.setP_totrow(rs.myTotalRow(pvo));break;
			}
			
			totalPage = pvo.getP_totrow() / pvo.getAmount();
			if(pvo.getP_totrow() % pvo.getAmount() != 0) { 
				totalPage++; 
			}	
			//5.pvo에 전체 페이지 개수 셋
			pvo.setP_totpage(totalPage); //=totblock
			
			//책 내용
			//1.페이지의 끝 번호
			int total = pvo.getP_totrow();
			
			int endPage = (int)(Math.ceil(currentPage/10.0)*10);
			pvo.setP_endPage(endPage);
			
			//2.페이지의 시작번호
			int startPage = endPage-9;
			pvo.setP_startPage(startPage);
			
			//10페이지 미만일 경우 대비
			int realEnd = (int)(Math.ceil( (total*1.0) / 10) );
			
			if(realEnd < pvo.getP_endPage()) {
				pvo.setP_endPage(realEnd);
			}
			boolean prev = startPage > 1;
			pvo.setP_pre(prev);
			
			boolean next = endPage < realEnd;
			pvo.setP_next(pvo.getP_endPage()<realEnd);
			
			return pvo;
		}
		
	//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 로그아웃 : 세션 종료시킴

	public static PageVO selectBoardName(PageVO pvo) {
			
			switch (pvo.getP_select()) {
			case 1: pvo.setP_selectname("board");break;
			case 2: pvo.setP_selectname("food");break;
			case 3: pvo.setP_selectname("place");break;
			}
			return pvo;
		}
	//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 로그아웃 : 세션 종료시킴
	public static ModelAndView selectListView(ModelAndView mv,PageVO pvo) {
			
			switch (pvo.getP_select()) {
			case 1: mv.setViewName("board/freeBoard"); break;
			case 2: mv.setViewName("board/foodBoard"); break;
			case 3: mv.setViewName("board/placeBoard"); break;
			}
			return mv;
		}
	//――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 로그아웃 : 세션 종료시킴
	public static ModelAndView selectReadView(ModelAndView mv,PageVO pvo) {
		
		switch (pvo.getP_select()) {
		case 1: mv.setViewName("board/freeDetail"); break;
		case 2: mv.setViewName("board/foodDetail"); break;
		case 3: mv.setViewName("board/placeDetail"); break;
		}
		return mv;
	}
	
	}
