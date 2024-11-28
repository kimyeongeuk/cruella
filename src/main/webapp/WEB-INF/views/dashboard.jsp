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
	 #memoDiv::-webkit-scrollbar,
	 #memberListDiv::-webkit-scrollbar {
	  width: 10px;  /* 세로 스크롤바의 너비 */
	  height: 8px; /* 가로 스크롤바의 높이 */
	 }
	
	 #memoDiv::-webkit-scrollbar-track,
	 #memberListDiv::-webkit-scrollbar-track {
	  background-color: #f1f1f1; /* 트랙 배경색 */
	  border-radius: 10px; /* 트랙 모서리 둥글게 */
	 }
  	#memberListDiv{
   	 max-height: 600px;
   	 overflow-y: auto;
   	 margin-right: 10px; /* 오른쪽 외부 여백 */
   	}
	
		/* 스크롤바의 손잡이 (사용자가 드래그할 부분) */
		#memoDiv::-webkit-scrollbar-thumb,
		#memberListDiv::-webkit-scrollbar-thumb {
	    background-color: #7367f0; /* 손잡이 색 */
	    border-radius: 10px;     /* 손잡이 모서리 둥글게 */
	    border: 2px solid #f1f1f1; /* 손잡이의 테두리 색 (트랙과 구분됨) */
	}
		/* 스크롤바 손잡이 위에 마우스를 올렸을 때 */
		#memoDiv::-webkit-scrollbar-thumb:hover,
		#memberListDiv::-webkit-scrollbar-thumb:hover {
	    background-color: #564EB5; /* 손잡이 색을 다르게 */
		}
  	#side_dashboard::before{
		  content: ''; /* 가상 요소 필수 */
		  display: inline-block; /* 블록 요소 */
		  width: 10px; /* 동그라미 크기 */
		  height: 10px; /* 동그라미 크기 */
		  border-radius: 50%; /* 완전한 원 */
		  background-color: transparent; /* 배경을 투명으로 설정 */
		  border: 2px solid gray; /* 초기 테두리 색상 */
		}
		#side_dashboard.active::before{
		 	border: 2px solid white; /* 테두리만 흰색으로 변경 */
		}
		#memoList {
			margin-right: 10px;
		}
		#allMem {
			cursor: pointer;
			color: #444050;
		}
		#allMem:hover {
			color: #7367f0;
			transition: color 0.3s ease;
		}
		#notice {
			cursor: pointer;
			color: #444050;
			font-size: 18px;
		}
		#notice:hover {
			color: #7367f0;
			transition: color 0.3s ease;		
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
                    <h5 class="mb-0">${loginUser.vacCount}</h5>
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
        
        <!-- 메모목록 -->
        <div class="card mb-2" style="height: 380px; width: 430px; margin-left: 12px;">
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
                       <button type="button" class="btn btn-primary" id="btn_memo_cancel" data-bs-dismiss="modal">취소</button>
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
                       <button type="button" class="btn btn-primary" id="btn_memo_cancel" data-bs-dismiss="modal">취소</button>
                   </div>
               </div>
           </div>
         </div>


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
        <div class="col-md-6 col-xxl-4 mb-1">
          <div class="card h-100">
            <div class="card-header align-items-center" style="display: flex; gap: 15px;">
              <i class="ti ti-users ti-lg"></i>
              <a id="allMem" style="font-size: 18px;" href="${contextPath}/member/employeelistview.do">전직원 목록</a>
            </div>
            <div class="card-body" id="memberListDiv"> <!-- 전 사원의 리스트가 보여질영역 -->
            </div>
          </div>
        </div>
        <!--/ Popular Instructors -->

				<!-- 공지사항 영역 (재운님 코드)-->
				<div class="card" style="width: 920px;">
  				<div class="d-flex align-items-center">
   					<div style="margin: 20px;">
         			<a id="notice" href="${contextPath}/notice/noticeList.do">공지사항</a>
     				</div>
  	 			</div>
	 				<div class="card-datatable table-responsive pt-3">
						<table class="datatables-basic table text-center">
							<thead>
  							<tr>
        					<th style="width: 10%;">번호</th>
									<th style="width: 15%;">작성자</th>
									<th style="width: 40%;">제목</th>
									<th style="width: 15%;">작성일</th>
									<th style="width: 10%;">조회수</th>
  							</tr>
							</thead>
  						<tbody id="noticeListTbody">
    
							</tbody>
						</table>
					</div>
					<div class="card-body">
					  <div class="row">
					    <span class="col-lg-12 d-flex justify-content-center">
					      <div class="demo-inline-spacing">
					        <nav aria-label="Page navigation">
					          <ul class="pagination" id="paging_area">
					          </ul>
					        </nav>
					      </div>
					    </span>
					  </div>
	        </div>
	     		</div>
	       
	       <!--/ 팀게시판 영역 -->         
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
	  		
				// 페이지 로드시 실행시킬 함수
	  		window.onload = function(){
	  			
	  			checkClockInStatus(); // 출근상태 체크
	  			fnNoticeList();			  // 공지사항 조회
		    	fnMemoList();	        // 메모 전체 리스트 조회
		    	fnMemberList();       // 전체 사원 리스트 조회
		    	
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
   <script>
	  // 사이드바 처리
		document.addEventListener("DOMContentLoaded", function () {
	 	
			const element = document.getElementById("dashboard");
			
		 	element.style.backgroundColor = "#958CF4";
		 	element.style.color = "white";
		 	element.classList.add("active");
	 	
		});

	    
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
	    	
	    	// 작성된 내용이 없을경우 등록하지않고 모달창 종료
	    	if (!memoContent) {
	    		 
	 	       $('#selectMemoModal').modal('hide');
	 	        
	 	       return;
	 	       
	    	   }
	    	
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
	    
	    // 전체 사원 리스트 조회
	    function fnMemberList(){
	    	
	    	let memNo = '${loginUser.getMemNo()}';
	    	
	    	$.ajax({
	    		url: '${contextPath}/member/selectAll_db.do',
	    		type: 'POST',
	    		data: {memNo: memNo},
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
	    						  +'</li>'
	    			}
	    			
	    			liEl += '</ul>';
	    			
	    			$('#memberListDiv').html(liEl);
	    			
	    		}
	    		
	    	})
	    }
	    
	    // 공지사항 목록조회
	    function fnNoticeList(page){
	    	$.ajax({
	    		url: '${contextPath}/member/noticeList.do',
	    		type: 'POST',
	    		data: {page: page},
	    		success: function(res) {
	    			console.log(res);
		              let pi = res.pi; // 페이지 정보
			            let trEl = '';
			
			            // 데이터가 비어 있는 경우
			            if (!res || res.list.length == 0) {
			                trEl += '<tr>';
			                trEl += '<td colspan="6">조회된 게시글이 없습니다.</td>';
			                trEl += '</tr>';
			            } else {
			                let count = 1;
			                res.list.forEach((notice) => {
			                    let reverseCount = pi.listCount - (pi.currentPage - 1) * pi.boardLimit - (count - 1);
			
			                    
			                    trEl += '<tr data-boardno="' + notice.noticeNo + '">';
			                    trEl += '<td>' + reverseCount + '</td>';
			                    trEl += '<td>' + notice.memName + '</td>';
			                    trEl += '<td class="title" style="cursor: pointer;">' + notice.noticeTitle;
			                    trEl += '</td>';
			                    trEl += '<td>' + notice.noticeRegistDT + '</td>';
			                    trEl += '<td>' + notice.noticeCount + '</td>';
			                    trEl += '</tr>';
			
			                    count++;
			                });
			            }
			
			            $('#noticeListTbody').html(trEl);
			            
			            // 페이징바 생성 및 업데이트
			            let pagingEl = '';
			            pagingEl += '<li class="page-item first"><a class="page-link" href="javascript:void(0);" onclick="fnNoticeList(1);"><i class="ti ti-chevrons-left ti-sm"></i></a></li>';
			            pagingEl += '<li class="page-item prev ' + (pi.currentPage == 1 ? 'disabled' : '') + '"><a class="page-link" href="javascript:void(0);" onclick="fnNoticeList(' + (pi.currentPage - 1) + ');"><i class="ti ti-chevron-left ti-sm"></i></a></li>';

			            for (let i = pi.startPage; i <= pi.endPage; i++) {
			                pagingEl += '<li class="page-item ' + (i == pi.currentPage ? 'active' : '') + '"><a class="page-link" href="javascript:void(0);" onclick="fnNoticeList(' + i + ');">' + i + '</a></li>';
			            }

			            pagingEl += '<li class="page-item next ' + (pi.currentPage == pi.maxPage ? 'disabled' : '') + '"><a class="page-link" href="javascript:void(0);" onclick="fnNoticeList(' + (pi.currentPage + 1) + ');"><i class="ti ti-chevron-right ti-sm"></i></a></li>';
			            pagingEl += '<li class="page-item last"><a class="page-link" href="javascript:void(0);" onclick="fnNoticeList(' + pi.maxPage + ');"><i class="ti ti-chevrons-right ti-sm"></i></a></li>';

			            $('#paging_area').html(pagingEl);			
	    		}
	    	})
	    }
	    function goToPage(pageNumber) {
	        window.location.href = "${contextPath}/member/noticeList.do?page=" + pageNumber;
	      }
	    
   </script>
	
	
	
</body>
</html>