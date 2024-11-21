package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.SupplyDao;
import com.cl.cruella.dto.SupplyDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SupplyServiceImpl implements SupplyService {
	
	private final SupplyDao supplyDao;
	
	@Override
	public List<SupplyDto> selectSupplyList() {
		return supplyDao.selectSupplyList();
	}

}
