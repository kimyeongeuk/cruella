package com.cl.cruella.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.NoticeDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeDao {

	private final SqlSessionTemplate sqlSession;
	
	public int insertNotice(NoticeDto n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int insertAttach(AttachDto at) {
		return sqlSession.insert("noticeMapper.insertAttach", at);
	}

	public int updateIncreaseCount(int noticeNo) {
		return sqlSession.update("noticeMapper.updateIncreaseCount", noticeNo);
	}

	public NoticeDto selectNotice(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public int selectNoticeListCount(String deptCode) {
        return sqlSession.selectOne("noticeMapper.selectNoticeListCount", deptCode);
    }

    public List<NoticeDto> selectNoticeList(Map<String, Object> params) {
        PageInfoDto pi = (PageInfoDto) params.get("pi");
        RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
        return sqlSession.selectList("noticeMapper.selectNoticeList", params, rowBounds);
    }

	public List<NoticeDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("noticeMapper.selectSearchList", search, rowBounds);
	}

	public int selectSearchListCount(Map<String, String> search) {
		return sqlSession.selectOne("noticeMapper.selectSearchListCount", search);
	}

	public int updateNotice(NoticeDto n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("noticeMapper.deleteAttach", delFileNo);
	}

	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return sqlSession.selectList("noticeMapper.selectDelAttach", delFileNo);
	}

	
	public int deleteNotice(int noticeNo) {
        return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
    }

    public int deleteSelectedPosts(List<Integer> noticeNos) {
        Map<String, Object> params = new HashMap<>();
        params.put("noticeNos", noticeNos);
        return sqlSession.delete("noticeMapper.deleteSelectNotice", params);
    }
	
}
