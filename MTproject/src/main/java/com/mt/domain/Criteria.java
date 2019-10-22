package com.mt.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	private int cityNum;
	private int seqNum;
	
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.cityNum = 99;
		this.seqNum = 99;
	}
	
	public Criteria(int pageNum, int amount,int cityNum,int seqNum) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.cityNum = cityNum;
		this.seqNum = seqNum;
	}
	
}
