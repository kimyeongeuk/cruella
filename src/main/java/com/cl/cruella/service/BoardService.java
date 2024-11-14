package com.cl.cruella.service;

import java.util.List;
import java.util.Map;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.CommentDto;
import com.cl.cruella.dto.PageInfoDto;


public interface BoardService {
	
	// 게시글 목록 조회 (페이징 처리)
	int selectBoardListCount();
	List<BoardDto> selectBoardList(PageInfoDto pi);
	
	// 게시글 검색 조회 (페이징 처리)
	int selectSearchListCount(Map<String, String> search);
	List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
	
	// 게시글 등록
	int insertBoard(BoardDto b);
	
	// 게시글 상세 - 조회수 증가
	int updateIncreaseCount(int boardNo);
	
	// 게시글 상세 - 게시글 조회
	BoardDto selectBoard(int boardNo);
	
	// 게시글 삭제
	int deleteBoard(int boardNo);
	
	// 게시글 수정
	List<AttachDto> selectDelAttach(String[] delFileNo);
	int updateBoard(BoardDto b, String[] delFileNo);
	
	// 댓글 목록 조회
	List<CommentDto> selectCommentList(int boardNo);
	
	// 댓글 등록 
	int insertComment(CommentDto r);
	
	// 댓글 완전삭제 (스케줄러에 의해 작동)
	int deleteCommentCompletely();

}
