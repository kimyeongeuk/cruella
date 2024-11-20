package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.service.SupplyServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("/supply")
@Slf4j
public class SupplyController {

	
	private final SupplyServiceImpl supplyServiceImpl;
	
	
	
	
}
