package com.mt.domain;

import lombok.Data;

@Data
public class PageVO {

	
	private int p_city;
	private int p_seq;
	private int p_select;
	private String p_name;
	private String p_id;
	private String p_selectname;
	private int p_curpage; //현재보고 있는 페이지
	private int p_totrow; //전체 게시글 수
	private int p_totpage; //전체 페이지
	private static final int P_ONEPAGE = 10; // 한 페이지당 보여줄 글의 수
	private int p_startPage; // totalbolck의 1번 페이지
	private int p_endPage; // totalbolck의 1번 페이지
	private int p_start; //
	private int p_end;
	private boolean pre, next;
	
	public static final int getpOnepage() {
		return P_ONEPAGE;
	}
	
	
}
