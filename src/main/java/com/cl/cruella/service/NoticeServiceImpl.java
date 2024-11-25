package com.cl.cruella.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cl.cruella.dao.NoticeDao;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.NoticeDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeDao noticeDao;

    @Transactional
    @Override
    public int insertNotice(NoticeDto n) {
        int result = noticeDao.insertNotice(n);

        if (result > 0) {
            int noticeNo = noticeDao.getLastInsertId(); // 삽입된 notice_no 값을 가져옵니다.
            
            List<AttachDto> list = n.getAttachList();
            if (!list.isEmpty()) {
                for (AttachDto at : list) {
                    at.setRefNo(noticeNo); // 첨부 파일의 refNo를 noticeNo로 설정
                    noticeDao.insertAttach(at);
                }
            }

            for (DeptDto dept : n.getDeptCodes()) {
                noticeDao.insertNoticeDept(noticeNo, dept.getDeptCode());
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
        int result1 = noticeDao.updateNotice(n);

        int result2 = 1;
        if (result1 > 0 && delFileNo != null) {
            result2 = noticeDao.deleteAttach(delFileNo);
        }

        List<AttachDto> list = n.getAttachList();
        int result3 = 0;
        for (AttachDto at : list) {
            result3 += noticeDao.insertAttach(at);
        }

        return result1 == 1 && result2 > 0 && result3 == list.size() ? 1 : -1;
    }

    @Override
    public List<AttachDto> selectDelAttach(String[] delFileNo) {
        return delFileNo == null ? new ArrayList<>() : noticeDao.selectDelAttach(delFileNo);
    }

    @Override
    public int selectNoticeListCount(Map<String, Object> params) {
        return noticeDao.selectNoticeListCount(params);
    }

    @Override
    public List<NoticeDto> selectNoticeList(Map<String, Object> params) {
        return noticeDao.selectNoticeList(params);
    }

    @Override
    public int selectSearchListCount(Map<String, Object> params) {
        return noticeDao.selectSearchListCount(params);
    }

    @Override
    public List<NoticeDto> selectSearchList(Map<String, Object> params, PageInfoDto pi) {
        return noticeDao.selectSearchList(params, pi);
    }

    @Override
    public int deleteNotice(int noticeNo) {
        return noticeDao.deleteNotice(noticeNo);
    }
    
    @Override
    public int deleteSelectedPosts(List<Integer> noticeNos) {
        return noticeDao.deleteSelectedPosts(noticeNos);
    }
}
