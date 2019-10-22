package com.mt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class PageVO {

	private Criteria cri;
	private boolean prev, next;
	private int startPage;
	private int endPage;
	private int total;
	
	public PageVO(Criteria cri,int total) {
		
		//pageNum, amount
		this.cri = cri;
		//최대 row 값
		this.total = total;
		//마지막페이지 = ceil은 소수점 자리를 올림한다. = 원하는 페이지 번호를 10으로 나눈 후 버림 후 10을 곱합
		//예)2페이지 = 2 / 10 = 0.2 올림-> 1 * 10 = 10 = 보여질때는 1~10까지 숫자 나열
		//예)1페이지 = 1 / 10 = 0.1 올림 -> 1*10 = 10 = 보여질때는 1~10까지 숫자 나열
		//10이하는 모두 10페이지가 마지막 페이지가 됨
		//예) 22 = 22/10 = 2.2 올림 -> 3 * 10 = 30 = 보여질때는 20~30까지 숫자 나열
		this.endPage = (int)(Math.ceil( cri.getPageNum() / 10.0) ) * 10;
		
		//위 예제대로 스타트 페이지 확인해보기
		//예)2페이지 = 10 - 9 = 1 : 1~10까지 나열
		//예)1페이지 = 10 - 9 = 1 : 1~10까지 나열
		//예)22페이지 = 30 - 9 = 21 : 21~30까지 나열
		this.startPage = this.endPage - 9;
		
		//예 : 글이 11개인 경우.
		// 11 * 1.0 = 11 / 10 = 1.1 ceil올림적용해서 2가됨. 마지막 페이지는 2가 되어야 함
		//글이 55개인 경우 = 55 * 1.0  = 5.5 -> 6
		//글이 245개인 경우 = 245*1.0 = 245 / 10 = 24.5 ceil-> 25
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		//예. 글이 11개라고 했을 때 실제 페이지는 2가 되어야 함
		// realEnd이전 endpage는 total값이 적용되지 않은 값이므로 
		//현재페이지가 1이 들어오면 10이 되고 22가 들어오면  30이 됌
		//1~ -> 10
		//11~ -> 20
		//21~ - > 30
		//이 결과에 토탈값을 적용해서 비교함
		//realEnd가 10보다 작다면 = total값을 적용해 계산한 값이 10보다 작다면
		//예) 토탈 11개 -> 2  : 10  2가 작으므로 2를 적용
		//예) 토탈 245개인 경우에서 2페이지를 누를 경우
		// endpage = 10
		// startpage = 1
		// realEnd = 25
		//realEnd가 더 크므로 변동 없음 => 기존 endpage는 2가 됌
		// 11페이지를 누를 경우
		// endpage = 20
		// startpage = 11
		// realEnd = 25 는 변하지 않는다.
		// 21페이지를 누를 경우
		// endpage = 30 //실제로 없음
		// startpage = 21
		// realEnd = 25 는 변하지 않는다. endpage가 30으로 커졌다. 예외상황 발생.->realEnd 적용
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1; //스타트블록숫자가 1이 아니고 1보다 크면 활성화. 즉 2번째 블록이라는 뜻. 21~30 구간. 스타트블록이 1일때는 뒤로가기가 없다.
		this.next = this.endPage < realEnd; //real은 실제 마지막 페이지이므로 이것보다 작다는 것은 마지막 구간 미만이라는 뜻. 그러므로 아직 next할 구간이 남아있다는 것
	
	}
	
	
}
	
	
