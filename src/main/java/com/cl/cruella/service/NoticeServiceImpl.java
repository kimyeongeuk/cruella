package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.NoticeDao;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.NoticeDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	
	private final NoticeDao noticeDao;

	@Override
	public int insertNotice(NoticeDto n) {
		return 0;
	}

	@Override
	public int updateIncreaseCount(int NoticeNo) {
		return 0;
	}

	@Override
	public NoticeDto selectNotice(int NoticeNo) {
		return null;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

	@Override
	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return null;
	}

	@Override
	public int updateNotice(NoticeDto n, String[] delFileNo) {
		return 0;
	}



}
