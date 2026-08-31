package com.springboot.Pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.Pilotproject.dto.memberDTO;

@Mapper
public interface ImemberDAO {
	//로그인용 조회
	public memberDTO findById(String mid);
	
	// 회원 조회
	public List<memberDTO> memberList();
	
	// 회원 정보(마이프로필) 상세보기
	public memberDTO memberView(int mno);
	
	// 회원 가입
	public int memberWrite(memberDTO dto);
	
	// 회원정보(마이프로필) 수정
	public int memberUpdate(memberDTO dto);
	
	// 회원 탈퇴
	public int memberDelete(String mid);
}
