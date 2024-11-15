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
	
	
	private int docNo; // 문서번호
	private String memNo; // 기안자 사번
	private String docType; // 문서종류
	private String docTitle; // 제목
	private String docContent; // 내용
	private String docImpo; // 중요도
	private Date docDt; // 작성일
	private Date docModifyDt; // 수정일 // 이건 안쓸듯
	private String docStatus; // 문서 상태 = 대기/진행/최종승인/반려
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
