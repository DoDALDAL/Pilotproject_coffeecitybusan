package com.springboot.Pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.Pilotproject.dto.productDTO;

@Mapper
public interface IproductDAO {
	//상품 조회(select)
	public List<productDTO> productList();
	
	//상품 상세보기(select)
	public productDTO productView(int pno);
	
	//상품 등록(insert)
	public int productWrite(productDTO dto);
	
	//상품 정보 수정(update)
	public int productUpdate(productDTO dto);
	
	//상품 삭제(delete)
	public int productDelete(int pno);
	
	//best 상품 조회
	public List<productDTO> productBest();
}
