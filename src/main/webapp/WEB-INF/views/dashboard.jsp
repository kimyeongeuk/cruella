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
  #btn_memo_enroll{
      margin-right: 50px;
      background-color: #7367F0;
      color: white;
      width: 85px;
      height: 40px;
  }
  #btn_memo_cancel{
      margin-left: 50px;
      background-color: #EAEBED;
      width: 85px;
      height: 40px;
      border: 0;
      color: #8D8F9B;
  }
  #memoMenuModal .modal-dialog {
    position: absolute;
    top: 20%;  /* 원하는 위치로 조정 */
    left: 30%; /* 원하는 위치로 조정 */
    transform: translate(-50%, -50%);
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
		<!-- nav 끝 -->
		
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
                      <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item text-danger" href="javascript:void(0);">Delete</a></li>
                  </ul>
                </div>
                <div class="mx-auto my-6">
                  <img src="${ contextPath }/assets/img/avatars/3.png" alt="Avatar Image" class="rounded-circle w-px-100" />
                </div>
                <h5 class="mb-0 card-title">${ loginUser.getMemName() }</h5>
                <div class="d-flex align-items-center justify-content-center my-6 gap-2">
                  <a href="javascript:;" class="me-2"><span class="badge bg-label-secondary">${ loginUser.getDeptName() }</span></a>
                  <a href="javascript:;"><span class="badge bg-label-warning">${ loginUser.getPosName() }</span></a>
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
	                <c:choose>
	                	<c:when test="${loginUser.wlStatus == null}">
		                  <a class="btn btn-success d-flex align-items-center me-4" onclick="fnClockIn();">
		                  	<i class="ti-xs me-1 ti ti-clock me-2"></i>출근
		                  </a>
		                </c:when>
		                <c:when test="${loginUser.wlStatus == 'C'}">
								      <a class="btn btn-danger d-flex align-items-center me-4" onclick="fnClockOut();">
								        <i class="ti-xs me-1 ti ti-clock me-2"></i>퇴근
								      </a>
								    </c:when>
								    <c:otherwise>
								    	<div class="d-flex align-items-center me-4">
								        <i class="ti-xs me-1 ti ti-clock me-2"></i>근무완료 !
								      </div>
								    </c:otherwise>
	                </c:choose>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--/ Website Analytics -->

        <!-- 팀별 매출 점유율 -->
        <div class="card" style="width: 480px;">
          <div class="chart-wrapper"> 
            <h5 class="card-title mt-5" style="margin-left: 20px;">Chart</h5>
            <p class="card-subtitle mt-2" style="margin-left: 20px;">팀별 매출 점유율</p>
            <div class="justify-content-between" style="display: flex;">
              <div id="chartCenterText"></div>
            </div>
            <div class="chart-container"> 
              <div id="chartWrapper"> 
                <canvas id="doughnutChart"></canvas> 
                <div class="chartjs-center-text">
                </div> 
              </div> 
            </div>
          </div>
        </div>
        <!-- /팀별 매출 점유율 차트 -->
        <!-- Memo -->
        <div class="card" style="width: 450px; margin-left: 10px;">
          <div class="card-body" style="padding: 0%; padding-top: 25px;">
            <div>
              <small class="card-text text-uppercase text-muted small" style="margin-left: 30px;">Memo</small> 
              <i class="ti ti-edit ti-sm" style="margin-left: 280px; cursor: pointer;" onclick="fnEnrollMemo();"></i>
            </div>
              <div style="width: 380px; justify-self: center;">
                <ul class="list-unstyled mb-2 mt-3 pt-1">
                  <li class="d-flex align-items-center pt-5 pb-5 mt-3" style="background-color: #e9e7fd; border-radius: 5px;">
                    <span class="fw-medium mx-2" style="width: 320px; cursor: pointer;">오늘의 할일</span>
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
                    <span class="fw-medium mx-2" style="width: 320px; cursor: pointer;">오늘의 할일</span>
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
                    <span class="fw-medium mx-2" style="width: 320px; cursor: pointer;">메모메모</span>
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
                    <span class="fw-medium mx-2" style="width: 320px; cursor: pointer;">화이팅</span>
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
          </div>
        </div>
        <!-- /Memo -->

        <!-- 총매출 차트부분 -->
        <div class="col-12" style="width: 950px;">
          <div class="card">
            <div class="card-header d-flex justify-content-between">
              <div>
                <h5 class="card-title mb-0">Chart</h5>
                <p class="card-subtitle mt-2" style="margin-left: 10px;">2024년도 백화점 총 매출</p>
              </div>
              <div class="d-sm-flex d-none align-items-center">
                <h5 class="mb-0 me-4">$ 100,000</h5>
                <span class="badge bg-label-secondary">
                  <i class="ti ti-arrow-big-down ti-xs text-danger"></i>
                  <span class="align-middle">20%</span>
                </span>
              </div>
            </div>
            <div class="card-body">
              <div id="lineChart"></div>
            </div>
          </div>
        </div>
        <!--/ 총매출 차트부분 -->

        <!-- 매장별 차트부분 -->  <!-- 대시보드는 어제(최신)의 데이터만 보여지고 날짜 선택은 불가 -->
        <div class="card" style="width: 440px; justify-content: center;">
          <div style="display: block;">
            <div class="input-wrapper mb-5" style="display: flex;">
              <div>
                <select id="categorySelect" class="select1 form-select form-select-lg" data-allow-clear="true">
                  <option value="남성의류">남성의류</option>
                  <option value="여성의류">여성의류</option>
                  <option value="식품">식품</option>
                  <option value="스포츠">스포츠</option>
                  <option value="뷰티">뷰티</option>
                  <option value="명품">명품</option>
                  <option value="문화센터">문화센터</option>
                  <option value="디지털 및 가전">디지털 및 가전</option>
                </select>
              </div>
              <div style="display: flex; flex-direction: column; gap: 5px; margin-left: 120px; margin-top: 5px;">
                <div id="div1" style="width: 40px; height: 15px; border: 3px solid;"></div>
                <div id="div2" style="width: 40px; height: 15px; border: 3px solid;"></div>
              </div>
              <p class="card-subtitle mt-2" style="margin-left: 10px; font-size: 18px;">매출</p>
            </div>
            <div class="chart-container">
              <canvas id="barChart" style="height: 400px;"></canvas>
            </div>
          </div>
        </div>
        <!--/ 매장별 차트부분 -->

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
                    <img src="${ contextPath }/assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
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
                    <img src="${ contextPath }/assets/img/avatars/3.png" alt="Avatar" class="rounded-circle" />
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
                    <img src="${ contextPath }/assets/img/avatars/4.png" alt="Avatar" class="rounded-circle" />
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
                    <img src="${ contextPath }/assets/img/avatars/6.png" alt="Avatar" class="rounded-circle" />
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
                    <a href="#">${ loginUser.getDeptCode() }</a>
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
	
	    <script>
      // 메모작성 아이콘 클릭 시 열리는 새 메모 작성 모달
      function fnEnrollMemo(){
        var memoModal = new bootstrap.Modal(document.getElementById("enrollMemoModal"));

        memoModal.show();
      }

      function fnSelectMemo(){
        var memoModal = new bootstrap.Modal(document.getElementById("selectMemoModal"));

        memoModal.show();
      }

      function fnOpenMemoMenu(){
        const modal = document.getElementById('memoMenuModal');
        const modalDialog = modal.querySelector('.modal-dialog');

        // 클릭한 아이콘 위치를 기준으로 모달 위치 설정
        const icon = event.currentTarget;
        const rect = icon.getBoundingClientRect();
        modalDialog.style.top = `${rect.top + window.scrollY}px`;
        modalDialog.style.left = `${rect.right + 10 + window.scrollX}px`; // 오른쪽으로 10px 이동

        // 모달 표시
        const bootstrapModal = new bootstrap.Modal(modal);
        bootstrapModal.show();
      }

	  		
	  		
	  	
    </script>
    
		<script>
	  		
	  		window.onload = function(){
	  			
	  			checkClockInStatus();
	      
	  		}
	  	
	  		// 출근 등록여부 확인
	  		function checkClockInStatus(){
	  			
	  			$.ajax({
	  				url: '${contextPath}/wl/checkStatus.do',
	  				type: 'POST',
	  				data: {
	  					memNo: '${loginUser.getMemNo()}',
	  				},
	  				success: function(res){
	  					
	  					if(res == 'YYY'){
	  						
	  					}
	  					
	  				}
	  			})
	  			
	  		}
	  		
		  	// 출근 버튼 클릭시 (김동규)
		  	function fnClockIn(){
		  			
		  		
		  		const today = new Date();
		  		const clockInTime = today.toLocaleTimeString('en-GB', { hour12: false });
		  		
		  		
		  		$.ajax({
		  			url: '${contextPath}/wl/clockIn.do',
		  			type: 'POST',
		  			data: {
		  				memNo: '${loginUser.getMemNo()}',
		  				clockInTime: clockInTime
		  					},
		  			success: function(res){
		  				alert(res + ' 출근 등록이 완료되었습니다.');
		  				
		  				window.location.reload();
		  			}
		  			
		  			})
		  		}
		  	
		  	// 퇴근 버튼 클릭시 (김동규)
		  	function fnClockOut(){
		  			
		  		
		  		const today = new Date();
		  		const clockOutTime = today.toLocaleTimeString('en-GB', { hour12: false });
		  		
		  		
		  		$.ajax({
		  			url: '${contextPath}/wl/clockOut.do',
		  			type: 'POST',
		  			data: {
		  				memNo: '${loginUser.getMemNo()}',
		  				clockOutTime: clockOutTime
		  					},
		  			success: function(res){
		  				alert(res + '퇴근 등록이 완료되었습니다.');
		  				
		  				window.location.reload();
		  			}
		  			
		  			})
		  		}
		</script>
    	

  



              <!-- 매장별 매출 점유율 -->
              <script>
                document.addEventListener('DOMContentLoaded', () => {
                  const ctx = document.getElementById('doughnutChart').getContext('2d');
                  const chartCenterText = document.getElementById('chartCenterText');
            
                  const data = {
                    labels: ['남성의류', '여성의류', '식품', '스포츠', '뷰티', '명품', '문화센터', '디지털 및 가전'],
                    datasets: [{
                      data: [5000000, 10000000, 10000000, 8000000, 9000000, 20000000, 9000000, 6000000],
                      backgroundColor: ['rgb(102, 110, 232)', 'rgb(40, 208, 148)', 'rgb(253, 172, 52)', 'rgb(253, 233, 52)', 'rgb(223, 253, 52)', 'rgb(52, 223, 253)', 'rgb(196, 52, 253)', 'rgb(253, 52, 193)']
                    }]
                  };
            
                  const config = {
                    type: 'doughnut',
                    data: data,
                    options: {
                      responsive: true,
                      maintainAspectRatio: false,
                      plugins: {
                        legend: { display: false },
                        tooltip: {
                          callbacks: {
                            label: (context) => {
                              let label = context.label || '';
                              if (label) label += ': ';
                              if (context.parsed !== null) {
                                const total = context.chart.getDatasetMeta(context.datasetIndex).total;
                                const percentage = (context.parsed / total * 100).toFixed(2);
                                label += `${percentage}% (${context.parsed.toLocaleString()} 원)`;
                              }
                              return label;
                            }
                          }
                        },
                        datalabels: {
                          formatter: (value, context) => {
                            const dataset = context.chart.data.datasets[0];
                            const meta = context.chart.getDatasetMeta(0);
                            const total = dataset.data.reduce((a, b, i) => a + (!meta.data[i].hidden ? b : 0), 0);
                            const percentage = (value / total * 100).toFixed(2) + '%';
                            return meta.data[context.dataIndex].hidden ? '' : percentage;
                          },
                          color: '#fff',
                          labels: { title: { font: { weight: 'bold' } } }
                        }
                      }
                    },
                    plugins: [ChartDataLabels]
                  };
            
                  const chart = new Chart(ctx, config);
                  updateCenterText();
            
                  const legendContainer = document.getElementById('legendContainer');
                  data.labels.forEach((label, index) => {
                    const legendItem = document.createElement('div');
                    legendItem.className = 'legend-item';
                    const legendColor = document.createElement('div');
                    legendColor.className = 'legend-color';
                    legendColor.style.backgroundColor = data.datasets[0].backgroundColor[index];
                    const legendText = document.createElement('span');
                    legendText.innerText = label;
                    legendItem.appendChild(legendColor);
                    legendItem.appendChild(legendText);
            
                    legendItem.addEventListener('click', () => {
                      legendItem.classList.toggle('active');
                      const meta = chart.getDatasetMeta(0);
                      meta.data[index].hidden = !meta.data[index].hidden;
                      chart.options.plugins.datalabels.formatter = (value, context) => {
                        const dataset = context.chart.data.datasets[0];
                        const total = dataset.data.reduce((a, b, i) => a + (!meta.data[i].hidden ? b : 0), 0);
                        const percentage = (value / total * 100).toFixed(2) + '%';
                        return meta.data[context.dataIndex].hidden ? '' : percentage;
                      };
                      chart.update();
                      updateCenterText();
                    });
            
                    legendContainer.appendChild(legendItem);
                  });
                });
    
    
              </script>
              <script>
                const div1 = document.getElementById("div1");
                div1.style.backgroundColor = 'rgba(75, 192, 192, 0.2)';
                div1.style.borderColor = 'rgba(75, 192, 192, 1)';

                const div2 = document.getElementById("div2");
                div2.style.backgroundColor = 'rgba(255, 159, 64, 0.2)';
                div2.style.borderColor = 'rgba(255, 159, 64, 1)';
              </script>
              <!-- 매장매출 차트 -->
              <script>
                document.addEventListener('DOMContentLoaded', () => {
                  const ctx = document.getElementById('barChart').getContext('2d');
                  const categorySelect = document.getElementById('categorySelect');
                  const startDate = document.getElementById('startDate');
                  const endDate = document.getElementById('endDate');
            
                  const dataSets = {
                    '남성의류': { '레노마셔츠': 5000000, '라코스테': 7000000 },
                    '여성의류': { '샤넬': 10000000, '구찌': 12000000 },
                    '식품': { '롯데마트': 10000000, '홈플러스': 9500000 },
                    '스포츠': { '나이키': 8000000, '아디다스': 8500000 },
                    '뷰티': { '아모레퍼시픽': 9000000, 'LG생활건강': 11000000 },
                    '명품': { '루이비통': 20000000, '에르메스': 25000000 },
                    '문화센터': { 'CGV': 9000000, '롯데시네마': 8000000 },
                    '디지털 및 가전': { '삼성전자': 6000000, 'LG전자': 7500000 }
                  };
            
                  let chart;
            
                  const createChart = (category) => {
                    const data = {
                      labels: Object.keys(dataSets[category]),
                      datasets: [{
                        label: '매출',
                        data: Object.values(dataSets[category]),
                        backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 159, 64, 0.2)'],
                        borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)'],
                        borderWidth: 1,
                        barThickness: 40 // 막대의 두께를 설정합니다
                      },
                      {
                        label: '', // 가짜 데이터셋
                        data: [], // 데이터는 비워둡니다.
                        backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 159, 64, 0.2)'], // 새로운 색상
                        borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)'],
                        borderWidth: 1,
                        barThickness: 40
                      }]
                    };
            
                    const config = {
                      type: 'bar',
                      data: data,
                      options: {
                        responsive: true, // 반응형 설정
                        maintainAspectRatio: false,
                        scales: {
                          y: {
                            beginAtZero: true,
                            ticks: {
                              callback: function(value) {
                                return value.toLocaleString() + ' 원';
                              }
                            }
                          }
                        },
                        plugins: {
                          legend: { 
                            display: false,
                          },
                          
                          tooltip: {
                            callbacks: {
                              label: function(context) {
                                return context.dataset.label + ': ' + context.parsed.y.toLocaleString() + ' 원';
                              }
                            }
                          }
                        }
                      }
                    };
            
                    if (chart) {
                      chart.destroy();
                    }
                    chart = new Chart(ctx, config);
                  };
            
                  categorySelect.addEventListener('change', (event) => {
                    createChart(event.target.value);
                  });
            
                  createChart('남성의류');  // 초기화 시 첫 번째 카테고리로 차트를 만듭니다.
                });
              </script>
	
	
	
</body>
</html>