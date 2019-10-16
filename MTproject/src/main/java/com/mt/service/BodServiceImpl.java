package com.mt.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mt.domain.BoardVO;
import com.mt.domain.PageVO;
import com.mt.domain.ReplyVO;
import com.mt.domain.ResultVO;
import com.mt.domain.StyleVO;

@Service("board")
public class BodServiceImpl implements BodService {

	@Autowired
	public SqlSessionTemplate sqlSession;

	private static final String namespace = "com.mt.service.BodServiceImpl.";
	
	@Override
	public boolean insert(BoardVO bvo) {
		return sqlSession.insert(namespace+"insert",bvo)==1;
	}
	
	@Override
	public boolean delete(BoardVO bvo) {
		return sqlSession.delete(namespace+"delete",bvo)==1;
	}
	
	@Override
	public boolean updateBoard(BoardVO bvo) {
		return sqlSession.update(namespace+"modify",bvo)==1;
	}
	
	@Override
	public List showMyBoard(PageVO pvo) {
		return sqlSession.selectList(namespace+"bMyBoard",pvo);
	}
	
	@Override
	public List<ResultVO> list(PageVO pvo) {
		return sqlSession.selectList(namespace+"list",pvo);
	}
	public boolean updateReply(ReplyVO rvo) {
		return sqlSession.update(namespace+"updateReply",rvo)==1;
	}
	
	//이게 왜 가능한 것인가?
	@Override
	public int totalRow(PageVO pvo) {
		return sqlSession.selectOne(namespace+"bTotalRow",pvo);
	}
	
	@Override
	public ResultVO read(PageVO pvo) {
		return sqlSession.selectOne(namespace+"read",pvo);
	}
	
	@Override
	public StyleVO selectStyle(StyleVO svo) {
		return sqlSession.selectOne(namespace+"selectStyle",svo);
	}
	
	@Override
	public int myTotalRow(PageVO pvo) {
		return sqlSession.selectOne(namespace+"bMyTotalRow",pvo);
	}
	
	@Override
	public boolean test() {
		return sqlSession.update(namespace+"test")==1;
	}
//-----------  이 아래는 test 공간입니다.---------------------------	
}
