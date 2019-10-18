package com.mt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class PageVO {

	private Criteria cri;
	private int cityNum;
	
	private int p_city;
	private int p_seq;
	private int p_select;
	private String p_name;
	private String p_id;
	private String p_selectname;
	private int p_savePage;
	private int p_curpage; //현재보고 있는 페이지
	private int p_totrow; //전체 게시글 수
	private int p_totpage; //전체 페이지
	private int p_startPage; // totalbolck의 1번 페이지
	private int p_endPage; // totalbolck의 1번 페이지
	 private int p_start; //
	private int p_end;
	private boolean p_pre, p_next;
	
	public PageVO() {
		this.cri = new Criteria();
	}
	
}
	
	
