package com.cl.cruella.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cl.cruella.dao.NoticeDao;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.NoticeDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	
	private final NoticeDao noticeDao;

	@Override
	public int insertNotice(NoticeDto n) {
		
		int result = noticeDao.insertNotice(n); 
		
		List<AttachDto> list = n.getAttachList();
		if(result > 0 && !list.isEmpty()) {
			result = 0;
			for(AttachDto attach : list) {
				result += noticeDao.insertAttach(attach);
			}
		}
		
		return result;
	}

	@Override
	public int updateIncreaseCount(int noticeNo) {
		return noticeDao.updateIncreaseCount(noticeNo);
	}

	@Override
	public NoticeDto selectNotice(int noticeNo) {
		return noticeDao.selectNotice(noticeNo);
	}

	@Transactional
	@Override
	public int updateNotice(NoticeDto n, String[] delFileNo) {
		
		// 1) notice테이블에 update
		int result1 = noticeDao.updateNotice(n);
		
		// 2) attachment테이블에 delete
		int result2 = 1;
		if(result1 > 0 && delFileNo != null) {
			result2 = noticeDao.deleteAttach(delFileNo);
		}
		
		// 3) attachment테이블에 insert
		List<AttachDto> list = n.getAttachList();
		int result3 = 0;
		for(AttachDto at : list) {
			result3 += noticeDao.insertAttach(at);
		}
		
		
		// 성공에 대한 조건
		// result1이 1이여야됨
		// result2가 0보다 커야됨
		// result3가 list의 사이즈와 동일
		
		return result1 == 1
					&& result2 > 0
						&& result3 == list.size()
							? 1 : -1;
		
		
	}
	
	@Override
	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return delFileNo == null ? new ArrayList<>() 
				 : noticeDao.selectDelAttach(delFileNo);
	}	

	@Override
    public int selectNoticeListCount(String deptCode) {
        return noticeDao.selectNoticeListCount(deptCode);
    }

    @Override
    public List<NoticeDto> selectNoticeList(Map<String, Object> params) {
        return noticeDao.selectNoticeList(params);
    }

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return noticeDao.selectSearchListCount(search);
	}

	@Override
	public List<NoticeDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return noticeDao.selectSearchList(search, pi);
	}
	
	@Override
    public int deleteNotice(int noticeNo) {
        List<Integer> noticeNos = new ArrayList<>();
        noticeNos.add(noticeNo);
        // 게시글 삭제
        return noticeDao.deleteNotice(noticeNo);
    }

	@Override
    public int deleteSelectedPosts(List<Integer> noticeNos) {
        return noticeDao.deleteSelectedPosts(noticeNos);
    }
	

}
