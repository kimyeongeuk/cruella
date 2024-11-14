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

public class MessageDto {
	
	 private int msgNo;
	 private int chatNo;
	 private String memNo;
	 private String msgContnet;
	 private Date msgRegistDate;
	 private String msgCheck;
	 private String msgStatus;
	 private Date msgModifyDate;

}
