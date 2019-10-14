package com.mt.domain;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FoodVO extends BoardVO{

	private int f_city;
	private int f_seq;
	private int f_select;
	private String f_name;
	private String f_address;
	private String f_detailaddress;
	private int f_good;
	private int f_bad;
	private int f_point;
	private int f_rank;
	private MultipartFile f_upimafge;
	private String f_adrimage;
	
}
