//자유,푸드,여행지게시판의 호출 및 입력,수정,삭제 및 상세보기 기능

package com.mt.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;
import com.mt.domain.ResultVO;
import com.mt.domain.StyleVO;


public interface BodService {

	public boolean insert(BoardVO bvo);

	public boolean delete(BoardVO bvo);

	public boolean updateBoard(BoardVO vo);

	public List<BoardVO> showMyBoard(PageVO pvo);

	public List<ResultVO> list(PageVO pvo);

	public int totalRow(PageVO pvo);

	public ResultVO showDeatailBoard(PageVO pvo);

	public StyleVO selectStyle(StyleVO svo);

	public int myTotalRow(PageVO pvo);

	public boolean updateReply(ReplyVO rvo);
	
	public boolean test();
//-----------  이 아래는 test 공간입니다.---------------------------

}