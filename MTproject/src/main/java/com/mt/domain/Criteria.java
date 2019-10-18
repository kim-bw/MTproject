package com.mt.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	private int cityNum;
	
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.cityNum = 0;
	}
	
	public Criteria(int pageNum, int amount,int cityNum) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.cityNum = cityNum;
	}
	
}
