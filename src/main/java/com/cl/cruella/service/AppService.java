package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.AppDao;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.MemberDto;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class AppService {
	
	private final AppDao appDao;
	
	
	public List<DeptDto> ajaxJstree(){
		
		List<DeptDto> list = appDao.ajaxJstree();
		
		return list;
		
	}
	

}
