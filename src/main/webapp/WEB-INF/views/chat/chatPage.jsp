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
     <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> 
  <style>
 .chat-message .dropdown {
   display: none;
 }

 .chat-message:hover .dropdown {
   display: block; 
 }

 .chat-message .dropdown {
   position: relative; 
 }

 .dropdown-menu {
   position: absolute;
   top: 100%;
   left: 0;
   z-index: 10;
   display: none;
 }
 </style>
</head>


<body>
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
	
	
    <!-- 헤더 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- 헤더 끝 -->
    
    <!-- nav 시작 -->
	<div class="layout-page">
		    
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div class="content-wrapper">
	<!-- 세션 시작 -->
    <div class="container-xxl flex-grow-1 container-p-y">
	  <!-- 이쪽에 세션정보 넣어야합니다 -->
    
    
   
    
                  <div class="app-chat card overflow-hidden">
                <div class="row g-0">



                  <!-- 내 정보 확인 -->
                  <div class="col app-chat-sidebar-left app-sidebar overflow-hidden" id="app-chat-sidebar-left">
                    <div
                      class="chat-sidebar-left-user sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
                      <div class="avatar avatar-xl avatar-online">
                        <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h5 class="mt-4 mb-0">도 존</h5>
                      <span>부점장</span>
                      <i
                        class="ti ti-x ti-lg cursor-pointer close-sidebar"
                        data-bs-toggle="sidebar"
                        data-overlay="app-overlay-ex"
                        data-target="#app-chat-sidebar-left"></i>
                    </div>
                    <div class="sidebar-body px-6 pb-6">
                      <div class="my-6">
                        <label for="chat-sidebar-left-user-about" class="text-uppercase text-muted mb-1">상태메시지</label>
                        <textarea
                          id="chat-sidebar-left-user-about"
                          class="form-control chat-sidebar-left-user-about"
                          rows="3"
                          maxlength="120" style="resize: none;">퇴근하고싶다.... 아파트 아파트..</textarea>
                      </div>
                      <div class="my-6">
                        <p class="text-uppercase text-muted mb-1">내 상태</p>
                        <div class="d-grid gap-2 pt-2 text-heading ms-2">
                          <div class="form-check form-check-success">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="active"
                              id="user-active"
                              checked />
                            <label class="form-check-label" for="user-active">온라인</label>
                          </div>
                          <div class="form-check form-check-warning">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="away"
                              id="user-away" />
                            <label class="form-check-label" for="user-away">자리비움</label>
                          </div>
                          <div class="form-check form-check-danger">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="busy"
                              id="user-busy" />
                            <label class="form-check-label" for="user-busy">외출 중</label>
                          </div>
                          <div class="form-check form-check-secondary">
                            <input
                              name="chat-user-status"
                              class="form-check-input"
                              type="radio"
                              value="offline"
                              id="user-offline" />
                            <label class="form-check-label" for="user-offline">오프라인</label>
                          </div>
                        </div>
                      </div>
                      <div class="my-6">
                        <p class="text-uppercase text-muted mb-1"></p>
                        <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">

                          <li class="d-flex justify-content-between align-items-center">
                            <div>
                              <i class="ti ti-bell ti-md me-1"></i>
                              <span class="align-middle">채팅 알림</span>
                            </div>
                            <div class="form-check form-switch mb-0 me-1">
                              <input type="checkbox" class="form-check-input" />
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="d-flex mt-6">
                        <button
                          class="btn btn-primary w-100"
                          data-bs-toggle="sidebar"
                          data-overlay
                          data-target="#app-chat-sidebar-left">
                          저장
                        </button>
                      </div>
                    </div>
                  </div>
                  <!-- 내 정보 확인 끝 -->




                  <!-- Chat & Contacts -->
                  <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="app-chat-contacts">
                    <div class="sidebar-header h-px-75 px-5 border-bottom d-flex align-items-center">
                      <div class="d-flex align-items-center me-6 me-lg-0">
                        <div
                          class="flex-shrink-0 avatar avatar-online me-4"
                          data-bs-toggle="sidebar"
                          data-overlay="app-overlay-ex"
                          data-target="#app-chat-sidebar-left">
                          <img
                            class="user-avatar rounded-circle cursor-pointer"
                            src="${ contextPath }/resources/assets/img/avatars/1.png"
                            alt="Avatar" />
                        </div>
                        <div class="flex-grow-1 input-group input-group-merge">
                          <span class="input-group-text" id="basic-addon-search31"><i class="ti ti-search"></i></span>
                          <input
                            type="text"
                            class="form-control chat-search-input"
                            placeholder="Search..."
                            aria-label="Search..."
                            aria-describedby="basic-addon-search31" />
                        </div>
                      </div>
                      <i
                        class="ti ti-x ti-lg cursor-pointer position-absolute top-50 end-0 translate-middle d-lg-none d-block"
                        data-overlay
                        data-bs-toggle="sidebar"
                        data-target="#app-chat-contacts"></i>
                    </div>



                    <div class="sidebar-body">


                      <!-- 채팅방 목록 -->
                      <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0 chat-list-form">
                          <h5 class="text-primary mb-0">채팅방 목록</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">채팅방이 없습니다</h6>
                        </li>

                        <!-- 단체 채팅방 끗 -->
			                        
													<c:forEach var="list" items="${ chatList }">
															<c:choose>
																<c:when test="${ list.chatCount eq 2 }">
				                        <li class="chat-contact-list-item mb-1 chat-list-form">
			                        	<input type="hidden" value="${ list.chatNo }" class="chatlistno">
			                        	<input type="hidden" value="${ list.chatTitle }">
			                          <a class="d-flex align-items-center">
			                            <div class="flex-shrink-0 avatar avatar-offline">
			                              <img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
			                            </div>
			                            <div class="chat-contact-info flex-grow-1 ms-4 test1">
			                              <div class="d-flex justify-content-between align-items-center">
			                                <h6 class="chat-contact-name text-truncate fw-normal m-0 chattitle">${ list.chatTitle }</h6>
			                                <small class="text-muted">${ list.strDate }</small>
			                              </div>
			                              <small class="chat-contact-status text-truncate">${ list.chatNewMsg }</small>
			                              <input type="hidden" value="${ list.chatNo }" class="mewmsg">
			                            </div>
			                          </a>
			                        </li>
	                       	 	</c:when>
	                       	 	<c:otherwise>
	                       	 	<!-- 단체 채팅방일 시 -->
			                       	<li class="chat-contact-list-item mb-1 chat-list-form">
			                       	<input type="hidden" value="${ list.chatNo }">
			                       	<input type="hidden" value="${ list.chatTitle }">
		                          <a class="d-flex align-items-center">
		                            <div class="flex-shrink-0 avatar">
		                              <div style="flex-direction: row; display: flex;"><img src="${ contextPath }/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
		                                <img src="${ contextPath }/resources/assets/img/avatars/7.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
		                              </div>
		                              <div style="flex-direction: row; display: flex;"><img src="" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
		                                <img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
		                              </div>
		                            </div>
		                            
		                            <div class="chat-contact-info flex-grow-1 ms-4">
		                              <div class="d-flex justify-content-between align-items-center">
		                                <h6 class="chat-contact-name text-truncate m-0 fw-normal chattitle">${ list.chatTitle }</h6>
		                                <small class="text-muted">2024-11-08</small>
		                              </div>
		                              <div class="d-flex justify-content-between align-items-center test1">
		                              <small class="chat-contact-status text-truncate">${ list.chatNewMsg }</small>
		                              <input type="hidden" value="${ list.chatNo }" class="mewmsg">
		                              <div class="badge bg-danger rounded-pill ms-auto">5</div>
		                              </div>
		                            </div>
		                          </a>
		                        </li>
	                       	 	
	                       	 	</c:otherwise>
	                        
	                        </c:choose>
											</c:forEach>

                        
                      </ul>
                      <!-- 채팅방 목록 끝-->


                      <!-- 사원 목록 -->
                      <ul class="list-unstyled chat-contact-list mb-0 py-2" id="contact-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                          <h5 class="text-primary mb-0">사원 목록</h5>
                        </li>
                        <li class="chat-contact-list-item contact-list-item-0 d-none">
                          <h6 class="text-muted mb-0">사원이 없습니다</h6>
                        </li>

	
													<c:forEach var="memList" items="${ memberList }">
														<c:forEach var="memProfile" items="${ chatProfileList }">
														<c:if test="${ memList.memNo eq  memProfile.memNo}">
	                        <li class="chat-contact-list-item userInFo" data-target="#app-chat-sidebar-right" data-bs-toggle="sidebar" data-overlay="app-overlay-ex" id="userInFo">
	                        	<input type="hidden" value="${ memList.memNo }">
	                          <a class="d-flex align-items-center">
	                            <div class="flex-shrink-0 avatar">
	                              <img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
	                            </div>
	                            <div class="chat-contact-info flex-grow-1 ms-4">
	                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">${ memList.memName }</h6>
	                              <small class="chat-contact-status text-truncate">${ memProfile.cpMessage }</small>
	                            </div>
	                          </a>
	                        </li>
	                       		 </c:if>
	                      		</c:forEach>
													</c:forEach>

                      </ul>
                    </div>
                  </div>
                  <!-- /Chat contacts -->

                  
                  <!-- 채팅방 메뉴칸 -->
		
                  <!-- 상대방 정보 확인 -->

		                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-right">
		                    <div
		                      class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
		                      <div class="avatar avatar-xl avatar-online chat-sidebar-avatar">
		                        <img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
		                      </div>
		                      <h5 class="mt-4 mb-0" id="userNameInfo">사람이름자리</h5>
		                      <div>
		                      <span id="deptName">부서코드</span>
		                      </div>
		                      <i
		                        class="ti ti-x ti-lg cursor-pointer close-sidebar d-block"
		                        data-bs-toggle="sidebar"
		                        data-overlay="app-overlay-ex"
		                        data-target="#app-chat-sidebar-right"></i>
		                    </div>
		
		                    <div class="sidebar-body p-6 pt-0">
		                      <div class="my-6">
		                        <p class="text-uppercase mb-1 text-muted">상태 메시지</p>
		                       
		                        <p class="mb-0" id="statusmessage">
		                          
		                        </p>
		                       
		                      </div>
		
		
		                      <div class="my-6">
		                        <p class="text-uppercase mb-1 text-muted">정보</p>
		                        <ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
		                          <li class="d-flex align-items-center">
		                            <i class="ti ti-mail ti-md"></i>
		                            <span class="align-middle ms-2" id="emailinfo">${ m.email }</span>
		                          </li>
		                          <li class="d-flex align-items-center">
		                            <i class="ti ti-phone-call ti-md"></i>
		                            <span class="align-middle ms-2" id="phoneinfo">${ m.phone }</span>
		                          </li>
		                        </ul>
		                      </div>
		
													
		                      <div class="d-flex mt-6">
		                        <button
		                          class="btn btn-primary w-100 chatStart"
		                          data-bs-toggle="sidebar"
		                          data-overlay
		                          >
		                          채팅 시작
		                        </button>
		                      </div>
		                   
		                      
		                    </div>
		                  </div>


	


          

                  <!-- 메인 화면 -->
                  <div class="col app-chat-history" style="display: block;" id="chatMain">

                  </div>
                  <!-- 메인 화면 끘-->



                  




                  <!-- 채팅방 클릭시 보이는 화면 -->
                  <div class="col app-chat-history" style="display: none;" id="chatList">

                    <div class="chat-history-wrapper">
                      <div class="chat-history-header border-bottom">
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex overflow-hidden align-items-center">
                            <div class="chat-contact-info flex-grow-1">
                              <h6 class="m-0 fw-normal testname" style="font-weight: 900;" id="testname">김유</h6>



                            </div>
                          </div>



                   
                          <div class="col app-chat-sidebar-right app-sidebar px-3 pb-6 ps overflow-hidden" data-overlay="app-overlay-ex" id="app-chat-sidebar-right-setting" style="display: block;">
                            <div
                              class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap pt-12" >
                              <i
                                class="ti ti-x ti-lg cursor-pointer close-sidebar d-block"
                                data-bs-toggle="sidebar"
                                data-target="#app-chat-sidebar-right-setting"
                                ></i>
                            </div>
                     
                              <div class="my-6">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-lock ti-md me-1"></i>
                                      <span class="align-middle">채팅 잠금</span>
                                    </div>
                                    <div class="form-check form-switch mb-0 me-1">
                                      <input type="checkbox" class="form-check-input" />
                                    </div>
                                  </li>
                                </ul>
                              </div>


                              <div class="my-6">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-bell ti-md me-1"></i>
                                      <span class="align-middle">채팅 알림</span>
                                    </div>
                                    <div class="form-check form-switch mb-0 me-1">
                                      <input type="checkbox" class="form-check-input" />
                                    </div>
                                  </li>
                                </ul>
                              </div>



                              <div class="my-6" data-target="#app-chat-sidebar-invitelist" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-user-plus ti-md me-1"></i>
                                      <span class="align-middle">인원 초대</span>
                                    </div>
                                  </li>
                                </ul>
                              </div>



                              <div class="my-6" data-target="#app-chat-sidebar-userlist" data-bs-toggle="sidebar" data-overlay="app-overlay-ex" 
                              id="chatuserlist">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-users ti-md me-1"></i>
                                      <span class="align-middle" id="chatuserlist;">채팅 참여자 목록</span>
                                    </div>
                                  </li>
                                </ul>
                              </div>



                              <div class="my-6" data-target="#app-chat-sidebar-modifytitle" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-brush ti-md me-1"></i>
                                      <span class="align-middle">채팅방 이름 수정</span>
                                    </div>
                                  </li>
                                </ul>
                              </div>


                              <div class="my-6">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div id="chatOut">
                                      <i class="ti ti-login ti-md me-1"></i>
                                      <span class="align-middle">채팅방 나가기</span>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                          </div>
                         





                          
                          <div class="d-flex align-items-center" >
                            <i
                            class="ti ti-search ti-md cursor-pointer d-sm-inline-flex d-none me-1 btn btn-sm btn-text-secondary text-secondary btn-icon rounded-pill"></i>
                            <input type="search" class="form-control">
                            <div class="dropdown">
                              <button
                                class="btn btn-sm btn-icon btn-text-secondary text-secondary rounded-pill dropdown-toggle hide-arrow"
                                data-bs-toggle="sidebar"
                                aria-expanded="true"
                                id="chat-header-actions"
                                data-target="#app-chat-sidebar-right-setting">
                                <i class="ti ti-md ti-settings" ></i>
                              </button>
                              </div>
                            </div>


                            <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-modifytitle" style="height: 75px;">
                              <div
                              class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                              id="app-chat-modifytitlecontent">
                              <div class="sidebar-header h-px-75 px-5 border-bottom d-flex align-items-center" style="justify-content: center;">
                                
                                <div class="d-flex align-items-center me-6 me-lg-0">
                                  <div class="flex-grow-1 input-group input-group-merge">
                                    <input
                                      type="text"
                                      class="form-control chat-search-input"
                                       />
                                       <button class="btn btn-primary">변경</button>
                                      </div>
                                    <div>
                                 </div>
                                </div>
                              </div>
                              </div>


                          

                          </div>
                        </div>
                      </div>
                        







                      <!-- 채팅방 메뉴칸 끝-->
												

                      <!-- 채팅 기록 -->

                      
                      




                      
                        <div class="chat-history-header noticeContent" style="position: absolute; width: 100%; z-index: 1; background-color: #ffffffad; display:none" id="noticeContent">
                              <div class="d-flex overflow-hidden align-items-center">
                                <div class="chat-contact-info flex-grow-1">
                                  <h6 class="m-0 fw-normal noticeMessage" style="font-weight: 900;" id="noticeMessage">공지사항 내용이 들어갈 자리</h6>  
                                </div>
                                <i
                                class="ti ti-x ti-lg cursor-pointer close-sidebar d-block" id="noticeClose">
                                </i>
                              </div>
                        </div>


                      <div class="chat-history-body chatarea" id="chatarea">
                        <ul class="list-unstyled chat-history" id="chathistory">

                          <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">이거 오늘안에 다 못하겠는데요</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <small>10:10</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-4">
                                <div class="avatar avatar-sm">
                                  <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                          
                          
                          
                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-4">
                                <div class="avatar avatar-sm" data-target="#app-chat-sidebar-right" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                  <img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                              <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                  <p class="mb-0">빨리 좀 해주세요</p>
                                </div>

                                <div class="text-muted mt-1">
                                  <small>10:15</small>
                                </div>
                              </div>
                              <div class="me-2" style="text-align: center; color: black; font-size: 13px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center;">
                                
                              </div>
                              <div style="text-align: center; color: #737682; font-size: 10px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center;">
                                (수정됨)
                              </div>
                            </div>
                          </li>

                          
                          
                          
                          <li class="chat-message chat-message-right">
                            <div class="dropdown">
                              
                              <button
                                class="btn btn-sm btn-icon btn-text-secondary text-secondary rounded-pill dropdown-toggle hide-arrow"
                                data-bs-toggle="dropdown"
                                aria-expanded="true"
                                id="chat-header-actions"
                                >
                                <i class="ti ti-dots-vertical ti-md"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="chat-header-actions">
                                <a class="dropdown-item noticeInsert" id="noticeInsert">공지사항 등록</a>
                                <a class="dropdown-item messageModify" id="messageModify">수정</a>  
                                <a class="dropdown-item messageDelete" id="messageDelete">삭제</a>
                              </div>

                            </div>
                            <div class="d-flex overflow-hidden">

                              <div class="" style="display: block;  text-align: center; color: #737682; font-size: 10px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center; width: 50px;">
                                (수정됨)
                              </div>
                              <div class="me-2" style="text-align: center; color: black; font-size: 13px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center; margin-left: 8px;">
                                1
                              </div>
                              
                              <div class="chat-message-wrapper flex-grow-1 w-50">
                                
                                <div class="chat-message-text">
                                  <p class="mb-0 chatContent chatContent" id="chatContent">
                                    알겠습니다.
                                  </p>
                                  
                                </div>
                                <div class="text-end text-muted mt-1">
                                  <small>10:15</small>
                                </div>
                              </div>
                              <div class="user-avatar flex-shrink-0 ms-4">
                                <div class="avatar avatar-sm" data-target="#app-chat-sidebar-left" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                  <img src="${ contextPath }/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      
                      

                      <!-- 채팅 수정 칸 -->
                      <div class="chat-history-footer shadow-xs modifyDisplay" style="position: absolute; width: 95.5%; z-index: 1; display:none" id="modifyDisplay">
                        <form class="form-send-message d-flex justify-content-between align-items-center">
                          <input
                            class="form-control message-input border-0 me-4 shadow-none modifyForm"
                            id="modifyForm"/>
                          <div class="message-actions d-flex align-items-center">
                            <label for="attach-doc" class="form-label mb-0">
                            </label>
                            <i
                            class="ti ti-x ti-lg cursor-pointer close-sidebar d-block modifyClose" id="modifyClose">
                            </i>
                            <button class="btn btn-primary d-flex send-msg-btn">
                              <span class="align-middle d-md-inline-block d-none" style="flex: none;">수정</span>
                            </button>
                          </div>
                        </form>
                      </div>


                      <!-- 채팅 입력 칸  -->
                      <div class="chat-history-footer shadow-xs" >
                        <div class="form-send-message d-flex justify-content-between align-items-center" id="chatinput">
                          <input
                            class="form-control message-input border-0 me-4 shadow-none" 
                             id="inputchatform"/>
                          <div class="message-actions d-flex align-items-center">
                            <label for="attach-doc" class="form-label mb-0">
                              <i
                                class="ti ti-paperclip ti-md cursor-pointer btn btn-sm btn-text-secondary btn-icon rounded-pill mx-1 text-heading"></i>
                              <input type="file" id="attach-doc" hidden />
                            </label>
                            <button class="btn btn-primary d-flex send-msg-btn sendmessage" type="button" id="sendmessage">
                              <span class="align-middle d-md-inline-block d-none" style="flex: none;">전송</span>
                            </button>
                          </div>
                        </div>
                      </div> 

                      <!-- 채팅 잠금 화면 
                      <div class="chat-history-footer shadow-xs" id="chat-lock">
                        <form class="form-send-message d-flex justify-content-between align-items-center">
                          <i class="ti ti-lock ti-md mx-1 "></i>
                          <input
                            class="form-control message-input border-0 me-4 shadow-none"
                             disabled
                             value="잠금을 해제하시려면 확인버튼을 눌러주세요"/>
                             
                          <div class="message-actions d-flex align-items-center">

                            <button class="btn btn-primary d-flex send-msg-btn">
                              <span class="align-middle d-md-inline-block d-none" style="flex: none;">확인</span>
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>
                    -->

                  </div>
									
                  <!-- 채팅 기록 끝 -->

          



                  <!-- 테스트111111111111111111111111 -->

                  <style>
                    .sidebar-body {
                      overflow-y: auto; 
                    }
                  </style>
                  <!-- 인원 검색 -->
                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-invitelist">
                    <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="app-chat-userlist">
                    <div class="sidebar-header h-px-75 px-5 border-bottom d-flex align-items-center">
                      
                      <div class="d-flex align-items-center me-6 me-lg-0">
                        <div
                          class="flex-shrink-0 avatar avatar-online me-4"
                          data-bs-toggle="sidebar"
                          data-overlay="app-overlay-ex"
                          data-target="#app-chat-sidebar-invitelist">
                          <img
                            class="user-avatar rounded-circle cursor-pointer"
                            src="${ contextPath }/resources/assets/img/avatars/1.png"
                            alt="Avatar" />
                        </div>
                        <div class="flex-grow-1 input-group input-group-merge">
                          <span class="input-group-text" id="basic-addon-search31"><i class="ti ti-search"></i></span>
                          <input
                            type="text"
                            class="form-control chat-search-input"
                            placeholder="Search..."
                            aria-label="Search..."
                            aria-describedby="basic-addon-search31" />
                        </div>
                      </div>
                      <i
                        class="ti ti-x ti-lg cursor-pointer position-absolute top-50 end-0 translate-middle d-lg-none d-block"
                        data-overlay
                        data-bs-toggle="sidebar"
                        data-target="#app-chat-userlist"></i>
                    </div>

                    <div class="sidebar-body">


                      <!-- 채팅방 초대 목록 -->
                      <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                          <h5 class="text-primary mb-0">초대 목록</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">채팅방이 없습니다</h6>
                        </li>



											<c:forEach var="list" items="${ memberList }">
                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="${ contextPath }/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">${ list.memName }</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center" >
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i> 
                            </button>
                          </a>
                        </li>
											</c:forEach>




                      </ul>
                      <!-- 초대 목록 끝-->

                    </div>
                  </div>

                  </div>



                  











                  <!-- 채팅방 인원 목록 -->
                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-userlist">
                    <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="app-chat-chatuserlist">


                    <div class="sidebar-body">    
                      <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-userList">
                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                          <h5 class="text-primary mb-0">채팅 참여자 목록</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">채팅방이 없습니다</h6>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="${ contextPath }/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center" >
                              </div>
                            </div>
                          </a>
                        </li>


                      </ul>

                    </div>
                  </div>

                  </div>

                  <!-- 채팅방 인원 목록 끘 -->




                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-right-no2">
                    <div
                      class="sidebar-header d-flex flex-column justify-content-center align-items-center flex-wrap px-6 pt-12">
                      <div class="avatar avatar-xl avatar-online chat-sidebar-avatar">
                        <img src="${ contextPath }/resources/assets/img/avatars/5.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h5 class="mt-4 mb-0">황재운</h5>
                      <span>남성의류</span>
                      <i
                        class="ti ti-x ti-lg cursor-pointer close-sidebar d-block"
                        data-bs-toggle="sidebar"
                        data-overlay="app-overlay-ex"
                        data-target="#app-chat-sidebar-right-no2"></i>
                    </div>

                    <div class="sidebar-body p-6 pt-0">
                      <div class="my-6">
                        <p class="text-uppercase mb-1 text-muted">상태 메시지</p>
                        <p class="mb-0">
                          17~20일 휴가입니다
                        </p>
                      </div>


                      <div class="my-6">
                        <p class="text-uppercase mb-1 text-muted">정보</p>
                        <ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
                          <li class="d-flex align-items-center">
                            <i class="ti ti-mail ti-md"></i>
                            <span class="align-middle ms-2">john@email.com</span>
                          </li>
                          <li class="d-flex align-items-center">
                            <i class="ti ti-phone-call ti-md"></i>
                            <span class="align-middle ms-2">010-7757-7232</span>
                          </li>
                        </ul>
                      </div>


                      <div class="d-flex mt-6">
                        <button
                          class="btn btn-primary w-100"
                          data-bs-toggle="sidebar"
                          data-overlay
                          data-target="#app-chat-sidebar-right-no2">
                          채팅 시작
                        </button>
                      </div>
                    </div>
                  </div>



                  <!-- 상대 프로필 화면 끝 -->

                  <div class="app-overlay"></div>
                </div>
              </div>
            </div>
    
    </div>
	<!-- 세션 끝 -->
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
      var inviteMem = null;
      var inviteName = null;
      var chatNoData = null;

      $(document).ready(function(){
				
        // 사원 클릭시 start
        $('.userInFo').on('click',function(){
        	inviteMem = $(this).children().eq(0).val();
          $.ajax({
            url:'${contextPath}/chat/userInfo.do',
            data:{
              memNo:
                $(this).children().eq(0).val()
            },
            success:function(res){
              console.log(res);
              inviteName = res.m.memName;
              $('#userNameInfo').html(res.m.memName);
              $('#deptName').html(res.m.deptCode);
              $('#statusmessage').html(res.cp.cpMessage);
              $('#emailinfo').html(res.m.email);
              $('#phoneinfo').html(res.m.phone);
             
            },
          })
        })
        // 사원 클릭시 end        
        
        // 사이드바 다시 활성화 start
        $('#chat-header-actions').on('click',function(){
            $('#app-chat-sidebar-right-setting').css('display','block');
          })
          // 사이드바 다시 활성화 end
        
        // 채팅방 나가기 클릭시 start
        $('#chatOut').on('click',function(){
          $('#chatMain').css('display','block');
          $('#chatList').css('display','none');
          $('#app-chat-sidebar-right-setting').css('display','none'); // 채팅방 사이드바 메뉴 사라지게
        })
        // 채팅방 나가기 클릭시 end
        
        // 채팅방 인원 조회
        $('#chatuserlist').on('click',function(){
        	$.ajax({
        		url:'${contextPath}/chat/chatuserlist.do',
        		data:{chatNo:activeChat},
        		success:function(res){
        			
        			let l = '';
        			
        			
        			for(let i = 0;i<res.length;i++){
        			 l += '<li class="mb-1">'
        			 l += '<a class="d-flex align-items-center" style="margin: 20px;">'
        			 l += '<div class="flex-shrink-0 avatar avatar-online">'
        			 l += '<img src="${ contextPath }/resources/assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />'
        			 l += '</div>'
        			 l += '<div class="chat-contact-info flex-grow-1 ms-4">'
        			 l += '<div class="d-flex justify-content-between align-items-center">'
        			 l += '<h6 class="chat-contact-name text-truncate m-0 fw-normal">'+res[i].memName+'</h6>'
        			 l += '</div>'
        			 l += '<div class="d-flex justify-content-between align-items-center" >'
        			 l += '</div>'
        			 l += '</div>'
        			 l += '</a>'
        			 l += '</li>'
        			}
        			
        			
        			$('#chat-userList').html(l);
        		}
        	})
        })
   
 			 // 이벤트 위임
			 $('#chat-list').on('click', '.chat-contact-list-item', function () {
			    // 클릭된 요소를 찾기 위한 컨텍스트
			    const clickedChatNo = $(this).find('.chatlistno').val(); 
			    console.log('클릭된 채팅방 번호:', clickedChatNo);
			
			    // active 효과 적용
			    $('#chat-list .chat-contact-list-item').removeClass('active'); // active 제거
			    $(this).addClass('active'); // 클릭된 곳에 active 추가
			
			});
        

	     var chatNo = null;
	     var userNo = "${loginUser.memNo}"; // 로그인 유저 사번
	     var userName = "${loginUser.memName}"; // 로그인 유저 이름
	   	 var socket = new SockJS("${contextPath}/chatPage");
	     var socket2 = new SockJS("${contextPath}/chat?${loginUser.memNo}");
	     var client = Stomp.over(socket);
	     var activeChat = null;
	     
	     // sockjs 실행
	     
	     
	     
	     socket2.onmessage = onMessage;
	     
       $('.chatStart').on('click',function(){ // 채팅방생성 시작
		         socket2.send(JSON.stringify({ memNo: '${loginUser.memNo}',
		        	 														memName: '${loginUser.memName}',
																					inviteNo:inviteMem,
																					inviteName:inviteName
																					}));
      	
      }) // 채팅방생성 종료
      
    		
	     
      
      // sockjs 메시지 응답
     	function onMessage(evt){ 
    	   
    	   var loginName = '${loginUser.memName}'
    	   var chatData = JSON.parse(evt.data);
    	   var chatNoData = chatData.chatNo;
    	   var chatTitleData = chatData.chatTitle;
    	   var chatTitleData2 = chatData.chatTitle2;
    	   
    	   console.log(evt);
    	   
    	   let c = "";
    	   if(evt.data == '0'){
    		  	alert('존재하는 채팅방입니다.');
    	   }else{
		    	   c += '<li class="chat-contact-list-item mb-1 chat-list-form">';
		    	   c += '<input type="hidden" value="'+chatNoData+'" class="chatlistno">';
		    		 if(loginName == chatTitleData){
		    				c += '<input type="hidden" value="'+chatTitleData2+'" class="chatlistno">';
		    		 }else{
		    				c += '<input type="hidden" value="'+chatTitleData+'" class="chatlistno">';
		    		 }
		    		 c += '<a class="d-flex align-items-center">';
		    		 c += '<div class="flex-shrink-0 avatar avatar-offline">';
		    		 c += '<img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />';
		    		 c += '</div>';
		    		 c += '<div class="chat-contact-info flex-grow-1 ms-4 test1">';
		    		 c += '<div class="d-flex justify-content-between align-items-center">';
		    		 if(loginName == chatTitleData){
		    				c += '<h6 class="chat-contact-name text-truncate fw-normal m-0">'+chatTitleData2+'</h6>';
		    		 }else{
		    				c += '<h6 class="chat-contact-name text-truncate fw-normal m-0">'+chatTitleData+'</h6>';
		    		 }
		    		 c += '<small class="text-muted"></small>';
		    		 c += '</div>';
		    		 c += '<small class="chat-contact-status text-truncate"></small>';
		    		 c += '<input type="hidden" value="'+chatNoData+'" class="mewmsg">';
		    		 c += '</div>';
		    		 c +=	'</a>';							 
		    		 c += '</li>';
		    		 $('#chat-list').append(c);
    		   
    		   
	    		 
			     client.subscribe('/sub/' + chatNoData, function (chat) {
			            var content = JSON.parse(chat.body);                                  
			            if(activeChat == chatNoData){
				            var str = msgPrint(content.memNo, "${loginUser.memNo}", content.msgContent, content.msgRegistDate, content.msgCheck);
				            $('#chathistory').append(str);
				            $(".chatarea").scrollTop($(".chatarea")[0].scrollHeight);
			            }
							        $('.mewmsg').each(function () { // 미리보기 ajax 시작
							    		console.log('테스트 : '+$(this).val());
							    		console.log('채팅방 번호 :'+chatNo);
							    		
									    if ($(this).val() == content.chatNo) { 
									    	
									    		$.ajax({ 
									    			url:'${contextPath}/chat/updateNewMsg.do',
									    			data:{chatNo:content.chatNo,msgContent:content.msgContent},
									    			success:function(res){
									    				console.log('성공');
									    			}
									    		})
									    		
									    											    		// 채팅 날짜 넣어주기
													$(this).closest('.chat-contact-info').find('.text-muted').html(function() {
													    var msgDate = new Date(content.msgRegistDate); // Date 객체로 변환
													    var today = new Date();  // 오늘 날짜
													
													    
													    if (msgDate.toDateString() === today.toDateString()) {
													        
													        return msgDate.toLocaleTimeString('en-GB', { hour12: false }); 
													    } else {
													        
													        return msgDate.toLocaleDateString(); 
													    }
													}); // 채팅 날짜 넣어주기 끝
									    		
									        $(this).prev().html(content.msgContent); 
								    	} 
				
									}); // 미리보기 ajax 끝
			        });  
	    		 
	    		 
	    		 
    	   }
    	  
    	}; // sockjs 메시지 종료
	     
      
     	// sockjs 종료
     
	    // stomp 실행
			client.connect({}, function (frame) {
			    console.log("STOMP 연결됨");
			
			    // 모든 채팅방 구독                                                                                                                                                                                                                                                                                                                                                                 
			    chatNoList.forEach(function (chatNo) {
			        client.subscribe('/sub/' + chatNo, function (chat) {
			            var content = JSON.parse(chat.body);
			            var msgNum ="";
			            console.log(content.type)
			            // 채팅번호 입력 및 메시지 출력 ajax 시작
									if(content.type == 'message'){
			            $.ajax({
										url:'${contextPath}/chat/msgNum.do',
										success:function(res){
					            if(activeChat == chatNo){
						            var str = msgPrint(content.memNo, "${loginUser.memNo}", content.msgContent, content.msgRegistDate, content.msgCheck,res);
						            $('#chathistory').append(str);
						            $(".chatarea").scrollTop($(".chatarea")[0].scrollHeight);
						            
								        $('.mewmsg').each(function () { // 미리보기 ajax 시작
								    		console.log('채팅방 번호 :'+chatNo);
								    		console.log('테스트 : '+$(this).val());
								    		
										    if ($(this).val() == content.chatNo) { 
										    	
										    		$.ajax({ 
										    			url:'${contextPath}/chat/updateNewMsg.do',
										    			data:{chatNo:content.chatNo,msgContent:content.msgContent},
										    			success:function(res){
										    				console.log('성공');
										    			}
										    		})
										    		// 채팅 날짜 넣어주기
														$(this).closest('.chat-contact-info').find('.text-muted').html(function() {
														    var msgDate = new Date(content.msgRegistDate); // Date 객체로 변환
														    var today = new Date();  // 오늘 날짜
														
														    
														    if (msgDate.toDateString() === today.toDateString()) {
														        
														        return msgDate.toLocaleTimeString('en-GB', { hour12: false }); 
														    } else {
														        
														        return msgDate.toLocaleDateString(); 
														    }
														}); // 채팅 날짜 넣어주기 끝
														
										        $(this).prev().html(content.msgContent); 
										    	} 
						
												}); // 미리보기 ajax 끝
					            }
										}
								})}// 채팅번호 입력 및 메시지 출력 ajax 끝
									else if(content.type == 'delete'){

										 $('.mewmsg').each(function () { // 미리보기 ajax 시작
									    		console.log('채팅방 번호 :'+chatNo);
									    		console.log('테스트222222 : '+$(this).val());
									    		console.log($('#chatContent'+content.msgNo).html())
										 			console.log($(this).prev().html());
									    		if($(this).val() == content.chatNo) { 
										    			if($('#chatContent'+content.msgNo).html() == $(this).prev().html()){
												    	$(this).prev().html('삭제된 메시지입니다.'); 
															$('#chatContent'+content.msgNo).html('삭제된 메시지입니다.');
									    			}
									    		}
							
										}); // 미리보기 ajax 끝
										
										
                  }
									
									

			        });  
			    }); // 모든 구독 끝
			}); // stomp 종료

        // 채팅방 목록 클릭시 start 	
        $(document).on('click','.chat-list-form' ,function() {
        	activeChat = $(this).children().eq(0).val(); // 활성화된 채팅방 번호 넣기
        	chatTitle = $(this).children().eq(1).val();
        	$('#testname').html(chatTitle);
            
        	// AJAX 메세지 조회 출력 start
            let a = '';
            const $chatArea = $(".chatarea");
            $.ajax({
              url: '${contextPath}/chat/list.do',
              data: { chatNo: $(this).children().eq(0).val(), memNo:'${loginUser.memNo}' },
              success: function(res) {
                console.log(res);
                    
                for(let i=0;i<res.msg.length;i++){
                  a += msgPrint(res.msg[i].memNo, res.m, res.msg[i].msgContent, res.msg[i].msgRegistDate, res.msg[i].msgCheck, res.msg[i].msgNo)
                }
                
                $('#chathistory').html(a);
               // $('#testname').html($('.chattitle').html);
                $('#chatMain').css('display', 'none');
                $('#chatList').css('display', 'block');
                $(".chatarea").scrollTop(0);
                //$(".chatarea").scrollTop($(".chatarea")[0].scrollHeight);
                setTimeout(function() {
                    $(".chatarea").scrollTop($(".chatarea")[0].scrollHeight);
                }, 50);
		              
				        
                
              }
            });
            // AJAX 메세지 조회 출력 end


          });  // 채팅방 목록 클릭시 end 

          
          // 구독된 사람들에게 채팅메세지 발송
			          $("#inputchatform").on("keydown", function(evt){
			      			if(evt.keyCode == 13){
			      				if(!evt.shiftKey){
					            var msg = document.getElementById("inputchatform"); 
					            client.send('/pub/'+activeChat, {}, JSON.stringify({chatNo: activeChat,
					                                                            memNo: userNo,
					                                                            msgContent: msg.value,
					                                                            msgType:'message',
					                                                            msgRegistDate: new Date().toISOString()
					                                                          }));
					            msg.value = '';
			      				}
			      			}            
			        }); // 구독된 사람들에게 채팅메세지 발송 끝
			   
			    // 메시지 삭제 시작
	          $(document).on('click', '.messageDelete', function () {
			  	    	var msgNo = $(this).data('value');
			  	    	client.send('/pub/'+activeChat, {}, JSON.stringify({msgNo: msgNo,
																								                    msgType:'delete',
																								                    chatNo: activeChat
																								                  }));
  					});
			        


      })
      
      function msgPrint(writer, userNo, msgContent, msgDate, msgCheck, msgNo){
    	let str = "";
    	
   	  	if(writer == userNo){
          str += '<li class="chat-message chat-message-right" id="megList"'+msgNo+'>';
          str += '<div class="dropdown">';
          str += '<button class="btn btn-sm btn-icon btn-text-secondary text-secondary rounded-pill dropdown-toggle hide-arrow waves-effect waves-light" data-bs-toggle="dropdown" aria-expanded="true" id="chat-header-actions">'
          str += '<i class="ti ti-dots-vertical ti-md"></i>';
          str += '</button>';
          str += '<div class="dropdown-menu dropdown-menu-end" aria-labelledby="chat-header-actions">';
          str += '<a class="dropdown-item noticeInsert waves-effect" id="noticeInsert">공지사항 등록</a>';
          str += '<a class="dropdown-item messageModify waves-effect" id="messageModify">수정</a>';
          str += '<input type="hidden" value="'+msgNo+'" class="msgNo">';
          str += '<a class="dropdown-item messageDelete waves-effect" id="messageDelete" data-value="'+msgNo+'">삭제</a>';
          str += '</div>';
          str += '</div>';
          str += '<div class="d-flex overflow-hidden">';
          str += '<div class="" style="display: none;  text-align: center; color: #737682; font-size: 10px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center; width: 50px;">(수정됨)</div>'
          str += '<div class="me-2" style="text-align: center; color: black; font-size: 13px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center; margin-left: 8px;">'+ msgCheck +'</div>'

          str += '<div class="chat-message-wrapper flex-grow-1 w-50">';
          str += '<div class="chat-message-text messageNoCheck">';
          str += '<p class="mb-0 chatContent chatContent" id="chatContent'+msgNo+'">'+ msgContent +'</p>';
          str += '</div>';
          str += '<div class="text-end text-muted mt-1">';
          str += '<small>'+ msgDate +'</small>';
          str += '</div>';
          str += '</div>';
          str += '<div class="user-avatar flex-shrink-0 ms-4">';
          str += '<div class="avatar avatar-sm" data-target="#app-chat-sidebar-left" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">';
          str += '<img src="${ contextPath }/resources/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />';
          str += '</div>';
          str += '</div>';
          str += '</li>';

        }else{
          str += '<li class="chat-message">';
          str += '<div class="d-flex overflow-hidden">';
          str += '<div class="user-avatar flex-shrink-0 me-4">';
          str += '<div class="avatar avatar-sm" data-target="#app-chat-sidebar-right" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">';
          str += '<img src="${ contextPath }/resources/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />';
          str += '</div>';
          str += '</div>';
          str += '<div class="chat-message-wrapper flex-grow-1">';
          str += '<div class="chat-message-text">';
          str += '<p class="mb-0">'+ msgContent +'</p>';
          str += '</div>';
          str += '<div class="text-muted mt-1">';
          str += '<small>'+ msgDate +'</small>';
          str += '</div>';
          str += '</div>';
          str += '<div class="me-2" style="text-align: center; color: black; font-size: 13px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center;">';
          str += '</div>';
          str += '<div style="text-align: center; display: none; color: #737682; font-size: 10px; font-family: Public Sans; font-weight: 500; line-height: 20px; word-wrap: break-word; align-self: center;">';
          str += '(수정됨)';
          str += '</div>';
          str += '</div>';
          str += '</li>';
        }
   	  	

   	  	return str;
      }

      

      function toggleButton(button) {
        const icon = button.querySelector("i");
    
        // 버튼이 btn-primary 클래스인 경우
        button.classList.contains("btn-primary") 
        button.classList.remove("btn-primary");
        button.style.background = "#d5d1ff";  // 변경된 배경 색상
        icon.classList.replace("ti-user-x", "ti-user-check"); // 아이콘 변경
      }
    </script>
    
    
    
    <script>
    	var chatNoList = [];
    	var chatSocketClientList = []; // [{chatNo:방번호, socket:소켓객체, client:client객체}, ]
    	var socket = new SockJS("${contextPath}/chatPage.do");
    	var client = Stomp.over(socket);
    	
    	$(document).ready(function(){
    		// 모든 채팅방 구독해두기 
            for(let i=0; i<chatNoList.length; i++){
            	// let socket = new SockJS("${contextPath}/chatPage"); // 엔드포인트
                //let client = Stomp.over(socket);
            		
                 //client.connect({},function(frame){
                	 //console.log('클라이언트 연결연결경ㄴ결');
                 
                //});  
            	
            	let obj = {
            		chatNo: chatNoList[i],
            		//socket: socket,
            		//client: client
            	};
            	
            	chatSocketClientList.push(obj);
            }
    			
    	})
        
    	
        function getClient(chatNo, chatSocketClientList){
            for(let i=0; i<chatSocketClientList.length; i++){

            	if(chatSocketClientList[i].chatNo == chatNo){
                return chatSocketClientList[i].client;
              }
            }
          }
    </script>
    
    <c:forEach var="list" items="${ chatList }">
	<script>
		chatNoList.push(${list.chatNo});
	</script>
	</c:forEach>



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
	
	
	
	
	
</body>
</html>
