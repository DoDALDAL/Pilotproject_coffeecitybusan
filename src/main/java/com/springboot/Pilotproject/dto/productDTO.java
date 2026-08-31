package com.springboot.Pilotproject.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class productDTO {
	private int pno;
	private String pbrand;
	private String pname;
	private String pimage;
	private MultipartFile pupload;
	private String porigin;
	private int pgram;
	private String pflavor;
	private String proastingLevel;
	private String pcontent;
	private int pprice;
	private int pamount;
	private Date pdate;
	private String pbest;
	private int mno;
}
