package com.cl.cruella.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class AppdocDto {
	
	
	private int docNo;
	private String memNo;
	private String docType;
	private String docTitle;
	private String docContent;
	private String docImpo;
	private Date docDt;
	private Date docModifyDt;
	private String docStatus;
	private int docOrder;
	private String status;
	private String reason;
	
//	연차신청서
	private Date appDateStart; // 시작일
	private Date appDateEnd; // 끝일
	
//	증명서신청서
	private Date appCoreDt; // 발행날짜
	
	
}
