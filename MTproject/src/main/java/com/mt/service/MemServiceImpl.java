//회원가입,정보수정,탈퇴,로그인,로그아웃,개인미션정보 등을 위한 고객 중심 컨트롤러

package com.mt.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mt.domain.CustomUser;
import com.mt.domain.MemberVO;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service("member")
public class MemServiceImpl implements MemService, UserDetailsService {

	private static final String namespace = "com.mt.service.MemServiceImpl.";

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	
	//security를 위한 userName을 검색하기 위한 Service
	//UserDetailsService 구현 -> 메서드 loadUserByUsername 활성화
	//이 방법은 기존에 있던 MemberVO를 확장시켜 UserDetail로 사용할 수 있게끔 하기 때문에
	//일단 userName을 파라미터로 받아 mt_member에서 정확한 유저 정보(MemberVO)를 찾아와
	//CustomUser의 생성자 파라미터로 넣는다.
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userName);
		
		//1. username을 파라미터로 받아 같은 이름을 가진 고객정보를 리턴한다.
		MemberVO mvo = securityFindName(userName);
		
		//해당 mvo가 null이면 null리턴. null이 아니면 제대로 찾았으므로 CustomUser 생성자에 넣어 UserDetail type객체를 만들어 리턴한다.
		return mvo == null ? null : new CustomUser(mvo);
	}
	
	@Override
	//username으로 정확한 mvo를 찾는다.
	public MemberVO securityFindName(String userName) {
		return sqlSession.selectOne(namespace+"securityFindName",userName);
	}
	
	@Override
	public MemberVO checkLogin(MemberVO vo) {
		return sqlSession.selectOne(namespace+"mLogin",vo);
	}
	@Override
	public boolean joinMember(MemberVO vo) {
		return sqlSession.insert(namespace+"mJoin",vo)==1;
	}
	@Override
	public MemberVO showDetailMember(MemberVO vo) {
		return sqlSession.selectOne(namespace+"mDetail",vo);
	}
	@Override
	public boolean deleteMember(MemberVO vo) {
		return sqlSession.delete(namespace+"mDelete",vo)==1;
	}
	@Override
	public boolean updateMember(MemberVO vo) {
		return sqlSession.update(namespace+"mUpdate",vo)==1;
	}
	
//-----------  이 아래는 test 공간입니다.---------------------------	
	
}
