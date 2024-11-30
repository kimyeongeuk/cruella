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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
<style>
canvas#doughnutChart {
  display: block;
  width: 100%; /* 부모 컨테이너의 너비에 맞추기 */
  max-height: 400px; /* 차트의 최대 높이 */
}

#salesChart::before {
  content: ''; /* 가상 요소 필수 */
  display: inline-block; /* 블록 요소 */
  width: 10px; /* 동그라미 크기 */
  height: 10px; /* 동그라미 크기 */
  border-radius: 50%; /* 완전한 원 */
  background-color: transparent; /* 배경을 투명으로 설정 */
  border: 2px solid gray; /* 초기 테두리 색상 */
}
#salesChart.active::before {
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
<!-- 세션 시작 -->
<div class="container-xxl flex-grow-1 container-p-y">
<!-- 이쪽에 세션정보 넣어야합니다 ----------------------------------------------------------------------- -->
    	
<div class="container card py-5">
<!-- 여기부터 -->
    
<div style="display: none; margin: 20px;" id="totalSalesChart">
<div style="display: flex; justify-content: space-between; align-items: center;">
  <div>
    <span>
      <span style="font-size: 20px;">매출차트</span>
    </span>
  </div>
  <div style="flex: 1; margin-left: 60px;">
    <select class="select1 form-select form-select-lg chartSelect" data-allow-clear="true" style="width: 300px;">
      <option value="총매출차트" selected>총매출차트</option>
      <option value="팀별 매출 점유율 차트">팀별 매출 점유율 차트</option>
      <option value="매장 매출차트">매장 매출차트</option>
    </select>
  </div>
  <div>
    <span>${currentDate}</span>
  </div>
</div>
<br><br>



<div class="justify-content-between" style="display: flex;">
  <div id="chartCenterText" style="font-size: 20px;"></div>
  <div class="d-flex justify-content-end">
    <div>
      <select id="lineChart_yearSelect" class="select1 form-select form-select-lg" data-allow-clear="true">
        <option value="2023">2023</option>
        <option value="2024" selected>2024</option>
      </select>
    </div>
  </div>
</div>

<div class="lineChart-container" style="position: relative; width: 100%;">
  <canvas id="lineChart" style="width: 100%;"></canvas>
</div>

<script>
  const lineCtx = document.getElementById('lineChart').getContext('2d');
  const 현재연도 = new Date().getFullYear();
  const 작년 = 현재연도 - 1;
  const contextPath = ''; // 실제 contextPath를 넣으세요

  const lineChart = new Chart(lineCtx, {
    type: 'line',
    data: {
      labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      datasets: [
        {
          label: 작년 + '년 매출',
          data: [], // 여기에 2023년 데이터를 추가할 것입니다
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderWidth: 1
        },
        {
          label: 현재연도 + '년 매출',
          data: [], // 여기에 2024년 데이터를 추가할 것입니다
          borderColor: 'rgba(153, 102, 255, 1)',
          backgroundColor: 'rgba(153, 102, 255, 0.2)',
          borderWidth: 1
        }
      ]
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  function 차트업데이트(연도) {
    console.log('선택된 연도: ' + 연도); // 선택된 연도 로그

    // AJAX 호출로 데이터를 가져와서 차트를 업데이트합니다.
    $.ajax({
      url: '${contextPath}/chart/allSales.do', // URL이 contextPath를 포함하도록 수정
      type: 'POST',
      data: JSON.stringify({ year: 연도 }),
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function(data) {
        console.log('가져온 데이터 (' + 연도 + '):', data); // 가져온 데이터 로그

        const 연도별데이터 = data.map(function(item) {
          if (item) {
            return item.rvValue; 
          } else {
            return 0; // null 값을 0으로 대체
          }
        });
        console.log('매핑된 데이터 (' + 연도 + '):', 연도별데이터); // 매핑된 데이터 로그

        if (연도 === 작년.toString()) {
          lineChart.data.datasets[0].data = 연도별데이터;
        } else if (연도 === 현재연도.toString()) {
          // 2024년 데이터를 가져올 때 2023년 데이터와 합산
          const 합산데이터 = [];
          const 작년도데이터 = lineChart.data.datasets[0].data;
          for (var i = 0; i < 연도별데이터.length; i++) {
            합산데이터.push((작년도데이터[i] || 0) + 연도별데이터[i]);
          }
          lineChart.data.datasets[1].data = 합산데이터;
          console.log('합산된 데이터:', 합산데이터); // 합산된 데이터 로그
        }
        lineChart.update();
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.error('AJAX 요청 실패:', {
          status: textStatus,
          error: errorThrown,
          response: jqXHR.responseText,
        });
        alert('데이터를 가져오는 데 실패했습니다.');
      }
    });
  }

  // 초기 로딩 시 데이터 로드
  차트업데이트(작년.toString());
  차트업데이트(현재연도.toString());

  // 연도 선택 변경 시 데이터 업데이트
  $('#lineChart_yearSelect').change(function() {
    var 선택된연도 = $(this).val();
    차트업데이트(선택된연도);
  });
</script>


</div>  
    
<div style="display: none; margin: 20px;" id="categorySalesChart">
<!-- 팀별 매출 점유율 차트 --> 
<div style="display: flex; justify-content: space-between; align-items: center;">
 <div>
   <span>
      <span style="font-size: 20px;">매출차트</span>
   </span>
 </div>
 <div style="flex: 1; margin-left: 60px;">
   <select class="select1 form-select form-select-lg chartSelect" data-allow-clear="true" style="width: 300px;">
      <option value="총매출차트">총매출차트</option>
      <option value="팀별 매출 점유율 차트" selected>팀별 매출 점유율 차트</option>
      <option value="매장 매출차트">매장 매출차트</option>
    </select>
  </div>
  <div>
    <span>${currentDate}</span>
  </div>
</div>
<br><br>  
<div class="justify-content-between" style="display: flex;">
  <div id="chartCenterText" style="font-size: 20px;"></div>
	<div class="d-flex justify-content-end">
		<div>
		  <select id="doughnutChart_yearSelect" class="select1 form-select form-select-lg" data-allow-clear="true">
		    <option value="2023">2023</option>
		    <option value="2024" selected>2024</option>
		  </select>
		</div>
		<div>
		  <select id="doughnutChart_monthSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="margin-left: 10px;">
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
	</div>
</div>
<div>
	<div class="doughnutChart-container" style="position: relative; width: 100%;">
	  <canvas id="doughnutChart" style="width: 100%; height: 600px;"></canvas>
	</div>
</div>		
<script>
$(function() {
	  const doughnutCtx = document.getElementById('doughnutChart').getContext('2d');
	  const doughnutChart = new Chart(doughnutCtx, {
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
	          display: true,
	          position: 'right',
	          labels: {
	            font: {
	              size: 16,
	              family: 'Arial',
	              style: 'italic',
	              weight: 'bold'
	            },
	            color: 'gray',
	            padding: 20,
	            usePointStyle: true,
	            pointStyle: 'round',
	            borderRadius: 10
	          },
	          onClick: function() {}
	        },
	        tooltip: {
	          callbacks: {
	            label: (context) => {
	              let label = context.label || '';
	              if (label) label += ': ';           

	              // 전체 매출 계산하기 전에 총 매출을 계산
	              const totalSales = context.chart.data.datasets[0].data.reduce((a, b) => a + (b || 0), 0);

	              if (context.raw !== null && context.raw !== undefined) {
	                // 퍼센트 계산
	                const percentage = totalSales > 0 ? ((context.raw / totalSales) * 100).toFixed(2) : 0;
	                
	                // 매출과 퍼센트 표시
	                label += percentage + "% (" + context.raw.toLocaleString() + "원)";
	              }
	              
	              return label;
	            }
	          }
	        },
	        datalabels: {
            color: '#444050',
            anchor: 'center', // 캔버스 내에서 중심을 기준으로 배치
            align: 'center',  // 라벨 정렬을 중심으로 설정
            formatter: (value, context) => {
              const totalSales = context.chart.data.datasets[0].data.reduce((a, b) => a + (b || 0), 0);
              const percentage = totalSales > 0 ? ((value / totalSales) * 100).toFixed(2) : 0;
              const label = context.chart.data.labels[context.dataIndex];
              // 반환된 라벨과 퍼센트를 한 줄씩 표시
              return label + "\n(" + percentage + "%)";
            },
            font: {
              size: 16, // 글씨 크기 설정
              family: 'Arial',
            },
            padding: 0, // 텍스트와 주변 간격 설정
            textAlign: 'center',
          },
	      }
	    },
	    plugins: [ChartDataLabels] // datalabels 플러그인 활성화
	  });

	  function setInitialDate() {
	    const today = new Date();
	    const year = today.getFullYear();
	    const month = ("0" + (today.getMonth() + 1)).slice(-2);
	    
	    $('#doughnutChart_yearSelect').val(year);
	    $('#doughnutChart_monthSelect').val(month);
	    
	    updateChart(year, month);
	  }

	  function updateChart(year, month) {
	    $.ajax({
	      url: `${contextPath}/chart/teamSales.do`,
	      type: "POST",
	      data: JSON.stringify({ year: year, month: month }),
	      contentType: "application/json; charset=utf-8",
	      dataType: "json",
	      success: function(data) {

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

	        // 차트 데이터 업데이트
	        doughnutChart.data.labels = departments;
	        doughnutChart.data.datasets[0].data = sales;

	        // 차트 갱신
	        doughnutChart.update();
	        
	        // 차트 중앙 텍스트 업데이트
	        $('#chartCenterText').text("총 매출: " + totalSales.toLocaleString() + "원");
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

	  $('#doughnutChart_yearSelect, #doughnutChart_monthSelect').change(function() {
	    const year = $('#doughnutChart_yearSelect').val();
	    const month = $('#doughnutChart_monthSelect').val();
	    updateChart(year, month);
	  });
	  
	  setInitialDate();
	});
	</script>

<!-- /팀별 매출 점유율 차트 -->
</div>

<div style="display: none; margin: 20px;" id="storeSalesChart">
<!-- 매장 매출 차트 -->
<div style="display: flex; justify-content: space-between; align-items: center;">
  <div>
    <span>
      <span style="font-size: 20px;">매출차트</span>
    </span>
  </div>
  <div style="flex: 1; margin-left: 60px;">
    <select class="select1 form-select form-select-lg chartSelect" data-allow-clear="true" style="width: 300px;">
      <option value="총매출차트">총매출차트</option>
      <option value="팀별 매출 점유율 차트">팀별 매출 점유율 차트</option>
      <option value="매장 매출차트" selected>매장 매출차트</option>
    </select>
  </div>
  <div>
    <span>${currentDate}</span>
  </div>
</div>
<br><br>
<div>
  <canvas id="barChart"></canvas>
</div>

<script>
  const barCtx = document.getElementById('barChart');

  new Chart(barCtx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</div>

<!-- 차트셀렉트 -->
<script>
document.addEventListener('DOMContentLoaded', () => {
  const chartSelectElements = document.querySelectorAll('.chartSelect');
  const totalSalesChart = document.getElementById('totalSalesChart');
  const categorySalesChart = document.getElementById('categorySalesChart');
  const storeSalesChart = document.getElementById('storeSalesChart');

  const showChart = (chartId) => {
    totalSalesChart.style.display = 'none';
    categorySalesChart.style.display = 'none';
    storeSalesChart.style.display = 'none';

    if (chartId === '총매출차트') {
      totalSalesChart.style.display = 'block';
    } else if (chartId === '팀별 매출 점유율 차트') {
      categorySalesChart.style.display = 'block';
    } else if (chartId === '매장 매출차트') {
      storeSalesChart.style.display = 'block';
    }
  };

  chartSelectElements.forEach(selectElement => {
    selectElement.addEventListener('change', (event) => {
      const selectedChart = event.target.value;
      
      // Update all select elements to show the selected chart option
      chartSelectElements.forEach(elem => {
        elem.value = selectedChart;
      });
      
      showChart(selectedChart);
    });
  });

  // 초기화 시 첫 번째 차트를 표시
  showChart(chartSelectElements[0].value);
});

//사이드바 처리
document.addEventListener("DOMContentLoaded", function () {
	
	const element = document.getElementById("salesChart");
	
	document.getElementById("sales").classList.add("open");
	element.style.backgroundColor = "#958CF4";
	element.style.color = "white";
	element.classList.add("active");
	
	
});
</script>
<!-- /차트셀렉트 -->

     
<!-- 여기까지 -->
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