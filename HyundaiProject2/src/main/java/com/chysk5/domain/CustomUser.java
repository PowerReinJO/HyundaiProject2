package com.chysk5.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

/*********************************
 * @function : CustomUser
 * @author : Sujin Shin
 * @Date : Jan 01. 2023.
 * 시큐리티 설정을 위한 회원 정보
*********************************/
@Getter
public class CustomUser extends User{

	private static final long serialVersionUID = 1L;
	
	private MemberDTO member;
	
	public CustomUser(String username,String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO dto) {
		
		super(dto.getMem_id(), dto.getMem_pwd(), dto.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));
		
		this.member = dto;
	}
}
