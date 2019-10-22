package com.mt.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private int b_city;           
	private int b_seq;
	private String b_title;		
	private String b_id;			
	private Date b_date;		//글쓴날짜	
	private String b_content;		//글내용
	private int b_cnt;			
	private String b_adrimage;		//이미지 주소
	private Date b_updateDate;
	private int b_reply; //댓글 수
	private MultipartFile b_upimage;	//이미지파일
	
	
	
}
