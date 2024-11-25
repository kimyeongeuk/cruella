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
	 
	 // 결재반려함 (listCount용)
	 public int selectCompanionCount(String memNo) {
		 return sqlSession.selectOne("appMapper.selectCompanionCount",memNo);
	 }
	 
	 // 결재반려함 리스트 조회
	 public List<AppdocDto> selectCompanion(String memNo,PageInfoDto pi){
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit() ,pi.getBoardLimit());
		 return sqlSession.selectList("appMapper.selectCompanion",memNo,rowBounds);
	 }
	 
	 
	 // 결재진행함 (listCount용)
	 public int selectProgressCount(String memNo) {
		 return sqlSession.selectOne("appMapper.selectProgressCount",memNo);
	 }
	 
	 // 결재진행함 리스트 조회
	 public List<AppdocDto> selectProgress(String memNo,PageInfoDto pi){
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit() ,pi.getBoardLimit());
		 return sqlSession.selectList("appMapper.selectProgress",memNo,rowBounds);
	 }
	 
	 
	 
	 
	 
	 
	 
	 // 참조열람함 (listCount용)
	 public int selectViewCount(String memNo) {
		 return sqlSession.selectOne("appMapper.selectViewCount",memNo);
	 }
	 
	 // 참조열람함 리스트 조회
	 public List<AppdocDto> selectView(String memNo,PageInfoDto pi){
		 RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit() ,pi.getBoardLimit());
		 return sqlSession.selectList("appMapper.selectView",memNo,rowBounds);
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
//	 상세페이지
	 
	 // 기안조회(상세페이지용)
	 public AppdocDto detailPage(AppdocDto docNo) {
		 return sqlSession.selectOne("appMapper.appdocDetailSelectAll",docNo);
	 }
	 
	 // 결재선조회(상세페이지용)
	 public List<AppRovalDto> detailPageRoval(AppdocDto docNo){
		 return sqlSession.selectList("appMapper.appdocDetailSelectRoval",docNo);
	 }
	 
	 // 파일조회(상세페이지용)
	 public List<AttachDto> detailPageAttach(AppdocDto docNo){
		 return sqlSession.selectList("appMapper.appdocDetailSelectAttach",docNo);
	 }
	 
	 
	 
	 
	 
	 
	 
	 // 상세페이지 결재 // 다음순서와 진행중으로 업데이트 // 기안문서
	 public int detailClear(AppdocDto ad) { 
		 return sqlSession.update("appMapper.appSignAndDocOrderAndstatusUpdate",ad);
	 }
	 
	 // 상세페이지 결재 라스트
	 public int detailLastClear(AppdocDto ad) { // 최종승인으로 업데이트 / 기안문서
		 return sqlSession.update("appMapper.appSignAndLastUpdate",ad);
	 }
	 
	 
	 // 상세페이지 결재 // 다음순서와 진행중으로 업데이트 및 최종승인 // 결재선
	 public int detailAppRoval(AppdocDto ad) { 
		 return sqlSession.update("appMapper.lastApproval",ad);
	 }
	 
	 
	 // 상세페이지 반려 / 기안문서
	 public int detailFail1(AppdocDto ad) {
		 return sqlSession.update("appMapper.appdocCompanionUpdate",ad);
	 }
	 // 상세페이지 반려 / 결재선
	 public int detailFail2(AppdocDto ad) {
		 return sqlSession.update("appMapper.approvalCompanion",ad);
	 }
	
	 
	 
	 
	 
	 // 회수버튼 클릭시
	 public int appDeleteBack(AppdocDto ad) {
		 return sqlSession.update("appMapper.appDeleteBack",ad);
	 }
	
	
	
	

}
