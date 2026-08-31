package com.springboot.Pilotproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Pilotproject.dao.ImemberDAO;
import com.springboot.Pilotproject.dao.IproductDAO;
import com.springboot.Pilotproject.dto.memberDTO;
import com.springboot.Pilotproject.dto.productDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class memberController {
	@Autowired
	private ImemberDAO dao;

	@Autowired
	private IproductDAO pdao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		
		memberDTO dto = dao.findById("admin");
		model.addAttribute("mno", dto.getMno());
		
		model.addAttribute("list", pdao.productBest());
		return "main";
	}
	
	@RequestMapping("/shoppingForm")
	public String shoppingForm(productDTO pdto, Model model) {
		model.addAttribute("pdto", pdao.productList());
		return "shoppingForm";
	}
	
	@RequestMapping("/guest/writeForm")
	public String writeForm() {
		return "guest/writeForm";
	}
	
	@RequestMapping("/guest/jusoPopup")
	public String jusoPopup() {
		return "guest/jusoPopup";
	}
	
	@RequestMapping("/ViewForm")
	public String ViewForm(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("view", pdao.productView(pno));
		return "view";
	}
	
	@RequestMapping("/write")
	public String write(@RequestParam("maddr1") String maddr1, @RequestParam("maddr2") String maddr2, memberDTO dto) {
	
		dto.setMaddr(maddr1 + "," + maddr2);
		dto.setMpasswd(passwordEncoder.encode(dto.getMpasswd()));
		
		dao.memberWrite(dto);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/loginError")
	public String loginError() {
		return "loginError";
	}
	
	@RequestMapping("/admin/list")
	public String list(Model model) {
		model.addAttribute("member", dao.memberList());
		return "admin/list";
	}
	
	@RequestMapping("/admin/view")
	public String view(@RequestParam("mno") int mno, Model model) {
		
		model.addAttribute("view", dao.memberView(mno));
		return "admin/view";
	}
	
	@RequestMapping("/member/passwordCheckForm")
	public String passwordCheckForm(HttpServletRequest request, Model model) {
		String mode = request.getParameter("mode");
		model.addAttribute("mode", mode);
		
		return "member/passwordCheckForm";
	}
	
	@RequestMapping("/member/passwordCheck")
	public String passwordCheck(Authentication authentication, HttpServletRequest request, Model model) {
		String mode = request.getParameter("mode");
		String mpasswd = request.getParameter("mpasswd");
		String mid = authentication.getName();
		memberDTO dto = dao.findById(mid);
		
		if(dto != null && passwordEncoder.matches(mpasswd, dto.getMpasswd())) {
			if("update".equals(mode)) {
				model.addAttribute("update", dto);
				return "member/updateForm";
			}else if("delete".equals(mode)) {
				dao.memberDelete(mid);
				return "redirect:/logout";
			}
		}
		
		model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		model.addAttribute("mode", mode);
		
		
		return "member/passwordCheckForm"; 
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, memberDTO dto) {
		String maddr1 = request.getParameter("maddr1");
		String maddr2 = request.getParameter("maddr2");
		
		dto.setMaddr(maddr1+","+maddr2);
		
		dto.setMpasswd(passwordEncoder.encode(dto.getMpasswd()));
		
		dao.memberUpdate(dto);
		return "redirect:/main";
	}
}
