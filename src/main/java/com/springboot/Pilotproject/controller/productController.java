package com.springboot.Pilotproject.controller;

import java.io.File;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.Pilotproject.dao.ImemberDAO;
import com.springboot.Pilotproject.dao.IproductDAO;
import com.springboot.Pilotproject.dto.memberDTO;
import com.springboot.Pilotproject.dto.productDTO;

@Controller
public class productController {
	@Autowired
	private IproductDAO dao;
	
	@Autowired
	private ImemberDAO mdao;
	
	@RequestMapping("/admin/productWriteForm")
	public String productWriteForm(Model model) {
		return "admin/productWriteForm";
	}
	
	@RequestMapping("/admin/productWrite")
	public String productWrite(@RequestParam("pupload") MultipartFile pupload,
							   @RequestParam(value="pflavor", required=false) String[] pflavor,
							   @RequestParam(value="proastingLevel", required=false) String[] proastingLevel,
							   @RequestParam(value="pcontent", required=false) String[] pcontent,
							   productDTO dto,
							   Principal principal) throws Exception {

		
		if(pflavor != null && proastingLevel != null && pcontent != null) {
			dto.setPflavor(String.join(",", pflavor));
			dto.setProastingLevel(String.join(",", proastingLevel));
			dto.setPcontent(String.join(",", pcontent ));
		}
		
		
		//로그인한 관리자 이이디
		String mid = principal.getName();
		
		//관리자 정보 조회
		memberDTO mdto = mdao.findById(mid);
		
		//상품 등록자 번호 자동 세팅
		dto.setMno(mdto.getMno());
		
		if(!pupload.isEmpty()) {
			String pimage = pupload.getOriginalFilename();
			
			pupload.transferTo(new File("C:\\SPRINGBOOT\\Pilotproject\\src\\main\\resources\\static\\images\\product\\"+pimage));
			dto.setPimage(pimage);
		}
		
		
		dao.productWrite(dto);
		
		return "redirect:/admin/productList";
	}
	
	@RequestMapping("/admin/productList")
	public String productList(Model model) {
		model.addAttribute("list", dao.productList());
		return "admin/productList";
	}
	
	@RequestMapping("/admin/productView")
	public String productView(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("view", dao.productView(pno));
		
		return "admin/productView";
	}
	
	@RequestMapping("/admin/productDelete")
	public String productDelete(@RequestParam("pno") int pno) {
		dao.productDelete(pno);
		
		return "redirect:/admin/productList";
	}
	
	@RequestMapping("/admin/productUpdateForm")
	public String productUpdateForm(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("update", dao.productView(pno));
		return "admin/productUpdateForm";
	}
	
	@RequestMapping("/admin/productUpdate")
	public String productUpdate(@RequestParam("pupload") MultipartFile pupload,
								@RequestParam(value="pflavor", required=false) String[] pflavor,
								@RequestParam(value="proastingLevel", required=false) String[] proastingLevel,
								@RequestParam(value="pcontent", required=false) String[] pcontent,
								productDTO dto) throws Exception {

		if(pflavor != null && proastingLevel != null && pcontent != null) {
			dto.setPflavor(String.join(",", pflavor));
			dto.setProastingLevel(String.join(",", proastingLevel));
			dto.setPcontent(String.join(",", pcontent ));
		}
	
		if(!pupload.isEmpty()) {
			String pimage = pupload.getOriginalFilename();
			
			pupload.transferTo(new File("C:\\SPRINGBOOT\\Pilotproject\\src\\main\\resources\\static\\images\\product\\"+pimage));
			dto.setPimage(pimage);
		}
		
		dao.productUpdate(dto);
		
		return "redirect:/admin/productList";
	}
}
