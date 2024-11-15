package com.cl.cruella.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.BoardDao;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.CommentDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	
	private final BoardDao boardDao;

	@Override
	public int insertBoard(BoardDto b) {
		
		int result = boardDao.insertBoard(b); 
		
		List<AttachDto> list = b.getAttachList();
		if(result > 0 && !list.isEmpty()) {
			result = 0;
			for(AttachDto attach : list) {
				result += boardDao.insertAttach(attach);
			}
		}
		
		return result;
	}

	@Override
	public int updateIncreaseCount(int boardNo) {
		return boardDao.updateIncreaseCount(boardNo);
	}

	@Override
	public BoardDto selectBoard(int boardNo) {
		return boardDao.selectBoard(boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return 0;
	}

	@Override
	public List<AttachDto> selectDelAttach(String[] delFileNo) {
		return null;
	}

	@Override
	public int updateBoard(BoardDto b, String[] delFileNo) {
		return 0;
	}

	@Override
	public List<CommentDto> selectCommentList(int boardNo) {
		return null;
	}

	@Override
	public int insertComment(CommentDto r) {
		return 0;
	}

	@Override
	public int deleteCommentCompletely() {
		return 0;
	}

	@Override
    public int selectBoardListCount(String deptCode) {
        return boardDao.selectBoardListCount(deptCode);
    }

    @Override
    public List<BoardDto> selectBoardList(Map<String, Object> params) {
        return boardDao.selectBoardList(params);
    }

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return boardDao.selectSearchListCount(search);
	}

	@Override
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return boardDao.selectSearchList(search, pi);
	}


}
