package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.AppDao;
import com.cl.cruella.dto.AppRefDto;
import com.cl.cruella.dto.AppRovalDto;
import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.DeptDto;

import lombok.RequiredArgsConstructor;



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
		
		
		int result = appDao.insertApp(ad);
		
		List<AppRovalDto> rovalList = ad.getRovalList();
		List<AppRefDto> refList = ad.getRefList();
		
		int rovalResult = 0;
		int refResult = 0;
		
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
		
		
		
		
		return result;
		
		
	}
	
	
	
	
}



