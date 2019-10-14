//회원가입,정보수정,탈퇴,로그인,로그아웃,개인미션정보 등을 위한 고객 중심 컨트롤러

package com.mt.service;

import com.mt.domain.MemberVO;

public interface MemService {

	public MemberVO checkLogin(MemberVO vo);

	public MemberVO showDetailMember(MemberVO vo);

	public boolean joinMember(MemberVO vo);

	public boolean deleteMember(MemberVO vo);

	public boolean updateMember(MemberVO vo);
	
	public MemberVO securityFindName(String userName);
//-----------  이 아래는 test 공간입니다.---------------------------
}