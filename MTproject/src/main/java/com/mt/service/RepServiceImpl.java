//댓글 입력,수정,삭제,호출을 위한 컨트롤러

package com.mt.service;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Log4j
@Service("reply")
public class RepServiceImpl implements RepService {

	@Autowired
	public SqlSessionTemplate ss;
	
	private static final String namespace = "com.mt.service.RepServiceImpl.";
	
	@Override
	@Transactional
	public void insertReply(ReplyVO rvo) {
		ss.update("com.mt.service.BodServiceImpl."+"test");
		ss.update(namespace+"rInsert",rvo);
		log.info("종료");
	}
	
	@Override
	public boolean deleteReply(ReplyVO rvo) {
		return ss.delete(namespace+"rDelete",rvo)==1;
	}
	@Override
	public boolean updateReply(ReplyVO rvo) {
		return ss.update(namespace+"rUpdate",rvo)==1;
	}
	@Override
	public List<ReplyVO> showMyReply(PageVO pvo) {
		return ss.selectList(namespace);
	}
	@Override
	public List<ReplyVO> showAllReply(PageVO pvo) {
		return ss.selectList(namespace+"rAllReply",pvo);
	}
	@Override
	public int totalRow(PageVO pvo) {
		return ss.selectOne(namespace+"rTotalRow",pvo);
	}
	@Override
	public int changeRoot(ReplyVO rvo) {
		return ss.update(namespace+"rChangeRoot",rvo);
	}
	@Override
	public int myTotalRow(PageVO pvo) {
		return ss.selectOne(namespace+"rMyTotalRow",pvo);
	}
	
//-----------  이 아래는 test 공간입니다.---------------------------
	
}
