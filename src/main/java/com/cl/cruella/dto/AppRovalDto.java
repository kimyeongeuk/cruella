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
public class AppRovalDto {// 결재자
	
	private String rvNo;  // 결재자 사번
	private int docNo;    // 문서번호
	private int appLevel; // 결재 순서
	private Date appDate; // 문서번호
	private String appStatus; // 결재상태 : A =대기 , Y= 승인 , N= 반려
	
	

}
