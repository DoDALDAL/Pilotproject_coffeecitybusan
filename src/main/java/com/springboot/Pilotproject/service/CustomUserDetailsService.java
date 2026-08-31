package com.springboot.Pilotproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.Pilotproject.dao.ImemberDAO;
import com.springboot.Pilotproject.dto.memberDTO;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private ImemberDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		memberDTO dto = dao.findById(username);
		
		if(dto == null) {
			throw new UsernameNotFoundException("사용자가 없습니다.");
		}
		
		return User.builder()
				   .username(dto.getMid())
				   .password(dto.getMpasswd())
				   .roles(dto.getMauthority())	   
				   .build();
	}
}
