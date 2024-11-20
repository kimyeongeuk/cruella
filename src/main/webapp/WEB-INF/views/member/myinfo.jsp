<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${ contextPath }/assets/"
  data-template="views"
  data-style="light">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="${ contextPath }/resources/assets/js/config.js"></script>
    
   <style>
   	textarea{
  		width: 400px;
  		height: 290px;
  		border: 2px solid transparent;
      outline: none; 
      resize: none !important;
   	}
   	#memoList{
   	 background-color: #e9e7fd;
   	 border-radius: 5px;
   	 }
   	#memoList > span{
   	 width: 340px;
   	 height: 23px;
   	 cursor: pointer;
   	 overflow: hidden;
   	 }
   	 #memoDiv{
   	 height: 220px;
   	 margin-top: 15px;
   	 overflow-y: scroll;
   	 }
   	 #teamListDiv{
   	 max-height: 442px;
   	 overflow-y: auto;
   	 }
		 #memoDiv::-webkit-scrollbar {
		  width: 10px;  /* 세로 스크롤바의 너비 */
		  height: 8px; /* 가로 스크롤바의 높이 */
		 }
		
		 #memoDiv::-webkit-scrollbar-track {
		  background-color: #f1f1f1; /* 트랙 배경색 */
		  border-radius: 10px; /* 트랙 모서리 둥글게 */
		 }
		
		/* 스크롤바의 손잡이 (사용자가 드래그할 부분) */
		#memoDiv::-webkit-scrollbar-thumb {
		    background-color: #7367f0; /* 손잡이 색 */
		    border-radius: 10px;     /* 손잡이 모서리 둥글게 */
		    border: 2px solid #f1f1f1; /* 손잡이의 테두리 색 (트랙과 구분됨) */
		}
		
		/* 스크롤바 손잡이 위에 마우스를 올렸을 때 */
		#memoDiv::-webkit-scrollbar-thumb:hover {
		    background-color: #564EB5; /* 손잡이 색을 다르게 */
		}
   </style>
</head>

<body>
<div class="layout-wrapper layout-content-navbar">
   <div class="layout-container">
   
   
    <!-- 헤더 시작 -->
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- 헤더 끝 -->
    
      <div class="layout-page">

    <!-- nav 시작 -->
      <jsp:include page="/WEB-INF/views/common/nav.jsp" />
      <!-- nav 끗 -->


   <div class="content-wrapper">
   <!-- 세션 시작 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Header -->
              <div class="row">
                <div class="col-12">
                  <div class="card mb-6">
                    <div class="user-profile-header-banner">
                      <img src="${ contextPath }/assets/img/pages/profile-banner.png" alt="Banner image" class="rounded-top" />
                    </div>
                    <div class="user-profile-header d-flex flex-column flex-lg-row text-sm-start text-center mb-5">
                      <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                        <img
                          src="${ contextPath }/assets/img/avatars/1.png"
                          alt="user image"
                          class="d-block h-auto ms-0 ms-sm-6 rounded user-profile-img" />
                      </div>
                      <div class="flex-grow-1 mt-3 mt-lg-5">
                        <div
                          class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-5 flex-md-row flex-column gap-4">
                          <div class="user-profile-info">
                            <h4 class="mb-2 mt-lg-6">${ loginUser.getMemName() }</h4>
                            <ul
                              class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-4 my-2">
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-book ti-lg"></i><span class="fw-medium">${ loginUser.getDeptName() }</span>
                              </li>
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-mail ti-lg"></i><span class="fw-medium">${ loginUser.getEmail() }</span>
                              </li>
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-calendar ti-lg"></i><span class="fw-medium">${ loginUser.getHireDate() }</span>
                              </li>
                            </ul>
                          </div>
                          <a href="javascript:void(0)" class="btn btn-primary mb-1">
                            <i class="ti ti-clock ti-xs me-2"></i>출근
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--/ Header -->

              <!-- Navbar pills -->
              <div class="row">
                <div class="col-md-12">
                  <div class="nav-align-top">
                    <ul class="nav nav-pills flex-column flex-sm-row mb-6 gap-2 gap-lg-0">
                      <li class="nav-item">
                        <a class="nav-link active" href="javascript:void(0);">
                          <i class="ti-sm ti ti-user-check me-1_5"></i> 내 정보
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="pages-profile-teams.html"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 근태관리
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!--/ Navbar pills -->

              <!-- User Profile Content -->
              <div class="row">
                <div class="col-xl-4 col-lg-5 col-md-5">
                  <!-- About User -->
                  <div class="card mb-6">
                    <div class="card-body">
                      <small class="card-text text-uppercase text-muted small">내 정보</small>
                      <ul class="list-unstyled my-3 py-1">
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-user ti-lg"></i><span class="fw-medium mx-2">이름:</span>
                          <span>${ loginUser.getMemName() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-briefcase ti-lg"></i><span class="fw-medium mx-2">부서:</span>
                          <span>${ loginUser.getDeptName() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-tag ti-lg"></i><span class="fw-medium mx-2">직급:</span>
                          <span>${ loginUser.getPosName() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-calendar ti-lg"></i><span class="fw-medium mx-2">입사일:</span> <span>${ loginUser.getHireDate() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-lock ti-lg"></i><span class="fw-medium mx-2">주민등록번호:</span>
                          <span>${ loginUser.getMemSSN() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-phone-call ti-lg"></i><span class="fw-medium mx-2">전화번호:</span>
                          <span>${ loginUser.getPhone() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-building ti-lg"></i><span class="fw-medium mx-2">사번:</span>
                          <span>${ loginUser.getMemNo() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-mail ti-lg"></i><span class="fw-medium mx-2">이메일:</span>
                          <span>${ loginUser.getEmail() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-home ti-lg"></i><span class="fw-medium mx-2">주소:</span>
                          <span>${ loginUser.getAddress() }</span>
                        </li>
                        <li class="d-flex align-items-center mb-4">
                          <i class="ti ti-coin ti-lg"></i><span class="fw-medium mx-2">계좌번호:</span>
                          <span>${ loginUser.getAccount() }</span>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <!--/ About User -->
                  
                  <!-- 메모목록 -->
                  <div class="card mb-6" style="height: 331px;">
                    <div class="card-body">
                      <small class="card-text text-uppercase text-muted small">Memo</small> 
                      <i class="ti ti-edit ti-sm" style="margin-left: 310px; cursor: pointer;" onclick="fnOpenMemoModal();"></i>
                      <div id="memoDiv"></div>
                    </div>
                  </div>
                  
                  <!-- 메모등록 모달 -->
	                  <div class="modal fade" id="insertMemoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                    <div class="modal-dialog">
	                        <div class="modal-content" style="width: 450px; height: 450px;">
	                            <div class="modal-header" style="background-color: #CEC9FF;">
	                                <h5 class="modal-title" id="exampleModalLabel" style="color: white; margin-bottom: 12px;">Memo</h5>
	                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                            </div>
	                            <div class="modal-body">
	                               <textarea id="insertMemoInput" name="memoContent"></textarea>
	                            </div>
	                            <div class="modal-footer justify-content-center">
	                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn_memo_insert" onclick="fnInsertMemo();">등록</button>
	                                <button type="button" class="btn btn-primary" id="btn_memo_cancel">취소</button>
	                            </div>
	                        </div>
	                    </div>
	                  </div>
                  
                  <!-- 메모 조회 및 수정 모달 -->
                  <input type="hidden" name="memoNo" id="modifyMemoNo" value="">
	                  <div class="modal fade" id="selectMemoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                    <div class="modal-dialog">
	                        <div class="modal-content" style="width: 450px; height: 450px;">
	                            <div class="modal-header" style="background-color: #CEC9FF;">
	                                <h5 class="modal-title" id="exampleModalLabel" style="color: white; margin-bottom: 12px;">Memo</h5>
	                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                            </div>
	                            <div class="modal-body">
	                               <textarea id="insertMemoInput_edit" name="memoContent"></textarea>
	                            </div>
	                            <div class="modal-footer justify-content-center">
	                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn_memo_insert" onclick="fnModifyMemo();">수정</button>
	                                <button type="button" class="btn btn-primary" id="btn_memo_cancel">취소</button>
	                            </div>
	                        </div>
	                    </div>
	                  </div>
									







                  <!-- 전자서명 등록영역 -->
                  <div class="card mb-6">
                    <div class="card-body">
                      <div style="display: flex;">
                        <span><h2>나의 서명</h2></span>
                        <span style="position: relative; left: 145px;">
                          <div class="col-lg-4 col-md-6">
                            <small class="text-light fw-medium"></small>
                            <div class="mt-4">
                              <!-- Button trigger modal -->
                              <button
                                type="button"
                                class="btn btn-primary"
                                data-bs-toggle="modal"
                                data-bs-target="#basicModal" style="width: 75px;">
                                등록
                              </button>
      
                              <!-- Modal -->
                              <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content" style="top: 150px;">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel1">서명작성</h5>
                                      <button
                                        type="button"
                                        class="btn-close"
                                        data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      <div class="row">
                                        <div class="col mb-4">

                                          <!-- 서명 그리는 영역 -->
                                          <canvas id="canvas" width="515" height="400" style="border: 2px solid #000;"></canvas>

                                        </div>
                                      </div>
                                     
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Close
                                      </button>
                                      <button type="button" class="btn btn-danger" id="clear_btn">
                                        초기화
                                      </button>
                                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="sign_save_btn">Save</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </span>

                      </div>

                      <!-- 서명이 메인에 보일 영역 -->
                      <div style="height: 322px; width: 100%; border: 1px solid;">
                        <img id="sign_image" style="max-width: 100%; max-height: 100%; object-fit: contain;" />  
                        <!-- object-fit: contain; : 비율은 유지하되 이미지가 왜곡되지 않게 하는 속성 -->
                      </div>




                    </div>
                  </div>

                  <!-- 전자서명 스크립트 -->
                  <script>

                        const canvas = document.getElementById("canvas");
                        const context = canvas.getContext("2d");  
                        let drawing = false;

                      $('#canvas').on('mousedown',function(){
                        drawing = true;
                        context.beginPath();
                      });

                      $('#canvas').on('mousemove',function(event){
                        
                        if(!drawing) return;

                        const x = event.clientX - canvas.getBoundingClientRect().left;
                        const y = event.clientY - canvas.getBoundingClientRect().top;
                        context.lineTo(x,y);
                        context.stroke();

                      });

                      $('#canvas').on('mouseup',function(){
                        
                        drawing = false;
                        context.closePath();

                      });

                      $('#clear_btn').on('click',function(){
                        context.clearRect(0, 0, canvas.width, canvas.height);
                      })

                      $('#sign_save_btn').on('click',function(){
                        const signatureDataURL = canvas.toDataURL();
                        console.log(signatureDataURL);
                        $('#sign_image').attr('src', signatureDataURL);
                        
                      })

                  </script>
                  <!-- /전자서명 등록영역 -->















                  <!--/ Profile Overview -->
                </div>

                <div class="col-xl-8 col-lg-7 col-md-7">
                  <!-- Activity Timeline -->
                  <div class="card card-action mb-6">
                    <div class="card-header align-items-center">
                      <h5 class="card-action-title mb-0">
                        <i class="ti ti-bell ti-lg text-body me-4"></i>알림 목록
                      </h5>
                    </div>
                    <div class="card-body pt-3">
                      <ul class="timeline mb-0">
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">전체 공지사항 1건 등록</h6>
                              <small class="text-muted">20분전</small>
                            </div>
                            <p class="mb-2">설 연휴 휴무</p>
                            <div class="d-flex align-items-center mb-2">
                              <div class="badge bg-lighter rounded d-flex align-items-center">
                                <img src="${ contextPath }/assets//img/icons/misc/pdf.png" alt="img" width="15" class="me-2" />
                                <span class="h6 mb-0 text-body">invoices.pdf</span>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-success"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Client Meeting</h6>
                              <small class="text-muted">45 min ago</small>
                            </div>
                            <p class="mb-2">Project meeting with john @10:15am</p>
                            <div class="d-flex justify-content-between flex-wrap gap-2 mb-2">
                              <div class="d-flex flex-wrap align-items-center mb-50">
                                <div class="avatar avatar-sm me-3">
                                  <img src="${ contextPath }/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                                <div>
                                  <p class="mb-0 small fw-medium">Lester McCarthy (Client)</p>
                                  <small>CEO of Pixinvent</small>
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent">
                          <span class="timeline-point timeline-point-info"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-3">
                              <h6 class="mb-0">Create a new project for client</h6>
                              <small class="text-muted">2 Day Ago</small>
                            </div>
                            <p class="mb-2">6 team members in a project</p>
                            <ul class="list-group list-group-flush">
                              <li
                                class="list-group-item d-flex justify-content-between align-items-center flex-wrap border-top-0 p-0">
                                <div class="d-flex flex-wrap align-items-center">
                                  <ul class="list-unstyled users-list d-flex align-items-center avatar-group m-0 me-2">
                                    <li
                                      data-bs-toggle="tooltip"
                                      data-popup="tooltip-custom"
                                      data-bs-placement="top"
                                      title="Vinnie Mostowy"
                                      class="avatar pull-up">
                                      <img class="rounded-circle" src="${ contextPath }/assets/img/avatars/1.png" alt="Avatar" />
                                    </li>
                                    <li
                                      data-bs-toggle="tooltip"
                                      data-popup="tooltip-custom"
                                      data-bs-placement="top"
                                      title="Allen Rieske"
                                      class="avatar pull-up">
                                      <img class="rounded-circle" src="${ contextPath }/assets/img/avatars/4.png" alt="Avatar" />
                                    </li>
                                    <li
                                      data-bs-toggle="tooltip"
                                      data-popup="tooltip-custom"
                                      data-bs-placement="top"
                                      title="Julee Rossignol"
                                      class="avatar pull-up">
                                      <img class="rounded-circle" src="${ contextPath }/assets/img/avatars/2.png" alt="Avatar" />
                                    </li>
                                    <li class="avatar">
                                      <span
                                        class="avatar-initial rounded-circle pull-up text-heading"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="bottom"
                                        title="3 more"
                                        >+3</span
                                      >
                                    </li>
                                  </ul>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- Projects table -->
                  <div class="card">
                    <div class="table-responsive text-nowrap">
                      <table class="table">
                        <thead>
                          <div style="display: flex; height: 80px;">
                            <div style="display: flex; margin-top: 30px; margin-left: 20px;">
                              <i class="ti ti-news ti-lg"></i>
                              <p style="margin-right: 50px; margin-left: 15px; font-size: 18px;">공지사항</p>
                              <a style="color: blue;" href="#">전체</a>
                              &nbsp;&nbsp;/&nbsp;&nbsp;
                              <a href="#">인사관리팀</a>
                            </div>
                            <div style="position: relative; top: 20px; left: 200px; display: flex; gap: 30px;">
                              <div>
                                <input
                                  style="margin-top: 3px;"
                                  type="text"
                                  class="form-control"
                                  id="defaultFormControlInput"
                                  placeholder="검색어 입력"
                                  aria-describedby="defaultFormControlHelp" />
                              </div>
                              <a href="javascript:void(0)" class="btn btn-primary mb-1" style="height: 45px;">
                                <i class="ti ti-search ti-xs me-2"></i>검색
                              </a>
                            </div>
                          </div>
                        </thead>
                        <thead>
                          <tr>
                            <th style="border: 1px solid #e6e6e8;">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                          </tr>
                        </thead>
    
                        <tbody class="table-border-bottom-0">
                          <tr>
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            <td>관리자</td>
    
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            
                            <td><span>3</span></td>
                            
                          </tr>
    
                          <tr>
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            <td>관리자2</td>
    
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            
                            <td><span>3</span></td>
                            
                          </tr>
    
                          <tr>
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            <td>관리자3</td>
    
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            
                            <td><span class="badge bg-label-primary me-1">3</span></td>
                            
                          </tr>
    
                          <tr>
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            <td>관리자4</td>
    
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            
                            <td><span class="badge bg-label-primary me-1">퇴사</span></td>
                            
                          </tr>
    
                          <tr>
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            <td>관리자</td>
    
                            <td>
                              <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                              <span class="fw-medium">인사팀</span>
                            </td>
    
                            
                            <td><span class="badge bg-label-primary me-1">퇴사</span></td>
                            
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <!--/ Projects table -->                  
                  <!--/ Activity Timeline -->
                  <div class="row">
                    <!-- 나의 소속팀 목록 -->
                    <div class="col-lg-12 col-xl-6">
                      <div class="card card-action mb-6 mt-6">
                        <div class="card-header align-items-center">
                          <i class="ti ti-users ti-lg"></i>
                          <h5 class="card-action-title mb-0" style="margin-left: 15px;">${ loginUser.getDeptName() }</h5> <!-- 나의 소속팀이 보이게 -->
                        </div>
                        <div class="card-body" id="teamListDiv"> <!-- 나의 소속팀 전체 리스트 조회 영역 -->
                        </div>
                      </div>
                    </div>
                    <!--/ 나의 소속팀 목록 -->
                    <!-- 워크플로우 -->
                    <div class="col-lg-12 col-xl-6">
                      <div class="card card-action mb-6 mt-6">
                        <div class="card-header align-items-center">
                          <i class="ti ti-file-search ti-lg"></i>
                          <h5 class="card-action-title mb-0" style="margin-left: 15px;">내 결재 문서함</h5>
                        </div>
                        <div class="card-body">
                          <div style="width: 320px; height: 100px; margin-left: 20px; border-bottom: 1px solid #CDCCCE; display: flex; gap: 45px;">
                            <div>
                              <img src="${ contextPath }/assets/img/customizer/workflow-green.png"
                                  style="width: 70px; height: 70px; margin-top: 10px;"/>
                            </div>
                            <div style="margin-top: 35px;">
                              <span style="font-size: 20px;">최근 작성 문서</span>
                              <span style="font-size: 20px; margin-left: 24px;">2</span>
                            </div>
                          </div>
                          <div style="width: 320px; height: 100px; margin-left: 20px; border-bottom: 1px solid #CDCCCE; display: flex; gap: 45px;">
                            <div>
                              <img src="${ contextPath }/assets/img/customizer/workflow-gray.png"
                                  style="width: 70px; height: 70px; margin-top: 10px;"/>
                            </div>
                            <div style="margin-top: 35px;">
                              <span style="font-size: 20px;">진행 중 문서</span>
                              <span style="font-size: 20px; margin-left: 44px;">5</span>
                            </div>
                          </div>
                          <div style="width: 320px; height: 100px; margin-left: 20px; display: flex; gap: 45px;">
                            <div>
                              <img src="${ contextPath }/assets/img/customizer/workflow-blue.png"
                                  style="width: 70px; height: 70px; margin-top: 10px;"/>
                            </div>
                            <div style="margin-top: 35px;">
                              <span style="font-size: 20px;">결재 대기 문서</span>
                              <span style="font-size: 20px; margin-left: 24px;">1</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--/ Teams -->
                  </div>
                </div>
              </div>
              <!--/ User Profile Content -->
            </div>
            
            <script>
            
            </script>
   <!-- 세션 끝 -->



   <!-- 푸터 시작 -->
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   <!-- 푸터 끝 -->
   
   <div class="content-backdrop fade"></div>
   <!-- wrapper 닫기 -->
   </div>
   
   <!-- nav layout page 닫기 -->
   </div>
   
   <!-- layout-container 닫기 -->
   </div>
     <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>

    <!-- Drag Target Area To SlideIn Menu On Small Screens -->
    <div class="drag-target"></div>
   
   
   <!-- layout wrapper 닫기 -->
   </div>
   
      
   <script>
   
   	// 페이지 로드 시 실행시킬 함수(김동규)
    window.onload = function(){
    	
    	fnMemoList();	//   메모 전체 리스트 조회
    	fnTeamList(); // 소속팀 전체 리스트 조회
    	
    }
    
    // 메모 전체 리스트 조회(김동규)
   	function fnMemoList(){
   		
   		const memNo = '${loginUser.getMemNo()}'; // 현재 로그인한 사원의 사번
   		
	   		$.ajax({
	   			url : '${contextPath}/memo/memoList.do',
	   			type: 'POST',
	   			data: {memNo: memNo},
	   	 success: function(res){
	   		 
	   		 		let liEl = "<ul class='list-unstyled mb-2'>";
	   		 
 		 				for(let i = 0; i < res.length; i++) {
 		 					liEl += "<li class='d-flex align-items-center pt-5 pb-5 mt-3' id='memoList'>"
	 		 							+ "<span class='fw-medium mx-2' onclick='fnSelectMemo(" + res[i].memoNo + ");'>" + res[i].memoContent + "</span>"
	 		 							+ "<div class='dropdown'>"
	 		 								+ "<i class='ti ti-dots-vertical ti-sm' type='button' data-bs-toggle='dropdown' aria-expanded='false'></i>"
	 		 									+"<ul class='dropdown-menu'>"
	 		 										+"<li><a class='dropdown-item' onclick='fnSelectMemo(" + res[i].memoNo + ")'><i class='ti ti-zoom-in'></i>메모 열기</a></li>"
	 		 										+"<li><a class='dropdown-item' onclick='fnDeleteMemo(" + res[i].memoNo + ")'><i class='ti ti-trash'></i>메모 삭제</a></li>"
	 		 									+"</ul>"
	 		 								+"</div>"
 		 								+"</li>"
 		 				}
 		 				liEl += "</ul>";
             
	   		 		$('#memoDiv').html(liEl);
	   	 }
	   		  
	   	})	
   	}
    
    // 메모작성 아이콘 클릭 시 열리는 새 메모 작성 모달(김동규)
    function fnOpenMemoModal(){
      var memoModal = new bootstrap.Modal(document.getElementById("insertMemoModal"));

			
      memoModal.show();

    }
    
    
    // 메모 클릭시 해당 메모 조회(김동규)
    function fnSelectMemo(memoNo){
    	
    	var memoModal = new bootstrap.Modal(document.getElementById("selectMemoModal"));

    	$.ajax({
    		url: '${contextPath}/memo/selectMemo.do',
    		type: 'POST',
    		data: {memoNo: memoNo},
    		success: function(res){

		    	memoModal.show();
		    	
		    	$('#insertMemoInput_edit').val(res.memoContent);
		    	$('#modifyMemoNo').val(res.memoNo);
    		}
    	})
    	
    }
    
    // 메모 등록
    function fnInsertMemo(){
		
    	let memNo = '${loginUser.getMemNo()}';
    	let memoContent = $('#insertMemoInput').val();
    	
    	$.ajax({
    		url: '${contextPath}/memo/insertMemo.do',
    		type: 'POST',
    		data: {
    			memNo: memNo,
    			memoContent: memoContent
    		},
    		success: function(res){
    			
    				$('#insertMemoInput').val('');
    				
		    		fnMemoList(); // 등록 후 전체 리스트 조회 실행
    			
    		}
    	})
    	
    }
    
    // 메모 삭제
    function fnDeleteMemo(memoNo){
    	
    	
    	$.ajax({
    		url: '${contextPath}/memo/deleteMemo.do',
    		type: 'POST',
    		data: {memoNo: memoNo},
    		success: function(res) {
    			fnMemoList();	// 삭제 후 전체 리스트 조회 재실행
    	    	
    		}
    		
    	})
    }
    
    // 메모 수정
    function fnModifyMemo(){
    	
    	let memNo = '${loginUser.getMemNo()}';
    	let memoNo = $('#modifyMemoNo').val();
    	let memoContent = $('#insertMemoInput_edit').val();

    	$.ajax({
    		url: '${contextPath}/memo/modifyMemo.do',
    		type: 'POST',
    		data: {
    			memNo: memNo,
    			memoNo: memoNo,
    			memoContent: memoContent
    			},
    		success: function(res){
    			fnMemoList();	// 수정 후 전체 리스트 조회 재실행
    		}
    	})
    }
    
    // 소속팀 전체 리스트 조회
    function fnTeamList(){
    	
   		const memNo = '${loginUser.getMemNo()}'; 			 // 현재 로그인한 사원의 사번
    	const deptCode = '${loginUser.getDeptCode()}'; // 현재 로그인한 사원의 부서코드
    	
    	$.ajax({
    		url: '${contextPath}/member/teamList.do',
    		type: 'POST',
    		data: {
			    			memNo: memNo,
			    			deptCode: deptCode
			    		},
    		success: function(res){
    			
    			let liEl = '<ul class="list-unstyled mb-0">'
    			
    			for(let i = 0; i < res.length; i++){
    				
    				liEl += '<li class="mb-4">'
    							+'<div class="d-flex align-items-center">'
    								+'<div class="d-flex align-items-center">'
    									+'<div class="avatar me-2">'
    										+'<img src="${ contextPath }/assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />'
    									+'</div>'
    									+'<div class="me-2">'
    										+'<h6 class="mb-0">' + res[i].memName + '</h6>'
    										+'<small>' + res[i].email + '</small>'
    									+'</div>'
    								+'</div>'
    								+'<div class="ms-auto"><button class="btn btn-label-primary btn-icon"><i class="ti ti-brand-telegram ti-md"></i></button></div>'
    						  +'</li>'
    			}
    			
    			liEl += '</ul>';
    			
    			$('#teamListDiv').html(liEl);
    			
    		}
    		
    	})
    }
    
    
   
   </script>

   
   
</body>
</html>