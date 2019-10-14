//댓글 입력,수정,삭제,호출을 위한 컨트롤러

package com.mt.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;

public interface RepService {

	public void insertReply(ReplyVO vo);

	public boolean deleteReply(ReplyVO vo);

	public boolean updateReply(ReplyVO vo);

	public List<ReplyVO> showMyReply(PageVO pvo);

	public int totalRow(PageVO pvo);
	
	public List<ReplyVO> showAllReply(PageVO pvo);

	public int changeRoot(ReplyVO rvo);

	public int myTotalRow(PageVO pvo);

	//-----------  이 아래는 test 공간입니다.---------------------------
	
}