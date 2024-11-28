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
canvas#myChart {
  display: block;
  width: 100%; /* 부모 컨테이너의 너비에 맞추기 */
  max-height: 400px; /* 차트의 최대 높이 */
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
<!-- 이쪽에 세션정보 넣어야합니다 ----------------------------------------------------------------------- -->
    	
<!-- Content wrapper -->
<div class="content-wrapper">
  <!-- Content -->
  <div class="container-xxl flex-grow-1 container-p-y">
    <div class="container card py-5">
    <!-- 여기부터 -->
 
<div>
  <select id="yearSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 120px;">
    <option value="2023">2023</option>
    <option value="2024" selected>2024</option>
  </select>
  <select id="monthSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 100px; margin-left: 10px;">
    <option value="01">1월</option>
    <option value="02">2월</option>
    <option value="03">3월</option>
    <option value="04">4월</option>
    <option value="05">5월</option>
    <option value="06">6월</option>
    <option value="07">7월</option>
    <option value="08">8월</option>
    <option value="09">9월</option>
    <option value="10">10월</option>
    <option value="11">11월</option>
    <option value="12">12월</option>
  </select>
</div>
<div>
  <canvas id="myChart" style="width: 100%; height: 400px;"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(function() {
	  const ctx = document.getElementById('myChart').getContext('2d');
	  const myChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	      labels: [],
	      datasets: [{
	        label: '매출',
	        data: [],
	        backgroundColor: [
	          'rgb(102, 110, 232)', 'rgb(40, 208, 148)', 'rgb(253, 172, 52)', 'rgb(253, 233, 52)',
	          'rgb(223, 253, 52)', 'rgb(52, 223, 253)', 'rgb(196, 52, 253)', 'rgb(253, 52, 193)'
	        ],
	        borderWidth: 1
	      }]
	    },
	    options: {
	      responsive: true,
	      maintainAspectRatio: false,
	      plugins: {
	        legend: {
	          display: true
	        },
	        tooltip: {
	       	  callbacks: {
	       	    label: (context) => {
	       	      let label = context.label || '';
	       	      if (label) label += ': ';
	       	      
	       	      // 디버깅: context.raw 값 출력
	       	      console.log("툴팁 context.raw 값:", context.raw);
	
	       	      // 전체 매출 계산하기 전에 총 매출을 계산
	       	      const totalSales = context.chart.data.datasets[0].data.reduce((a, b) => a + (b || 0), 0);
	       	      console.log("전체 매출(totalSales):", totalSales);
	
	       	      if (context.raw !== null && context.raw !== undefined) {
	       	        // 퍼센트 계산
	       	        const percentage = totalSales > 0 ? ((context.raw / totalSales) * 100).toFixed(2) : 0;
	       	        
	       	        // 매출과 퍼센트 표시
	       	        label += percentage+"% ("+ context.raw.toLocaleString()+"원)";
	       	      }
	       	      
	       	      return label;
	       	    }
	       	  }
	       	}
	      }
	    }
	  });

	  function updateChart(year, month) {
	    console.log("AJAX 요청 시작:", { year: year, month: month });

	    $.ajax({
	      url: `${contextPath}/chart/teamSales.do`,
	      type: "POST",
	      data: JSON.stringify({ year: year, month: month }),
	      contentType: "application/json; charset=utf-8",
	      dataType: "json",
	      success: function(data) {
	        console.log("AJAX 요청 성공, 반환 데이터:", data);

	        // 데이터 배열 초기화
	        var departments = [];
	        var sales = [];

	        // deptCode를 매핑하여 레이블 추가
	        const deptCodeToLabel = {
	          T1: '남성의류',
	          T2: '여성의류',
	          T3: '식품',
	          T4: '스포츠',
	          T5: '뷰티',
	          T6: '명품',
	          T7: '문화센터',
	          T8: '디지털 및 가전'
	        };

	        let totalSales = 0; // 총 매출 변수

	        // 데이터 처리
	        $.each(data, function(index, item) {
	          const deptLabel = deptCodeToLabel[item["deptCode"]] || item["deptCode"];
	          departments.push(deptLabel);
	          sales.push(item["sale"]);
	          totalSales += item["sale"]; // 총 매출 계산
	        });

	        console.log("차트 업데이트 데이터:", { departments: departments, sales: sales });

	        // 차트 데이터 업데이트
	        myChart.data.labels = departments;
	        myChart.data.datasets[0].data = sales;

	        // 차트 갱신
	        myChart.update();
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        console.error("AJAX 요청 실패:", {
	          status: textStatus,
	          error: errorThrown,
	          response: jqXHR.responseText,
	        });
	        alert("데이터를 가져오는 데 실패했습니다.");
	      },
	    });
	  }

	  $('#yearSelect, #monthSelect').change(function() {
	    const year = $('#yearSelect').val();
	    const month = $('#monthSelect').val();
	    updateChart(year, month);
	  });

	  // 초기 데이터 로드
	  const initialYear = $('#yearSelect').val();
	  const initialMonth = $('#monthSelect').val();
	  updateChart(initialYear, initialMonth);
	});

</script>




     
		<!-- 여기까지 -->
	  </div>
	</div> 
<!-- 세션정보 끝 ---------------------------------------------------------------------------------------- -->
</div>
<!-- 세션 끝 -->
</div>


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