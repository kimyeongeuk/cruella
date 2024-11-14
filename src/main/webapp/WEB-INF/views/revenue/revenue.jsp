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
        .sales-inputs {
          max-height: 500px; /* 테이블 최대 높이 설정 */
          overflow-y: auto; /* 필요 시 스크롤바 표시 */
        }
        table {
          table-layout: fixed; /* 고정 레이아웃 사용 */
          width: 100%;
        }
        td {
          white-space: nowrap; /* 텍스트 줄바꿈 방지 */
          text-align: center;
          vertical-align: middle;
        }
        td div {
          max-height: 50px; /* 셀 내 div 최대 높이 설정 */
          overflow: hidden; /* 초과 부분 숨기기 */
        }
      </style>
      

      <!-- Session Start -->
      <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">           
          <div class="container card" style="padding: 50px;">
            <span>
              <span style="color: #7367F0;">매출등록</span>
              <span> / 인사관리팀</span>
              <span id="currentDate" style="float: right;"></span>
            </span>                
            <br>
            <div class="form-group" style="display: flex; align-items: center;">
              <select id="categorySelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 200px; margin-right: 10px;">
                <option value="남성의류">남성의류</option>
                <option value="여성의류">여성의류</option>
                <option value="식품">식품</option>
                <option value="스포츠">스포츠</option>
                <option value="뷰티">뷰티</option>
                <option value="명품">명품</option>
                <option value="문화센터">문화센터</option>
                <option value="디지털 및 가전">디지털 및 가전</option>
              </select>
              <select id="storeSelect" class="select1 form-select form-select-lg" data-allow-clear="true" style="width: 200px; margin-right: 10px;">
                <!-- 상점 옵션은 자바스크립트를 통해 동적으로 추가될 예정 -->
              </select>
              <div style="display: flex; margin-left: auto;">
                <div class="btn-group" id="yearSelect" style="margin-right: 10px;">
                  <button type="button" class="btn btn-label-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    년도 선택
                  </button>
                  <ul class="dropdown-menu"></ul>
                </div>
                <div class="btn-group" id="monthSelect">
                  <button type="button" class="btn btn-label-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    월 선택
                  </button>
                  <ul class="dropdown-menu"></ul>
                </div>
              </div>
            </div>
            
            <br>
            <div class="sales-inputs">
              <div class="table-responsive text-nowrap">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="font-size: 16px;">일</th>
                      <th style="font-size: 16px;">월</th>
                      <th style="font-size: 16px;">화</th>
                      <th style="font-size: 16px;">수</th>
                      <th style="font-size: 16px;">목</th>
                      <th style="font-size: 16px;">금</th>
                      <th style="font-size: 16px;">토</th>
                    </tr>
                  </thead>
                  <tbody id="salesTableBody"></tbody>
                </table>
              </div>
            </div>
            <br>
            <div class="form-group" style="display: flex; align-items: center;">
              <div class="input-group" style="flex: 1; margin-right: 10px;">
                <span class="input-group-text">당일 매출</span>
                <input type="number" class="form-control" aria-label="매출 입력" placeholder="매출을 입력하세요." style="resize: none;">
              </div>
              <button id="registerButton" class="btn btn-primary">등록</button>
            </div>                        
          </div>              
            
          <script>
              document.addEventListener('DOMContentLoaded', () => {
                const dateSpan = document.getElementById('currentDate');
                const today = new Date();
                dateSpan.textContent = "today " + today.getFullYear() + "-" + String(today.getMonth() + 1).padStart(2, '0') + "-" + String(today.getDate()).padStart(2, '0');
              });
          </script>   

          <script>
          document.addEventListener('DOMContentLoaded', () => {
        	  const storeOptions = {
        	    '남성의류': ['레노마셔츠', '라코스테'],
        	    '여성의류': ['샤넬', '구찌'],
        	    '식품': ['롯데마트', '홈플러스'],
        	    '스포츠': ['나이키', '아디다스'],
        	    '뷰티': ['아모레퍼시픽', 'LG생활건강'],
        	    '명품': ['루이비통', '에르메스'],
        	    '문화센터': ['CGV', '롯데시네마'],
        	    '디지털 및 가전': ['삼성전자', 'LG전자']
        	  };

        	  const categorySelect = document.getElementById('categorySelect');
        	  const storeSelect = document.getElementById('storeSelect');

        	  categorySelect.addEventListener('change', function () {
        	    const selectedCategory = this.value;
        	    const stores = storeOptions[selectedCategory] || [];

        	    storeSelect.innerHTML = ''; // 기존 옵션 제거

        	    stores.forEach(store => {
        	      const option = document.createElement('option');
        	      option.value = store;
        	      option.textContent = store;
        	      storeSelect.appendChild(option);
        	    });
        	  });

        	  // 초기 선택된 카테고리의 상점 옵션 추가
        	  categorySelect.dispatchEvent(new Event('change'));

        	  const currentYear = new Date().getFullYear();
        	  const currentMonth = new Date().getMonth() + 1;
        	  const currentDate = new Date().getDate();

        	  const yearSelectBtn = document.querySelector('#yearSelect > button');
        	  const yearSelectMenu = document.querySelector('#yearSelect > ul');
        	  const monthSelectBtn = document.querySelector('#monthSelect > button');
        	  const monthSelectMenu = document.querySelector('#monthSelect > ul');
        	  const salesTableBody = document.getElementById('salesTableBody');

        	  // 매출 데이터 객체를 각 매장별로 저장
        	  const salesData = {};

        	  const formatCurrency = (amount) => {
        	    return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
        	  };

        	  for (let year = currentYear - 5; year <= currentYear; year++) {
        	    const li = document.createElement('li');
        	    const a = document.createElement('a');
        	    a.className = 'dropdown-item';
        	    a.href = 'javascript:void(0);';
        	    a.textContent = year;
        	    a.addEventListener('click', () => {
        	      yearSelectBtn.textContent = year;
        	      populateSalesTable();
        	    });
        	    li.appendChild(a);
        	    yearSelectMenu.appendChild(li);
        	  }

        	  for (let month = 1; month <= 12; month++) {
        	    const li = document.createElement('li');
        	    const a = document.createElement('a');
        	    a.className = 'dropdown-item';
        	    a.href = 'javascript:void(0);';
        	    a.textContent = month;
        	    a.addEventListener('click', () => {
        	      monthSelectBtn.textContent = month;
        	      populateSalesTable();
        	    });
        	    li.appendChild(a);
        	    monthSelectMenu.appendChild(li);
        	  }

        	  const populateSalesTable = () => {
        	    salesTableBody.innerHTML = '';
        	    const selectedYear = yearSelectBtn.textContent;
        	    const selectedMonth = monthSelectBtn.textContent;
        	    const selectedStore = storeSelect.value;
        	    const daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
        	    const firstDay = new Date(selectedYear, selectedMonth - 1, 1).getDay();
        	    let dayCount = 1;

        	    for (let week = 0; week < 6; week++) {
        	      const row = document.createElement('tr');
        	      for (let day = 0; day < 7; day++) {
        	        const cell = document.createElement('td');
        	        if ((week === 0 && day < firstDay) || dayCount > daysInMonth) {
        	          cell.innerHTML = '';
        	        } else {
        	          const div = document.createElement('div');
        	          
        	          const salesAmount = salesData[selectedStore] &&
        	            salesData[selectedStore][selectedYear] &&
        	            salesData[selectedStore][selectedYear][selectedMonth] &&
        	            salesData[selectedStore][selectedYear][selectedMonth][dayCount]
        	              ? formatCurrency(salesData[selectedStore][selectedYear][selectedMonth][dayCount])
        	              : 'N/A';

        	          cell.innerHTML = `${dayCount}일<br>${salesAmount}`;
        	          cell.appendChild(div);
        	          
        	          dayCount++;
        	        }
        	        row.appendChild(cell);
        	      }
        	      salesTableBody.appendChild(row);
        	      if (dayCount > daysInMonth) break;
        	    }
        	  };

        	  yearSelectBtn.textContent = currentYear;
        	  monthSelectBtn.textContent = currentMonth;

        	  populateSalesTable();

        	  document.getElementById('registerButton').addEventListener('click', () => {
        	    const input = document.querySelector('.form-control[aria-label="매출 입력"]');
        	    const salesValue = input.value;
        	    if (!salesValue) {
        	      alert('매출을 입력하세요.');
        	      return;
        	    }
        	    const selectedYear = yearSelectBtn.textContent;
        	    const selectedMonth = monthSelectBtn.textContent;
        	    const selectedStore = storeSelect.value;

        	    if (!salesData[selectedStore]) {
        	      salesData[selectedStore] = {};
        	    }
        	    if (!salesData[selectedStore][selectedYear]) {
        	      salesData[selectedStore][selectedYear] = {};
        	    }
        	    if (!salesData[selectedStore][selectedYear][selectedMonth]) {
        	      salesData[selectedStore][selectedYear][selectedMonth] = {};
        	    }
        	    salesData[selectedStore][selectedYear][selectedMonth][currentDate] = parseInt(salesValue);

        	    // 로그를 통해 데이터 확인
        	    console.log('Sales Data:', salesData);

        	    populateSalesTable();
        	    input.value = ''; // 입력 필드 초기화
        	  });
        	});

          </script>

        </div> 
      </div>
    
    
    
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