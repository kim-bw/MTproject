package com.mt.domain;
import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO{

	private int r_city;
	private int r_seq;
	private int r_select;
	private int r_num;
	private String r_id;
	private String r_content;
	private Date r_date;
	private Date r_updateDate;
	private int r_root;
	private int r_step;
	
	
}
