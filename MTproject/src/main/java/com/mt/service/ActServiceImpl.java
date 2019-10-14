//미션 등 여러가지 게임 요소를 작동을 위한 컨트롤러

package com.mt.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mt.domain.PlaceVO;

@Service("action")
public class ActServiceImpl implements ActService {

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	//mapper 위치
	private static final String namespace = "com.mt.service.ActServiceImpl.";
	
	@Override
	public List<PlaceVO> goMission(){
		return sqlSession.selectList(namespace+"aGoMission");
	}
	
}
