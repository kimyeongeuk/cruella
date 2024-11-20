package com.cl.cruella.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.AppRefDto;
import com.cl.cruella.dto.AppRovalDto;
import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;



@Repository
@RequiredArgsConstructor
public class AppDao {
	
	private final SqlSessionTemplate sqlSession;
	
	// 조직도 조회
	public List<DeptDto> ajaxJstree(){
		return sqlSession.selectList("appMapper.ajaxJstree");
	}
	// 해당 양식에 기본값 적용할 값 조회
	public DeptDto formDraftPage(String userNo) {
		return sqlSession.selectOne("appMapper.formDraftPage",userNo);
	}
	
	
	
	// 기안서 insert
	public int insertApp(AppdocDto ad) {
		return sqlSession.insert("appMapper.insertApp",ad);
	}
	
	// 파일 insert
	public int insertAttach(AttachDto at) {
		return sqlSession.insert("appMapper.insertAttach",at);
	}
	
	
	// 결재자 insert
	public int insertRoval(AppRovalDto roval) {
		return sqlSession.insert("appMapper.insertRoval",roval);
	}
	
	 //참조자 insert 
	 public int insertRef(AppRefDto ref) {
		 return sqlSession.insert("appMapper.insertRef",ref);
	}
	 
	// 연차신청서
	 public int insertFormAnn(AppdocDto ad) {
		 return sqlSession.insert("appMapper.insertFormAnn",ad);
	 }
	 
	 // 증명서신청서
	 public int insertFormCoe(AppdocDto ad) {
		 return sqlSession.insert("appMapper.insertFormCoe",ad);
	 }
	 
	 
	 
	 
	 
	 // 결재대기함 (listCount용)
	 public int selectStandbyCount(String memNo) {
		 return sqlSession.selectOne("appMapper.selectStandbyCount",memNo);
	 }
	 
	 // 결재대기함 리스트 조회
	 public List<AppdocDto> selectStandby(String memNo,PageInfoDto pi){
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit() ,pi.getBoardLimit());
		 return sqlSession.selectList("appMapper.selectStandby",memNo,rowBounds);
	 }
	
	
	
	

}
