package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.AppDao;
import com.cl.cruella.dto.AppRefDto;
import com.cl.cruella.dto.AppRovalDto;
import com.cl.cruella.dto.AppdocDto;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class AppService {
	
	private final AppDao appDao;
	
	
	
	
	/***
	 * 
	 * jstree 조직도 조회
	 * @return list
	 */
	public List<DeptDto> ajaxJstree(){
		
		List<DeptDto> list = appDao.ajaxJstree();
		
		return list;
		
	}
	
	// 양식페이지 이동 // 해당 양식 들어갈때 현재 로그인한 사원정보를
	// 해당 양식에 기본값에 적용시킬 조회문
	public DeptDto formDraftPage(String userNo) {
		DeptDto m = appDao.formDraftPage(userNo);
		return m;
		
	}

	// 전자결재작성 insert 문
	public int insertApp(AppdocDto ad,List<AttachDto> list) {
		
		
		
		List<AppRovalDto> rovalList = ad.getRovalList();
		List<AppRefDto> refList = ad.getRefList();
		
		int result = appDao.insertApp(ad); // 기안작성
		
		int rovalResult = 0; // 결재자
		int refResult = 0; // 참조자
		int annResult = 0; // 연차신청서
		int coeResult = 0; // 증명서신청서
		
//		결재자
		for(AppRovalDto appRoval : rovalList) {
			rovalResult += appDao.insertRoval(appRoval);
		}
		
//		참조자
			for(AppRefDto ref : refList) {
				refResult += appDao.insertRef(ref);
			}
		
		
//		파일
		if(result > 0 && !list.isEmpty()) { // 1
			result = 0;
			for(AttachDto at :list) {
				result += appDao.insertAttach(at); // 여러개
			}
		}
		
//		연차신청서
		if(result > 0 && ad.getDocType().equals("연차신청서")) {
			annResult = appDao.insertFormAnn(ad);
		}
		
//		증명서신청서
		if(result > 0 && ad.getDocType().equals("증명서신청서")) {
			coeResult = appDao.insertFormCoe(ad);
		}
		
		
		
		
		return result;
		
		
	}
	
	
//	결재대기함 카운트
	public int selectStandbyCount(String memNo) {
		 int result = appDao.selectStandbyCount(memNo);
		 return result;
	}
	
	
//	결재대기함 조회
	public List<AppdocDto> selectStandby(String memNo,PageInfoDto pi){
		List<AppdocDto> list = appDao.selectStandby(memNo,pi);
		return list;
		
	}
	
	
//	결재반려함 카운트
	public int selectCompanionCount(String memNo) {
		int result = appDao.selectCompanionCount(memNo);
		return result;
	}
	
	
//	결재반려함 조회
	public List<AppdocDto> selectCompanion(String memNo,PageInfoDto pi){
		List<AppdocDto> list = appDao.selectCompanion(memNo,pi);
		return list;
		
	}
	
	
//	결재진행함 카운트
	public int selectProgressCount(String memNo) {
		int result = appDao.selectProgressCount(memNo);
		return result;
	}
	
	
//	결재진행함 조회
	public List<AppdocDto> selectProgress(String memNo,PageInfoDto pi){
		List<AppdocDto> list = appDao.selectProgress(memNo,pi);
		return list;
		
	}
	
	
	
	
	
	
	
//	참조열람함 카운트
	public int selectViewCount(String memNo) {
		 int result = appDao.selectViewCount(memNo);
		 return result;
	}
//	참조열람함 조회
	public List<AppdocDto> selectView(String memNo,PageInfoDto pi){
		List<AppdocDto> list = appDao.selectView(memNo,pi);
		return list;
	}
	
	
	
	
	
	
	
//	결재완료함 카운트
	public int selectSuccessCount(String memNo) {
		int result = appDao.selectSuccessCount(memNo);
		return result;
	}
//	결재완료함 조회
	public List<AppdocDto> selectSuccess(String memNo,PageInfoDto pi){
		List<AppdocDto> list = appDao.selectSuccess(memNo,pi);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
//	상세페이지 필요한 데이터 조회
	public AppdocDto detailPage(AppdocDto docNo) {
		
		AppdocDto app = appDao.detailPage(docNo);
		
		
		List<AppRovalDto> rovalList = appDao.detailPageRoval(docNo);
		
		List<AttachDto> attachList = appDao.detailPageAttach(docNo);
		
		
		
		app.setRovalList(rovalList);
		app.setAttachList(attachList);
		
		
		
		return app;
		
	}
	
	
	
//	상세페이지 결재 시
	public int detailClear(AppdocDto ad) {
		
		 // 문서의 최종결재순서와 현재결재자순서와 같을때 상태를 최종승인 으로
		 // 아니면 진행중으로 업데이트
		
		int result = 0;
		
		if(ad.getMaxOrder() == ad.getAppLevel()) {
			
			result = appDao.detailLastClear(ad); // 최종승인 / 기안문서
			
			if(result>0) {
				result = appDao.detailAppRoval(ad); // 최종승인 / 결재선
			}
			
		}else if(ad.getMaxOrder() > ad.getAppLevel()) {
			
			result = appDao.detailClear(ad); // 다음순서 업데이트 / 기안문서
			
			if(result > 0) {
				result = appDao.detailAppRoval(ad); // 다음순서 업데이트 / 결재선
				
			}
		}
		return result;
		
		
		
	}
	
	
	
//	상세페이지 반려시
	public int detailFail(AppdocDto ad) {
		
		int result = appDao.detailFail1(ad);
		
		if(result > 0) {
			result = appDao.detailFail2(ad);
		}
		
		return result;
		
		
		
	}
	
	
	
//	회수버튼 클릭시 
	public int appDeleteBack(AppdocDto ad) {
		int result = appDao.appDeleteBack(ad);
		return result;
	}
	
	
	
	
}



