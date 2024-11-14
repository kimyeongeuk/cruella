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

public class MemberDto {
	
	
		private String memNo;
		private String memName;
		private String memPwd;
		private String phone;
		private String email;
		private String address;
		private Date hireDate;
		private Date endDate;
		private String status;
		private String gender;
		private String memSSN;
		private String account;
		private String profileURL;
		private String bankName;
		private int vacCount;
		private String deptName;
		private String posName;
		private String signPath;
	
}
