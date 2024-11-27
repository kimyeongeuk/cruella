package com.cl.cruella.service;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.ChartDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChartServiceImpl implements ChartService {
    
    private final ChartDao chartDao;


}
