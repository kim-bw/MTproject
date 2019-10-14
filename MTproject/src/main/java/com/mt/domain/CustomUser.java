package com.mt.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	
	private static final long serialVersionUID = -5408544335460915387L;
	
	private MemberVO mvo;

	//부모 클래스를 호출해야만 객체를 생성할 수 있다.
	//기본 필수 파라미터로 짜여진 기본 생성자
	public CustomUser(String username, String password,Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	//mvo에 기본 필수 파라미터가 모두 포함(필수+주소,전화번호 등)되어 있으므로
	//MemberVO를 파라미터로 하는 오버로드된 생성자 메서드
	//membervo에서 필수 정보를 get해서 super부모클래스 생성자로 호출하고
	//CustomUser객체의 mvo를 활성화한다.(service 맞는 mvo를 찾아옴)
	//즉 CustomUser객체의 .getMemberVO() 메서드를 실행하면 MemberVO가 리턴됨
	
	public CustomUser(MemberVO mvo) {
		super(mvo.getM_id(), mvo.getM_password(),mvo.getM_authList().stream() 
				.map(auth ->new SimpleGrantedAuthority(auth.getA_auth())).
				collect(Collectors.toList()));
		this.mvo = mvo;
		
	}
	
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		return super.getAuthorities();
	}

	@Override
	public String getPassword() {
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		return super.getUsername();
	}

	@Override
	public boolean isEnabled() {
		return super.isEnabled();
	}

	@Override
	public boolean isAccountNonExpired() {
		return super.isAccountNonExpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		return super.isAccountNonLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return super.isCredentialsNonExpired();
	}

	@Override
	public void eraseCredentials() {
		super.eraseCredentials();
	}

}
