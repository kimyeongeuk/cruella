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
   <link rel="stylesheet" href="${contextPath}/assets/vendor/libs/fullcalendar/fullcalendar.css" />
   <link rel="stylesheet" href="${contextPath}/assets/vendor/css/pages/app-calendar.css" />
   <style>
		#side_myworklog::before {
		  content: ''; /* 가상 요소 필수 */
		  display: inline-block; /* 블록 요소 */
		  width: 10px; /* 동그라미 크기 */
		  height: 10px; /* 동그라미 크기 */
		  border-radius: 50%; /* 완전한 원 */
		  background-color: transparent; /* 배경을 투명으로 설정 */
		  border: 2px solid gray; /* 초기 테두리 색상 */
		}
		#side_myworklog.active::before {
		  border: 2px solid white; /* 테두리만 흰색으로 변경 */
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
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Header -->
              <div class="row">

                <div class="col-12">
                  <div class="card mb-6">
                    <div class="user-profile-header-banner">
                      <img src="${contextPath}/assets/img/pages/profile-banner.png" alt="Banner image" class="rounded-top" />
                    </div>
                    <div class="user-profile-header d-flex flex-column flex-lg-row text-sm-start text-center mb-5">
                      <div class="flex-shrink-0 mt-n2 mx-sm-0 mx-auto">
                        <img
                          src="${contextPath}/assets/img/avatars/1.png"
                          alt="user image"
                          class="d-block h-auto ms-0 ms-sm-6 rounded user-profile-img" />
                      </div>
                      <div class="flex-grow-1 mt-3 mt-lg-5">
                        <div
                          class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-5 flex-md-row flex-column gap-4">
                          <div class="user-profile-info">
                            <h4 class="mb-2 mt-lg-6">${loginUser.memName}</h4>
                            <ul
                              class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-4 my-2">
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-book ti-lg"></i><span class="fw-medium">${loginUser.deptName}</span>
                              </li>
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-mail ti-lg"></i><span class="fw-medium">${loginUser.email}</span>
                              </li>
                              <li class="list-inline-item d-flex gap-2 align-items-center">
                                <i class="ti ti-calendar ti-lg"></i><span class="fw-medium">${loginUser.hireDate}</span>
                              </li>
                            </ul>
                          </div>
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
                        <a class="nav-link" href="${contextPath}/member/myinfo.do">
                          <i class="ti-sm ti ti-user-check me-1_5"></i> 내 정보
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" href="${contextPath}/member/myinfo_workLog.do">
                        <i class="ti-sm ti ti-users me-1_5"></i> 근태관리</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!--/ Navbar pills -->

              <!-- User Profile Content -->
              <div class="content-wrapper">
                <div class="flex-grow-1 container-p-y">
                  <div class="card app-calendar-wrapper">
                    <div class="row g-0">
    
                      <!-- Calendar & Modal -->
                      <div class="col app-calendar-content">
                        <div class="card shadow-none border-0">
                          <div class="card-body pb-0">
                            <!-- FullCalendar -->
                            <div id="calendar"></div>
                          </div>
                        </div>
                        <div class="app-overlay"></div>
                        <!-- FullCalendar Offcanvas -->
                        <div
                          class="offcanvas offcanvas-end event-sidebar"
                          tabindex="-1"
                          id="addEventSidebar"
                          aria-labelledby="addEventSidebarLabel">
                          <div class="offcanvas-header border-bottom">
                            <h5 class="offcanvas-title" id="addEventSidebarLabel">Add Event</h5>
                            <button
                              type="button"
                              class="btn-close text-reset"
                              data-bs-dismiss="offcanvas"
                              aria-label="Close"></button>
                          </div>
                          <div class="offcanvas-body">
                            <form class="event-form pt-0" id="eventForm" onsubmit="return false">
                              <div class="mb-5">
                                <label class="form-label" for="eventTitle">Title</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="eventTitle"
                                  name="eventTitle"
                                  placeholder="Event Title" />
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventLabel">Label</label>
                                <select class="select2 select-event-label form-select" id="eventLabel" name="eventLabel">
                                  <option data-label="primary" value="Business" selected>Business</option>
                                  <option data-label="danger" value="Personal">Personal</option>
                                  <option data-label="warning" value="Family">Family</option>
                                  <option data-label="success" value="Holiday">Holiday</option>
                                  <option data-label="info" value="ETC">ETC</option>
                                </select>
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventStartDate">Start Date</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="eventStartDate"
                                  name="eventStartDate"
                                  placeholder="Start Date" />
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventEndDate">End Date</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="eventEndDate"
                                  name="eventEndDate"
                                  placeholder="End Date" />
                              </div>
                              <div class="mb-5">
                                <div class="form-check form-switch">
                                  <input type="checkbox" class="form-check-input allDay-switch" id="allDaySwitch" />
                                  <label class="form-check-label" for="allDaySwitch">All Day</label>
                                </div>
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventURL">Event URL</label>
                                <input
                                  type="url"
                                  class="form-control"
                                  id="eventURL"
                                  name="eventURL"
                                  placeholder="https://www.google.com" />
                              </div>
                              <div class="mb-4 select2-primary">
                                <label class="form-label" for="eventGuests">Add Guests</label>
                                <select
                                  class="select2 select-event-guests form-select"
                                  id="eventGuests"
                                  name="eventGuests"
                                  multiple>
                                  <option data-avatar="1.png" value="Jane Foster">Jane Foster</option>
                                  <option data-avatar="3.png" value="Donna Frank">Donna Frank</option>
                                  <option data-avatar="5.png" value="Gabrielle Robertson">Gabrielle Robertson</option>
                                  <option data-avatar="7.png" value="Lori Spears">Lori Spears</option>
                                  <option data-avatar="9.png" value="Sandy Vega">Sandy Vega</option>
                                  <option data-avatar="11.png" value="Cheryl May">Cheryl May</option>
                                </select>
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventLocation">Location</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="eventLocation"
                                  name="eventLocation"
                                  placeholder="Enter Location" />
                              </div>
                              <div class="mb-5">
                                <label class="form-label" for="eventDescription">Description</label>
                                <textarea class="form-control" name="eventDescription" id="eventDescription"></textarea>
                              </div>
                              <div class="d-flex justify-content-sm-between justify-content-start mt-6 gap-2">
                                <div class="d-flex">
                                  <button type="submit" id="addEventBtn" class="btn btn-primary btn-add-event me-4">
                                    Add
                                  </button>
                                  <button
                                    type="reset"
                                    class="btn btn-label-secondary btn-cancel me-sm-0 me-1"
                                    data-bs-dismiss="offcanvas">
                                    Cancel
                                  </button>
                                </div>
                                <button class="btn btn-label-danger btn-delete-event d-none">Delete</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                      <!-- /Calendar & Modal -->
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-xl-4 col-lg-5 col-md-5">

                  <!-- About User -->
                  <div class="card mb-6">

                  </div>
                  <!--/ About User -->
                  <!-- Profile Overview -->
                  <div class="card mb-6">
                    <div class="card-body">
                      <small class="card-text text-uppercase text-muted small">Memo</small> 
                      <i class="ti ti-edit ti-sm" style="margin-left: 310px;"></i>
                      <ul class="list-unstyled mb-2 mt-3 pt-1">
                        <li class="d-flex align-items-center pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px; cursor: pointer;"
                        onclick="fnOpenMemo();">
                          <span class="fw-medium mx-2">오늘의 할일</span>
                          <i class="ti ti-dots-vertical ti-sm" style="margin-left: 250px;"></i>
                        </li>
                        <li class="d-flex align-items-end pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                          <span class="fw-medium mx-2">메모메모</span>
                          <i class="ti ti-dots-vertical ti-sm" style="margin-left: 270px;"></i>
                        </li>
                        <li class="d-flex align-items-end pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                          <span class="fw-medium mx-2">화이팅</span>
                          <i class="ti ti-dots-vertical ti-sm" style="margin-left: 285px;"></i>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!--/ Profile Overview -->
                </div>
                <div class="col-xl-8 col-lg-7 col-md-7">
                  <!-- Activity Timeline -->
                  <div class="card card-action mb-6">
                    
                  </div>
                  <!-- Projects table -->
                  <div class="card">
                    <div class="table-responsive text-nowrap">
                      <table class="table">
                        <thead>
                          <div style="display: flex; height: 80px;">
                            <div style="display: flex; margin-top: 30px;">
                              <p style="margin-right: 50px; margin-left: 50px;">휴가관리</p>
                              <p style="color: #28C76F;">${loginUser.vacCount}</p>
                              &nbsp;&nbsp;/&nbsp;&nbsp;
                              <span>15</span>
                            </div>
                            <div style="position: relative; top: 20px; left: 400px; display: flex; gap: 30px;">
                              <div style="position: relative; top: 10px;">
                                사용 <span>${15-loginUser.vacCount}</span>
                                &nbsp;&nbsp;&nbsp;
                                잔여 <span style="color: #28C76F;">${loginUser.vacCount}</span>
                              </div>
                              <a href="${contextPath}/app/app_main.do" class="btn btn-success mb-1" style="height: 45px;">
                                <i class="ti ti-plane-departure ti-xs me-2"></i>휴가 신청
                              </a>
                            </div>
                          </div>
                        </thead>
                        <thead>
                          <tr>
                            <th style="border: 1px solid #e6e6e8;">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>진행상태</th>
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
    
                            
                            <td>
                              <span class="badge badge-center bg-success">
                                <i class="ti ti-check"></i> <span style="color: #444050; margin-left: 12px;">승인</span>
                              </span>
                            </td>
                            
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

                </div>
              </div>
              <!--/ User Profile Content -->
            </div>
            <!-- / Content -->



            <div class="content-backdrop fade"></div>
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
   
    <script src="${contextPath}/assets/js/app-calendar-events.js"></script>
    <script src="${contextPath}/assets/js/app-calendar.js"></script>
    <script src="${contextPath}/assets/vendor/libs/fullcalendar/fullcalendar.js"></script>
    
   
   <script>
	   // 사이드바 처리
		document.addEventListener("DOMContentLoaded", function () {
	 	
			const element = document.getElementById("side_myworklog");
			
		 	document.getElementById("mypage").classList.add("open");
		 	element.style.backgroundColor = "#958CF4";
		 	element.style.color = "white";
		 	element.classList.add("active");
	 	
	});
	   
		 // 근태일정 조회
		 
		 const memNo = ${loginUser.memNo};
		 
	   $.ajax({
		   url: '${contextPath}/wl/loadWorkLog.do',
		   type: 'POST',
			 data: {memNo: memNo},
			 success: function(res){
				 
			 }
	   })
   </script>


</body>



</html>