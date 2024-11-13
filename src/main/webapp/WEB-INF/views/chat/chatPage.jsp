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
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
	
	
    <!-- 헤더 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- 헤더 끝 -->
    
    <!-- nav 시작 -->
		<div class="layout-page">
			    <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="ti ti-menu-2 ti-md"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item navbar-search-wrapper mb-0">
                  <a class="nav-item nav-link search-toggler d-flex align-items-center px-0" href="javascript:void(0);">
                    <i class="ti ti-search ti-md me-2 me-lg-4 ti-lg"></i>
                    <span class="d-none d-md-inline-block text-muted fw-normal">Search (Ctrl+/)</span>
                  </a>
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Language -->
                
                <!--/ Language -->

                <!-- Style Switcher -->
                <li class="nav-item dropdown-style-switcher dropdown">
                  <a
                    class="nav-link btn btn-text-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <i class="ti ti-md"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-styles">
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                        <span class="align-middle"><i class="ti ti-sun ti-md me-3"></i>Light</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                        <span class="align-middle"><i class="ti ti-moon-stars ti-md me-3"></i>Dark</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                        <span class="align-middle"
                          ><i class="ti ti-device-desktop-analytics ti-md me-3"></i>System</span
                        >
                      </a>
                    </li>
                  </ul>
                </li>
                <!-- / Style Switcher-->

                <!-- Quick links  -->
               
                <!-- Quick links -->

                <!-- 알림 -->
                <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-2">
                  <a
                    class="nav-link btn btn-text-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <span class="position-relative">
                      <i class="ti ti-bell ti-md"></i>
                      <span class="badge rounded-pill bg-danger badge-dot badge-notifications border"></span>
                    </span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end p-0">
                    <li class="dropdown-menu-header border-bottom">
                      <div class="dropdown-header d-flex align-items-center py-3">
                        <h6 class="mb-0 me-auto">알림</h6>
                      </div>
                    </li>
                    <li class="dropdown-notifications-list scrollable-container">
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
                          <div class="d-flex">
                            <div class="flex-shrink-0 me-3">
                              <div class="avatar">
                                <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <h6 class="small mb-1">Congratulation Lettie 🎉</h6>
                              <small class="mb-1 d-block text-body">Won the monthly best seller gold badge</small>
                              <small class="text-muted">1h ago</small>
                            </div>
                            <div class="flex-shrink-0 dropdown-notifications-actions">
                              <a href="javascript:void(0)" class="dropdown-notifications-read"
                                ><span class="badge badge-dot"></span
                              ></a>
                              <a href="javascript:void(0)" class="dropdown-notifications-archive"
                                ><span class="ti ti-x"></span
                              ></a>
                            </div>
                          </div>
                        </li>
                       
                      </ul>
                    </li>
                    <li class="border-top">
                      <div class="d-grid p-4">
                        <a class="btn btn-primary btn-sm d-flex" href="javascript:void(0);">
                          <small class="align-middle">View all notifications</small>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
                <!--/ 알림 -->

                <!-- 유저정보 -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a
                    class="nav-link dropdown-toggle hide-arrow p-0"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item mt-0" href="pages-account-settings-account.html">
                        <div class="d-flex align-items-center">
                          <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                              <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">John Doe</h6>
                            <small class="text-muted">Admin</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider my-1 mx-n2"></div>
                    </li>
                   
                    <li>
                      <div class="d-grid px-2 pt-2 pb-1">
                        <a class="btn btn-sm btn-danger d-flex" href="auth-login-cover.html" target="_blank">
                          <small class="align-middle">Logout</small>
                          <i class="ti ti-logout ms-2 ti-14px"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
                <!--/ 유저정보 -->
              </ul>
            </div>

            <!-- Search Small Screens -->
            <div class="navbar-search-wrapper search-input-wrapper d-none">
              <input
                type="text"
                class="form-control search-input container-xxl border-0"
                placeholder="Search..."
                aria-label="Search..." />
              <i class="ti ti-x search-toggler cursor-pointer"></i>
            </div>
          </nav>

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
                        <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
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
                            src="../../assets/img/avatars/1.png"
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

                        <!-- 단체 채팅방 -->
                        <li class="chat-contact-list-item mb-1 chat-list-form">
                          <a class="d-flex align-items-center">
                          
                            <div class="flex-shrink-0 avatar">
                              <div style="flex-direction: row; display: flex;"><img src="../../assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
                                <img src="../../assets/img/avatars/7.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
                              </div>
                              <div style="flex-direction: row; display: flex;"><img src="../../assets/img/avatars/14.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
                                <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" style="width: 20px; height: 20px;" />
                              </div>

                            </div>

                            
                          
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">인사팀</h6>
                                <small class="text-muted">2024-11-08</small>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              <small class="chat-contact-status text-truncate">매너가 사람을 만든다</small>
                              <div class="badge bg-danger rounded-pill ms-auto">5</div>
                              </div>
                            </div>
                          </a>
                        </li>
                        <!-- 단체 채팅방 끗 -->


                        <li class="chat-contact-list-item active mb-1 chat-list-form">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-offline">
                              <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate fw-normal m-0">김유빈</h6>
                                <small class="text-muted">30분전</small>
                              </div>
                              <small class="chat-contact-status text-truncate">수고하셨습니다.</small>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item mb-0 chat-list-form">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar avatar-busy">
                              <span class="avatar-initial rounded-circle bg-label-success">CM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate fw-normal m-0">박막례</h6>
                                <small class="text-muted">2024-11-06</small>
                              </div>
                              <small class="chat-contact-status text-truncate"
                                >선제시요</small
                              >
                            </div>
                          </a>
                        </li>


                        
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


                        <li class="chat-contact-list-item" data-target="#app-chat-sidebar-right" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar">
                              <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">김유빈</h6>
                              <small class="chat-contact-status text-truncate">안녕하세요</small>
                            </div>
                          </a>
                        </li>


                        <li class="chat-contact-list-item" data-target="#app-chat-sidebar-right-no2" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar">
                              <img src="../../assets/img/avatars/5.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">황재운</h6>
                              <small class="chat-contact-status text-truncate">17~20일 휴가입니다</small>
                            </div>
                          </a>
                        </li>


                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="avatar d-block flex-shrink-0">
                              <span class="avatar-initial rounded-circle bg-label-primary">LM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">황조롱이</h6>
                              <small class="chat-contact-status text-truncate">삐약삐약</small>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar">
                              <img src="../../assets/img/avatars/7.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">박시우</h6>
                              <small class="chat-contact-status text-truncate">아 졸라 싫어</small>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar">
                              <img src="../../assets/img/avatars/8.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">이예빈</h6>
                              <small class="chat-contact-status text-truncate">우리 강아지 귀엽죠</small>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="avatar d-block flex-shrink-0">
                              <span class="avatar-initial rounded-circle bg-label-success">CM</span>
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">박막례</h6>
                              <small class="chat-contact-status text-truncate" style="color: blueviolet;";>국수 팝니다 문의는 카톡</small>
                            </div>
                          </a>
                        </li>
                        <li class="chat-contact-list-item">
                          <a class="d-flex align-items-center">
                            <div class="flex-shrink-0 avatar">
                              <img src="../../assets/img/avatars/10.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <h6 class="chat-contact-name text-truncate m-0 fw-normal">김동규</h6>
                              <small class="chat-contact-status text-truncate">이거 폰트 다르지 않아요?</small>
                            </div>
                          </a>
                        </li>

                      
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
                        <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                      </div>
                      <h5 class="mt-4 mb-0">김유빈</h5>
                      <span>인사팀</span>
                      <i
                        class="ti ti-x ti-lg cursor-pointer close-sidebar d-block"
                        data-bs-toggle="sidebar"
                        data-overlay="app-overlay-ex"
                        data-target="#app-chat-sidebar-right"></i>
                    </div>

                    <div class="sidebar-body p-6 pt-0">
                      <div class="my-6">
                        <p class="text-uppercase mb-1 text-muted">상태 메시지</p>
                        <p class="mb-0">
                          안녕하세요
                        </p>
                      </div>


                      <div class="my-6">
                        <p class="text-uppercase mb-1 text-muted">정보</p>
                        <ul class="list-unstyled d-grid gap-4 mb-0 ms-2 py-2 text-heading">
                          <li class="d-flex align-items-center">
                            <i class="ti ti-mail ti-md"></i>
                            <span class="align-middle ms-2">josephGreen@email.com</span>
                          </li>
                          <li class="d-flex align-items-center">
                            <i class="ti ti-phone-call ti-md"></i>
                            <span class="align-middle ms-2">010-1122-1569</span>
                          </li>
                        </ul>
                      </div>


                      <div class="d-flex mt-6">
                        <button
                          class="btn btn-primary w-100"
                          data-bs-toggle="sidebar"
                          data-overlay
                          data-target="#app-chat-sidebar-right">
                          채팅 시작
                        </button>
                      </div>
                    </div>
                  </div>



          

                  <!-- 메인 화면 -->
                  <div class="col app-chat-history" style="display: none;" id="chatMain">

                  </div>
                  <!-- 메인 화면 끘-->



                  




                  <!-- 채팅방 클릭시 보이는 화면 -->
                  <div class="col app-chat-history" style="display: block;" id="chatList">

                    <div class="chat-history-wrapper">
                      <div class="chat-history-header border-bottom">
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="d-flex overflow-hidden align-items-center">
                            <div class="chat-contact-info flex-grow-1">
                              <h6 class="m-0 fw-normal" style="font-weight: 900;">김유빈</h6>



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



                              <div class="my-6" data-target="#app-chat-sidebar-userlist" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                <p class="text-uppercase text-muted mb-1"></p>
                                <ul class="list-unstyled d-grid gap-4 ms-2 pt-2 text-heading">
                                  <li class="d-flex justify-content-between align-items-center">
                                    <div>
                                      <i class="ti ti-users ti-md me-1"></i>
                                      <span class="align-middle">채팅 참여자 목록</span>
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
                      <script>
                        //  공지사항 삭제
                        $(document).ready(function(){
                          $('#noticeClose').on('click',function(){
                            $('#noticeContent').css('display','none');
                          })

                        // 공지사항 등록
                          const message = document.querySelector('#chatContent').innerHTML;

                          $('.noticeInsert').on('click',function(){
                            $('.noticeMessage').html(message);
                            $('.noticeContent').css('display','block');
                          })

                        // 채팅 수정하기
                          $('.messageModify').on('click',function(){
                            $('.modifyDisplay').css('display','block');
                            $('.modifyForm').prop('placeholder','수정합니다');
                          })

                          
                          // 수정하기 취소
                          $('.modifyClose').on('click',function(){
                            $('.modifyDisplay').css('display','none');
                          })

                          // 메시지 삭제

                          $('.messageDelete').on('click', function() {
                            // 클릭된 삭제 버튼을 기준으로 해당 메시지를 찾고 내용 변경
                            $(this).closest('.chat-message').find('.chatContent').html('삭제된 메시지입니다.').css('color','lightgray');
                          });

                          // 채팅방 나가기
                          $('#chatOut').on('click',function(){
                            $('#chatMain').css('display','block');
                            $('#chatList').css('display','none');
                            $('#app-chat-sidebar-right-setting').css('display','none'); // 채팅방 사이드바 메뉴 사라지게
                          })
                          // 채팅방 입장
                          $('.chat-list-form').on('click',function(){
                            $('#chatMain').css('display','none');
                            $('#chatList').css('display','block');
                          })
                          // 사이드바 다시 활성화
                          $('#chat-header-actions').on('click',function(){
                            $('#app-chat-sidebar-right-setting').css('display','block');
                          })





                      })


                      </script>
                      




                      
                        <div class="chat-history-header noticeContent" style="position: absolute; width: 100%; z-index: 1; background-color: #ffffffad;" id="noticeContent">
                              <div class="d-flex overflow-hidden align-items-center">
                                <div class="chat-contact-info flex-grow-1">
                                  <h6 class="m-0 fw-normal noticeMessage" style="font-weight: 900;" id="noticeMessage">공지사항 내용이 들어갈 자리</h6>  
                                </div>
                                <i
                                class="ti ti-x ti-lg cursor-pointer close-sidebar d-block" id="noticeClose">
                                </i>
                              </div>
                        </div>


                      <div class="chat-history-body">
                        <ul class="list-unstyled chat-history">

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
                                  <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                          </li>

                          <li class="chat-message">
                            <div class="d-flex overflow-hidden">
                              <div class="user-avatar flex-shrink-0 me-4">
                                <div class="avatar avatar-sm" data-target="#app-chat-sidebar-right" data-bs-toggle="sidebar" data-overlay="app-overlay-ex">
                                  <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
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
                                  <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
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
                                  <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
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
                                  <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
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
                                  <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                                </div>
                              </div>
                            </div>
                            
                          </li>
                          



                          
                          




                          
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
                        <form class="form-send-message d-flex justify-content-between align-items-center">
                          <input
                            class="form-control message-input border-0 me-4 shadow-none"
                             />
                          <div class="message-actions d-flex align-items-center">
                            <label for="attach-doc" class="form-label mb-0">
                              <i
                                class="ti ti-paperclip ti-md cursor-pointer btn btn-sm btn-text-secondary btn-icon rounded-pill mx-1 text-heading"></i>
                              <input type="file" id="attach-doc" hidden />
                            </label>
                            <button class="btn btn-primary d-flex send-msg-btn">
                              <span class="align-middle d-md-inline-block d-none" style="flex: none;">전송</span>
                            </button>
                          </div>
                        </form>
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




          



                   <!-- 테스트!@#!@#!@#!@#12 -->

                    <!-- 테스트!@#!@#!@#!@#12 -->
                      <!-- 테스트!@#!@#!@#!@#12 -->
                        <!-- 테스트!@#!@#!@#!@#12 -->

                         <!-- 테스트!@#!@#!@#!@#12 -->
                           <!-- 테스트!@#!@#!@#!@#12 -->
                             <!-- 테스트!@#!@#!@#!@#12 -->

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
                            src="../../assets/img/avatars/1.png"
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


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center" >
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i> 
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/12.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i> 
                            </button>
                          </a>
                        </li>



                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/11.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>



                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/10.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/9.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/8.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/7.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i>
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/5.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon  btn-primary" onclick="toggleButton(this)">
                              <i class="ti ti-user-x"></i> 
                            </button>
                          </a>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                            </div>
                            <div class="chat-contact-info flex-grow-1 ms-4">
                              <div class="d-flex justify-content-between align-items-center">
                                <h6 class="chat-contact-name text-truncate m-0 fw-normal">매너남</h6>
                              </div>
                              <div class="d-flex justify-content-between align-items-center">
                              </div>
                             
                            </div>
                            <button class="btn btn-icon" style="background: #d5d1ff;" onclick="toggleButton(this)">
                              <i class="ti ti-user-check"></i> 
                            </button>
                          </a>
                        </li>







                      </ul>
                      <!-- 초대 목록 끝-->

                    </div>
                  </div>

                  </div>


                  <script>
                    function toggleButton(button) {
                      const icon = button.querySelector("i");
                  
                      // 버튼이 btn-primary 클래스인 경우
                        button.classList.contains("btn-primary") 
                        button.classList.remove("btn-primary");
                        button.style.background = "#d5d1ff";  // 변경된 배경 색상
                        icon.classList.replace("ti-user-x", "ti-user-check"); // 아이콘 변경
                      }
                    
                  </script>


                  










                  <!-- 테스트!@#!@#!@#!@#12 -->
 <!-- 테스트!@#!@#!@#!@#12 -->
   <!-- 테스트!@#!@#!@#!@#12 -->
     <!-- 테스트!@#!@#!@#!@#12 -->


      <!-- 테스트!@#!@#!@#!@#12 -->
        <!-- 테스트!@#!@#!@#!@#12 -->

         <!-- 테스트!@#!@#!@#!@#12 -->
           <!-- 테스트!@#!@#!@#!@#12 -->
             <!-- 테스트!@#!@#!@#!@#12 -->
               <!-- 테스트!@#!@#!@#!@#12 -->

                <!-- 테스트!@#!@#!@#!@#12 -->






                  <!-- 채팅방 인원 목록 -->
                  <div class="col app-chat-sidebar-right app-sidebar overflow-hidden" id="app-chat-sidebar-userlist">
                    <div
                    class="col app-chat-contacts app-sidebar flex-grow-0 overflow-hidden border-end"
                    id="app-chat-chatuserlist">


                    <div class="sidebar-body">


                      <!-- 채팅방 초대 목록 -->
                      <ul class="list-unstyled chat-contact-list py-2 mb-0" id="chat-list">
                        <li class="chat-contact-list-item chat-contact-list-item-title mt-0">
                          <h5 class="text-primary mb-0">채팅 참여자 목록</h5>
                        </li>
                        <li class="chat-contact-list-item chat-list-item-0 d-none">
                          <h6 class="text-muted mb-0">채팅방이 없습니다</h6>
                        </li>


                        <li class="mb-1">
                          <a class="d-flex align-items-center" style="margin: 20px;">
                            <div class="flex-shrink-0 avatar avatar-online">
                              <img src="../../assets/img/avatars/13.png" alt="Avatar" class="rounded-circle" />
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
                        <img src="../../assets/img/avatars/5.png" alt="Avatar" class="rounded-circle" />
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