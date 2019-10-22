//자유,푸드,여행지게시판의 호출 및 입력,수정,삭제 및 상세보기 기능

package com.mt.service;

import java.util.HashMap;
import java.util.List;

import com.mt.domain.BoardVO;
import com.mt.domain.Criteria;
import com.mt.domain.FoodVO;
import com.mt.domain.PageVO;
import com.mt.domain.PlaceVO;
import com.mt.domain.ReplyVO;
import com.mt.domain.ResultVO;
import com.mt.domain.StyleVO;


public interface BodService {

	public boolean insert(BoardVO bvo);

	public boolean updateReply(ReplyVO rvo);
	
	public boolean test();
//-----------  이 아래는 병우인증 공간입니다.---------------------------
	public StyleVO selectStyle(int cityNum);
	
	public List<BoardVO> selectFree(Criteria cri);
	
	public List<FoodVO> selectFood(Criteria cri);
	
	public List<PlaceVO> selectPlace(Criteria cri);
	
	public int freeTotalCount(Criteria cri);
	
	public int foodTotalCount(Criteria cri);
	
	public int placeTotalCount(Criteria cri);
	
	public BoardVO readFree(Criteria cri);
	
	public FoodVO readFood(Criteria cri);
	
	public PlaceVO readPlace(Criteria cri);

	public boolean delete(Criteria cri);
	
	public boolean updateBoard(BoardVO bvo);
	
}