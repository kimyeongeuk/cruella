package com.cl.cruella.dto;

import java.sql.Date;
import java.util.List;

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
public class AppdocDto { // 기안문서
	
	
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
	
//	결재자 리스트 
	private List<AppRovalDto> rovalList;
	
//	참조자 리스트
	private List<AppRefDto> refList;
	
//	파일첨부 리스트
	private List<AttachDto> attachList;
	
	
}
