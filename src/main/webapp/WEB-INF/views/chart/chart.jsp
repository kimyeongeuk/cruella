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
    
      <div class="layout-page">

    <!-- nav 시작 -->
      <jsp:include page="/WEB-INF/views/common/nav.jsp" />
      <!-- nav 끗 -->


   <div class="content-wrapper">
   <!-- 세션 시작 -->
    <div class="container-xxl flex-grow-1 container-p-y">
     	<!-- 이쪽에 세션정보 넣어야합니다 ----------------------------------------------------------------------- -->
    	
    	<style>
            .chart-container {
              position: relative;
              display: flex;
              gap: 50px;
              align-items: center;
              margin-left: 80px;
              height: 400px;
            }
            .legend-item {
              display: flex;
              align-items: center;
              margin-bottom: 10px;
              cursor: pointer;
              transition: background-color 0.3s;
            }
            #doughnutChart{
              width: 130%;
            }
            .legend-color {
              width: 20px;
              height: 20px;
              margin-right: 10px;
              border-radius: 50%;
            }
            .legend-item.active {
              background-color: rgba(0, 0, 0, 0.1);
            }
           

          </style>

          <!-- Session Start -->
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="container p-3">


                <!-- 총매출 매출차트 
                <div class="chart-wrapper card" style="padding: 30px; height:650px;">
                  <div style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                      <span>
                        <span style="color: #7367F0;">차트</span><span> / 인사관리팀</span>
                      </span>
                    </div>
                    <div style="flex: 1; margin-left: 60px;">
                      <select id="chartSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 300px;">
                        <option value="총매출차트" selected="selected">총매출차트</option>
                        <option value="카테고리별 매출차트">카테고리별 매출차트</option>
                        <option value="매장 매출차트">매장 매출차트</option>
                      </select>
                    </div>
                    <div>
                      <span>today 2024-11-06</span>
                    </div>
                  </div>       
                  <br>
	                <div class="col-12 mb-6">
	                  <div class="card">
	                    <div class="card-header d-flex justify-content-between">
	                      <div>
	                        <h5 class="card-title mb-0">Balance</h5>
	                        <p class="card-subtitle my-0">Commercial networks & enterprises</p>
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
                	-->


                  <!-- 카테고리별 매출 
                  <div class="chart-wrapper card" style="padding: 30px; height:650px;"> 
                    <div style="display: flex; justify-content: space-between; align-items: center;">
	                    <div>
	                      <span>
	                        <span style="color: #7367F0;">차트</span><span> / 인사관리팀</span>
	                      </span>
	                    </div>
	                    <div style="flex: 1; margin-left: 60px;">
	                      <select id="chartSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 300px;">
	                        <option value="총매출차트">총매출차트</option>
	                        <option value="카테고리별 매출차트" selected="selected">카테고리별 매출차트</option>
	                        <option value="매장 매출차트">매장 매출차트</option>
	                      </select>
	                    </div>
	                    <div>
	                      <span>today 2024-11-06</span>
	                    </div>
	                  </div>
	                  <br>   
                    <div class="justify-content-between" style="display: flex;">
                      <div id="chartCenterText"></div>
                      <div class="form-group" style="display: flex;">
                        <div class="btn-group" id="yearSelect">
                          <select id="yearSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 120px;">
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024" selected>2024</option>
                          </select>
                        </div>
                        <div class="btn-group" id="monthSelect" style="margin-left: 10px;">
                          <select id="monthSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 100px;">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>  
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11" selected>11</option>
                            <option value="12">12</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="chart-container"> 
                      <div id="chartWrapper"> 
                        <canvas id="doughnutChart"></canvas> 
                        <div class="chartjs-center-text">
                        </div> 
                      </div> 
                      <div class="legend-container" id="legendContainer">
                      </div> 
                    </div>
                  </div>
                  -->
                  

                  <!-- 매장 매출차트 -->
									<div class="input-wrapper card" style="padding: 30px; height:650px;">
										<div style="display: flex; justify-content: space-between; align-items: center;">
	                    <div>
	                      <span>
	                        <span style="color: #7367F0;">차트</span><span> / 인사관리팀</span>
	                      </span>
	                    </div>
	                    <div style="flex: 1; margin-left: 60px;">
	                      <select id="chartSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 300px;">
	                        <option value="총매출차트">총매출차트</option>
	                        <option value="카테고리별 매출차트">카테고리별 매출차트</option>
	                        <option value="매장 매출차트" selected="selected">매장 매출차트</option>
	                      </select>
	                    </div>
	                    <div>
	                      <span>today 2024-11-06</span>
	                    </div>
	                  </div>
	                  <br>
									  <div style="display: flex; justify-content: space-between; align-items: center;">
									    <select id="categorySelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 200px;">
									      <option value="남성의류">남성의류</option>
									      <option value="여성의류">여성의류</option>
									      <option value="식품">식품</option>
									      <option value="스포츠">스포츠</option>
									      <option value="뷰티">뷰티</option>
									      <option value="명품">명품</option>
									      <option value="문화센터">문화센터</option>
									      <option value="디지털 및 가전">디지털 및 가전</option>
									    </select>
									    
									    <input
									      type="text"
									      class="form-control"
									      style="width: 25%; height: 48px;"
									      placeholder="날짜선택"
									      id="flatpickr-range" />
									  </div>
									  <div class="chart-container" style="margin-top: 20px;">
									    <canvas id="barChart" style="height: 400px;"></canvas>
									  </div>
									</div>
									
                  
                  

                </div>
              </div>
            </div> 
          </div>


          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
            

          <!-- 카테고리 차트 -->
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
        
              const updateCenterText = () => {
                const totalSales = data.datasets[0].data.reduce((a, b, i) => a + (!chart.getDatasetMeta(0).data[i].hidden ? b : 0), 0);
                chartCenterText.innerText = `24년 11월 총 매출: ${totalSales.toLocaleString()} 원`;
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
                        display: true,
                        position: 'right' // 범례를 오른쪽에 배치합니다
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
    
    
    
    	<!-- 세션정보 끝 ---------------------------------------------------------------------------------------- -->
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