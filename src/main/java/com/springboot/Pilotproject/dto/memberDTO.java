package com.springboot.Pilotproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class memberDTO {
	private int mno;
	private String mid;
	private String mpasswd;
	private String mname;
	private String mbirth;
	private String mgender;
	private String mtel;
	private String memail;
	private String maddr;
	private String mzipno;
	private Date mdate;
	private String mauthority;
}
