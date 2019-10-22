package com.mt.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mt.domain.BoardVO;
import com.mt.domain.Criteria;
import com.mt.domain.FoodVO;
import com.mt.domain.PageVO;
import com.mt.domain.PlaceVO;
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

	public boolean updateReply(ReplyVO rvo) {
		return sqlSession.update(namespace+"updateReply",rvo)==1;
	}
	
	@Override
	public boolean test() {
		return sqlSession.update(namespace+"test")==1;
	}
//-----------  이 아래는 test 공간입니다.---------------------------
	
	@Override
	public boolean updateBoard(BoardVO bvo) {
		return sqlSession.update(namespace+"modify",bvo)==1;
	}
	
	@Override
	public boolean delete(Criteria cri) {
		return sqlSession.delete(namespace+"delete",cri)==1;
	}
	
	public StyleVO selectStyle(int cityNum) {
		return sqlSession.selectOne(namespace+"selectStyle",cityNum);
	}
//----------------------------------------------------------------------------------
	public List<BoardVO> selectFree(Criteria cri) {
		return sqlSession.selectList(namespace+"selectFree",cri);
	}
	public List<FoodVO> selectFood(Criteria cri) {
		return sqlSession.selectList(namespace+"selectFree",cri);
	}
	public List<PlaceVO> selectPlace(Criteria cri) {
		return sqlSession.selectList(namespace+"selectFree",cri);
	}
//--------------------------------------------------------------------------------------------
	public int freeTotalCount(Criteria cri) {
		return sqlSession.selectOne(namespace+"freeTotalCount",cri);
	}
	public int foodTotalCount(Criteria cri) {
		return sqlSession.selectOne(namespace+"foodTotalCount",cri);
	}
	public int placeTotalCount(Criteria cri) {
		return sqlSession.selectOne(namespace+"placeTotalCount",cri);
	}
//--------------------------------------------------------------------------------------------
	public BoardVO readFree(Criteria cri) {
		return sqlSession.selectOne(namespace+"readFree",cri);
	}
	public FoodVO readFood(Criteria cri) {
		return sqlSession.selectOne(namespace+"readFood",cri);
	}
	public PlaceVO readPlace(Criteria cri) {
		return sqlSession.selectOne(namespace+"readPlace",cri);
	}
//--------------------------------------------------------------------------------------------

}
