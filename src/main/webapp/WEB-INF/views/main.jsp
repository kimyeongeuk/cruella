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
    
    
    <div class="row g-6">
                <!-- Website Analytics -->
                <div class="col-lg-6" style="width: 450px;">
                  <div>
                    <div class="card">
                      <div class="card-body text-center">
                        <div class="dropdown btn-pinned">
                          <button
                            type="button"
                            class="btn btn-icon btn-text-secondary rounded-pill dropdown-toggle hide-arrow p-4"
                            data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="ti ti-dots-vertical ti-md text-muted"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="javascript:void(0);">Share connection</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);">Block connection</a></li>
                            <li>
                              <hr class="dropdown-divider" />ㅇ
                            </li>
                            <li><a class="dropdown-item text-danger" href="javascript:void(0);">Delete</a></li>
                          </ul>
                        </div>
                        <div class="mx-auto my-6">
                          <img src="../../assets/img/avatars/3.png" alt="Avatar Image" class="rounded-circle w-px-100" />
                        </div>
                        <h5 class="mb-0 card-title">Mark Gilbert</h5>
                        <div class="d-flex align-items-center justify-content-center my-6 gap-2">
                          <a href="javascript:;" class="me-2"><span class="badge bg-label-secondary">인사관리팀</span></a>
                          <a href="javascript:;"><span class="badge bg-label-warning">대리</span></a>
                        </div>
  
                        <div class="d-flex align-items-center justify-content-around mb-6">
                          <div>
                            <h5 class="mb-0">18</h5>
                            <span>메세지</span>
                          </div>
                          <div>
                            <h5 class="mb-0">10</h5>
                            <span>잔여 휴가</span>
                          </div>
                          <div>
                            <h5 class="mb-0">129</h5>
                            <span>뭐적을까</span>
                          </div>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                          <a href="javascript:;" class="btn btn-primary d-flex align-items-center me-4"
                            ><i class="ti-xs me-1 ti ti-clock me-2"></i>출근
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Website Analytics -->
                <!-- Average Daily Sales -->
                <div class="col-xl-3 col-sm-6" style="width: 500px;">
                  <div class="card h-100">
                    <div class="card-header pb-0">
                      <h5 class="mb-3 card-title">Average Daily Sales</h5>
                      <p class="mb-0 text-body">Total Sales This Month</p>
                      <h4 class="mb-0">$28,450</h4>
                    </div>
                    <div class="card-body px-0">
                      <div id="averageDailySales"></div>
                    </div>
                  </div>
                </div>
                <!--/ Average Daily Sales -->

                <!-- Memo -->
                <div class="card" style="width: 450px;">
                  <div class="card-body" style="padding: 0%; padding-top: 25px;">
                    <div>
                      <small class="card-text text-uppercase text-muted small" style="margin-left: 30px;">Memo</small> 
                      <i class="ti ti-edit ti-sm" style="margin-left: 280px; cursor: pointer;" onclick="fnEnrollMemo();"></i>
                    </div>
                    <div style="display: flex; gap: 10px; width: 430px; height: 350px;">
                      <div style="align-content: center;">
                        <a class="page-link waves-effect" href="#" style="background-color: #F4F3FE;"><i class="ti ti-chevron-left ti-sm"></i></a>
                      </div>
                      <div style="width: 330px;">
                        <ul class="list-unstyled mb-2 mt-3 pt-1">
                          <li class="d-flex align-items-center pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                            <span class="fw-medium mx-2" style="width: 280px; cursor: pointer;">오늘의 할일</span>
                            <div class="dropdown">
                              <i class="ti ti-dots-vertical ti-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                              </i>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="fnEnrollMemo();"><i class="ti ti-zoom-in"></i> 메모 열기</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ti ti-trash"></i> 메모 삭제</a></li>
                              </ul>
                            </div>
                          </li>
                          <li class="d-flex align-items-center pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                            <span class="fw-medium mx-2" style="width: 280px; cursor: pointer;">오늘의 할일</span>
                            <div class="dropdown">
                              <i class="ti ti-dots-vertical ti-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                              </i>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="fnEnrollMemo();"><i class="ti ti-zoom-in"></i> 메모 열기</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ti ti-trash"></i> 메모 삭제</a></li>
                              </ul>
                            </div>
                          </li>
                          <li class="d-flex align-items-end pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                            <span class="fw-medium mx-2" style="width: 280px; cursor: pointer;">메모메모</span>
                            <div class="dropdown">
                              <i class="ti ti-dots-vertical ti-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                              </i>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="fnEnrollMemo();"><i class="ti ti-zoom-in"></i> 메모 열기</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ti ti-trash"></i> 메모 삭제</a></li>
                              </ul>
                            </div>
                          </li>
                          <li class="d-flex align-items-end pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                            <span class="fw-medium mx-2" style="width: 280px; cursor: pointer;">화이팅</span>
                            <div class="dropdown"> <!-- 메모 목록 끝 버튼 클릭시 드롭다운 -->
                              <i class="ti ti-dots-vertical ti-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                              </i>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" onclick="fnEnrollMemo();"><i class="ti ti-zoom-in"></i> 메모 열기</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ti ti-trash"></i> 메모 삭제</a></li>
                              </ul>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div style="align-content: center;">
                        <a class="page-link waves-effect" href="#" style="background-color: #F4F3FE;"><i class="ti ti-chevron-right ti-sm"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /Memo -->

                <!-- Earning Reports -->
                <div class="col-lg-6">
                  <div class="card h-100">
                    <div class="card-header pb-0 d-flex justify-content-between">
                      <div class="card-title mb-0">
                        <h5 class="mb-1">Earning Reports</h5>
                        <p class="card-subtitle">Weekly Earnings Overview</p>
                      </div>
                      <div class="dropdown">
                        <button
                          class="btn btn-text-secondary rounded-pill text-muted border-0 p-2 me-n1"
                          type="button"
                          id="earningReportsId"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false">
                          <i class="ti ti-dots-vertical ti-md text-muted"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="earningReportsId">
                          <a class="dropdown-item" href="javascript:void(0);">View More</a>
                          <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row align-items-center g-md-8">
                        <div class="col-12 col-md-5 d-flex flex-column">
                          <div class="d-flex gap-2 align-items-center mb-3 flex-wrap">
                            <h2 class="mb-0">$468</h2>
                            <div class="badge rounded bg-label-success">+4.2%</div>
                          </div>
                          <small class="text-body">You informed of this week compared to last week</small>
                        </div>
                        <div class="col-12 col-md-7 ps-xl-8">
                          <div id="weeklyEarningReports"></div>
                        </div>
                      </div>
                      <div class="border rounded p-5 mt-5">
                        <div class="row gap-4 gap-sm-0">
                          <div class="col-12 col-sm-4">
                            <div class="d-flex gap-2 align-items-center">
                              <div class="badge rounded bg-label-primary p-1">
                                <i class="ti ti-currency-dollar ti-sm"></i>
                              </div>
                              <h6 class="mb-0 fw-normal">Earnings</h6>
                            </div>
                            <h4 class="my-2">$545.69</h4>
                            <div class="progress w-75" style="height: 4px">
                              <div
                                class="progress-bar"
                                role="progressbar"
                                style="width: 65%"
                                aria-valuenow="65"
                                aria-valuemin="0"
                                aria-valuemax="100"></div>
                            </div>
                          </div>
                          <div class="col-12 col-sm-4">
                            <div class="d-flex gap-2 align-items-center">
                              <div class="badge rounded bg-label-info p-1"><i class="ti ti-chart-pie-2 ti-sm"></i></div>
                              <h6 class="mb-0 fw-normal">Profit</h6>
                            </div>
                            <h4 class="my-2">$256.34</h4>
                            <div class="progress w-75" style="height: 4px">
                              <div
                                class="progress-bar bg-info"
                                role="progressbar"
                                style="width: 50%"
                                aria-valuenow="50"
                                aria-valuemin="0"
                                aria-valuemax="100"></div>
                            </div>
                          </div>
                          <div class="col-12 col-sm-4">
                            <div class="d-flex gap-2 align-items-center">
                              <div class="badge rounded bg-label-danger p-1">
                                <i class="ti ti-brand-paypal ti-sm"></i>
                              </div>
                              <h6 class="mb-0 fw-normal">Expense</h6>
                            </div>
                            <h4 class="my-2">$74.19</h4>
                            <div class="progress w-75" style="height: 4px">
                              <div
                                class="progress-bar bg-danger"
                                role="progressbar"
                                style="width: 65%"
                                aria-valuenow="65"
                                aria-valuemin="0"
                                aria-valuemax="100"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Earning Reports -->

                <!-- Support Tracker -->
                <div class="col-md-6">
                  <div class="card h-100">
                    <div class="card-header d-flex justify-content-between">
                      <div class="card-title mb-0">
                        <h5 class="mb-1">Support Tracker</h5>
                        <p class="card-subtitle">Last 7 Days</p>
                      </div>
                      <div class="dropdown">
                        <button
                          class="btn btn-text-secondary rounded-pill text-muted border-0 p-2 me-n1"
                          type="button"
                          id="supportTrackerMenu"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false">
                          <i class="ti ti-dots-vertical ti-md text-muted"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="supportTrackerMenu">
                          <a class="dropdown-item" href="javascript:void(0);">View More</a>
                          <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body row">
                      <div class="col-12 col-sm-4 col-md-12 col-lg-4">
                        <div class="mt-lg-4 mt-lg-2 mb-lg-6 mb-2">
                          <h2 class="mb-0">164</h2>
                          <p class="mb-0">Total Tickets</p>
                        </div>
                        <ul class="p-0 m-0">
                          <li class="d-flex gap-4 align-items-center mb-lg-3 pb-1">
                            <div class="badge rounded bg-label-primary p-1_5"><i class="ti ti-ticket ti-md"></i></div>
                            <div>
                              <h6 class="mb-0 text-nowrap">New Tickets</h6>
                              <small class="text-muted">142</small>
                            </div>
                          </li>
                          <li class="d-flex gap-4 align-items-center mb-lg-3 pb-1">
                            <div class="badge rounded bg-label-info p-1_5">
                              <i class="ti ti-circle-check ti-md"></i>
                            </div>
                            <div>
                              <h6 class="mb-0 text-nowrap">Open Tickets</h6>
                              <small class="text-muted">28</small>
                            </div>
                          </li>
                          <li class="d-flex gap-4 align-items-center pb-1">
                            <div class="badge rounded bg-label-warning p-1_5"><i class="ti ti-clock ti-md"></i></div>
                            <div>
                              <h6 class="mb-0 text-nowrap">Response Time</h6>
                              <small class="text-muted">1 Day</small>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="col-12 col-sm-8 col-md-12 col-lg-8">
                        <div id="supportTracker"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Support Tracker -->

                <!-- Popular Instructors -->
                <div class="col-md-6 col-xxl-4 mb-6">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">전직원목록</h5>
                      </div>
                    </div>
                    <div class="px-5 py-4 border border-start-0 border-end-0">
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-0 text-uppercase">정렬기준</p>
                        <p class="mb-0 text-uppercase">개인 채팅</p>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-6">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar me-4">
                            <img src="../../assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                          </div>
                          <div>
                            <div>
                              <h6 class="mb-0 text-truncate">Maven Analytics</h6>
                              <small class="text-truncate text-body">Business Intelligence</small>
                            </div>
                          </div>
                        </div>
                        <div class="text-end">
                          <i class="ti ti-brand-telegram"></i>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between align-items-center mb-6">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar me-4">
                            <img src="../../assets/img/avatars/2.png" alt="Avatar" class="rounded-circle" />
                          </div>
                          <div>
                            <div>
                              <h6 class="mb-0 text-truncate">Bentlee Emblin</h6>
                              <small class="text-truncate text-body">Digital Marketing</small>
                            </div>
                          </div>
                        </div>
                        <div class="text-end">
                          <i class="ti ti-brand-telegram"></i>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between align-items-center mb-6">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar me-4">
                            <img src="../../assets/img/avatars/3.png" alt="Avatar" class="rounded-circle" />
                          </div>
                          <div>
                            <div>
                              <h6 class="mb-0 text-truncate">Benedetto Rossiter</h6>
                              <small class="text-truncate text-body">UI/UX Design</small>
                            </div>
                          </div>
                        </div>
                        <div class="text-end">
                          <i class="ti ti-brand-telegram"></i>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between align-items-center mb-6">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar me-4">
                            <img src="../../assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
                          </div>
                          <div>
                            <div>
                              <h6 class="mb-0 text-truncate">Beverlie Krabbe</h6>
                              <small class="text-truncate text-body">React Native</small>
                            </div>
                          </div>
                        </div>
                        <div class="text-end">
                          <i class="ti ti-brand-telegram"></i>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                          <div class="avatar avatar me-4">
                            <img src="../../assets/img/avatars/6.png" alt="Avatar" class="rounded-circle" />
                          </div>
                          <div>
                            <div>
                              <h6 class="mb-0 text-truncate">Alma Gonzalez</h6>
                              <small class="text-truncate text-body">Java Developer</small>
                            </div>
                          </div>
                        </div>
                        <div class="text-end">
                          <i class="ti ti-brand-telegram"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Popular Instructors -->

                <!-- Projects table -->
                <div class="card" style="width: 920px;">
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
                          <td>
                            관리자
                          </td>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            <span>3</span>
                          </td>
                        </tr>
  
                        <tr>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            관리자2
                          </td>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            <span>3</span>
                          </td>
                        </tr>
  
                        <tr>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            관리자3
                          </td>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            <span class="badge bg-label-primary me-1">3</span>
                          </td>
                        </tr>
  
                        <tr>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            관리자4
                          </td>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            <span class="badge bg-label-primary me-1">퇴사</span>
                          </td>
                        </tr>
  
                        <tr>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            관리자
                          </td>
                          <td>
                            <i class="ti ti-brand-angular ti-md text-danger me-4"></i>
                            <span class="fw-medium">인사팀</span>
                          </td>
                          <td>
                            <span class="badge bg-label-primary me-1">퇴사</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <!--/ Projects table -->
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