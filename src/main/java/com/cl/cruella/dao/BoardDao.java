package com.cl.cruella.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDao {

	private final SqlSessionTemplate sqlSession;

	public int insertBoard(BoardDto b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertAttach(AttachDto at) {
		return sqlSession.insert("boardMapper.insertAttach", at);
	}

	public int updateIncreaseCount(int boardNo) {
		return sqlSession.update("boardMapper.updateIncreaseCount", boardNo);
	}

	public BoardDto selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int selectBoardListCount(String deptCode) {
        return sqlSession.selectOne("boardMapper.selectBoardListCount", deptCode);
    }

    public List<BoardDto> selectBoardList(Map<String, Object> params) {
        PageInfoDto pi = (PageInfoDto) params.get("pi");
        RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
        return sqlSession.selectList("boardMapper.selectBoardList", params, rowBounds);
    }

	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());
		return sqlSession.selectList("boardMapper.selectSearchList", search, rowBounds);
	}

	public int selectSearchListCount(Map<String, String> search) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", search);
	}

	public int deleteBoard(int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	public int updateBoard(BoardDto b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteAttach(String[] delFileNo) {
		return sqlSession.delete("boardMapper.deleteAttach", delFileNo);
	}

	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return sqlSession.selectList("boardMapper.selectDelAttach", delFileNo);
	}

	public int deleteSelectedPosts(List<Integer> boardNos) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("boardNos", boardNos);
	    return sqlSession.delete("boardMapper.deleteSelectBoard", params);
	}


	
	
}
