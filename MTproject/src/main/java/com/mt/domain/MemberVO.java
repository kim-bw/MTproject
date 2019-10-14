package com.mt.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {

	private String m_id; 			//id
	private String m_password;	//password
	private String m_name;		//이름
	private String m_tel;//전화번호**
	private String m_postcode;		//우편번호
	private String m_roadcode;		//도로주소
	private String m_detailaddress;		//상세주소
	private String m_birth;		//생일**
	private String m_grade;		//class,등급 등
	private int m_level;			//레벨
	private int m_suc;			//성공수
	private int m_fail;			//실패수
	private String m_adrimage;	//사진주소
	private MultipartFile m_upimage; //사진파일
	private String m_enabled;
	private List<AuthVO> m_authList;

	
	}
