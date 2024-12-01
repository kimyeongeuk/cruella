<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Arrays" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="${contextPath}/assets/" data-template="views" data-style="light">
<head>
<meta charset="UTF-8">
<title>Revenue Entry</title>
<script src="${contextPath}/resources/assets/js/config.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- flatpickr 한글 설정 CSS -->
<link rel="stylesheet" href="https://npmcdn.com/flatpickr/dist/l10n/ko.css">
</head>
<style>
    #salesRegist::before {
        content: ''; /* 가상 요소 필수 */
        display: inline-block; /* 블록 요소 */
        width: 10px; /* 동그라미 크기 */
        height: 10px; /* 동그라미 크기 */
        border-radius: 50%; /* 완전한 원 */
        background-color: transparent; /* 배경을 투명으로 설정 */
        border: 2px solid gray; /* 초기 테두리 색상 */
    }
    #salesRegist.active::before {
        border: 2px solid white; /* 테두리만 흰색으로 변경 */
    }
		.datatables-basic {
		  table-layout: fixed;
		  width: 100%;
		}
		
		.datatables-basic th,
		.datatables-basic td {
		  white-space: nowrap;
		  overflow: hidden;
		  
		}
		/* 중앙 정렬을 위한 CSS */
		.flatpickr-current-month {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.flatpickr-current-month .flatpickr-monthDropdown-months,
		.flatpickr-current-month .numInputWrapper {
		    justify-content: center;
		}
</style>
<body>
<%-- 부서 코드 확인 --%>
<c:if test="${not empty param.deptCode and param.deptCode != loginUser.deptCode}">
    <script>
        alert("해당 부서가 아닙니다.");
        window.location.href = "${contextPath}/revenue/revenue.do?deptCode=${loginUser.deptCode}";
    </script>
</c:if>

<%-- 직책 코드 확인 --%>
<c:choose>
    <c:when test="${not empty loginUser.posCode and loginUser.posCode != 'C1' and loginUser.posCode != 'C2' and loginUser.posCode != 'C3' and loginUser.posCode != 'C4'}">
        <script>
            alert("관리자가 아닙니다.");
            window.location.href = "${contextPath}/member/dashboard.do";
        </script>
    </c:when>
</c:choose>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- 헤더 시작 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <!-- 헤더 끝 -->

        <div class="layout-page">
            <!-- 네비게이션 -->
            <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
            <!-- 네비게이션 끝 -->

            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="container card py-5">
                        <!-- 페이지 제목 -->
                        <h4 class="fw-bold py-3 mb-4">매출 등록</h4>

                        <!-- 성공 메시지 -->
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success" role="alert">${successMessage}</div>
                        </c:if>

                        <!-- 실패 메시지 -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger" role="alert">${errorMessage}</div>
                        </c:if>

                        <!-- 매출 등록 폼 -->
                        <form id="revenueForm" action="${contextPath}/revenue/registerAll.do" method="post">
                            <input type="hidden" name="memNo" value="${loginUser.memNo}"/>
                            <input type="hidden" name="deptCode" value="${deptCode}"/>
                            <div id="storeInputs">
                                <!-- 매장 입력 필드 동적 생성 -->
                                <c:forEach items="${storeOptions}" var="store" varStatus="status">
                                    <div class="store-input-group mb-3">
                                        <label for="rvStore${status.index}" class="form-label">매장 ${status.index + 1}</label>
                                        <select class="form-select rvStore" name="rvStores[]">
                                            <option value="${store}" selected>${store}</option>
                                        </select>
                                        <label for="rvValue${status.index}" class="form-label">당일 매출</label>
                                        <input type="number" class="form-control rvValue" name="rvValues[]"/>
                                    </div>
                                </c:forEach>
                            </div>
                            <button type="submit" class="btn btn-primary">매출등록</button>
                        </form>
                    		<br><br>
                    		
                    		<h4 class="fw-bold py-3 mb-4">매출 조회</h4>
                  			<div class="ms-auto d-flex">
													<!-- 검색 폼 -->
													<form action="${contextPath}/revenue/revenue.do" method="get" class="d-flex align-items-center">
													    <input type="hidden" name="deptCode" value="${deptCode}"/>
													    <input type="hidden" name="startDate" value="${startDate}">
													    <input type="hidden" name="endDate" value="${endDate}">
													    <div class="input-group mb-3">
													        <input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요" value="${searchKeyword}">
													        <input type="text" class="form-control custom-select" placeholder="날짜를 선택해주세요" id="flatpickr-range" name="dateRange" value="${startDate} to ${endDate}" />
													        <button class="btn btn-primary" type="submit">검색</button>
													    </div>
													</form>
												</div>
												<script>
												    document.addEventListener('DOMContentLoaded', function () {
												        flatpickr("#flatpickr-range", {
												            mode: "range",  // 날짜 범위 선택
												            dateFormat: "Y-m-d",  // 날짜 형식
												            locale: "ko",  // 한글 설정
												            defaultDate: ["${startDate}", "${endDate}"],  // 기본 날짜 범위 설정
												            onClose: function(selectedDates, dateStr, instance) {
												                if (selectedDates.length === 2) {
												                    // 날짜 선택 시 'startDate'와 'endDate' 필드를 업데이트
												                    var startDate = new Date(selectedDates[0]);
												                    var endDate = new Date(selectedDates[1]);
												                    startDate.setDate(startDate.getDate() + 1);  // 'endDate'에 하루를 더함
												                    endDate.setDate(endDate.getDate() + 1);
												                    document.querySelector('input[name="startDate"]').value = startDate.toISOString().split('T')[0];  // 'startDate' 값 설정
												                    document.querySelector('input[name="endDate"]').value = endDate.toISOString().split('T')[0];  // 'endDate' 값 설정
												                } else {
												                    // 날짜 범위 선택이 없으면 입력값을 비워둠
												                    document.querySelector('input[name="startDate"]').value = '';
												                    document.querySelector('input[name="endDate"]').value = '';
												                }
												            }
												        });
												    });
												</script>
																						
												<input type="hidden" name="startDate" value="${startDate}">
												<input type="hidden" name="endDate" value="${endDate}">

												
												
												<!-- 매출 테이블 -->
												<table  class="datatables-basic table text-center" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
												    <thead>
												        <tr>
												            <th>관리자</th>
												            <th>매장 이름</th>
												            <th>매출 값</th>
												            <th>등록 날짜</th>
												        </tr>
												    </thead>
												    <tbody>
												        <c:forEach items="${revenueList}" var="revenue">
												            <tr>
												                <td>${revenue.memName}</td>
												                <td>${revenue.rvStore}</td>
												                <td><fmt:formatNumber value="${revenue.rvValue}" type="number" pattern="#,##0"/></td>
												                <td>${revenue.rvRegistDate}</td>
												            </tr>
												        </c:forEach>
												    </tbody>
												</table>
												<br>
												<!-- 페이징 -->
												<div class="d-flex justify-content-center">
												    <nav aria-label="Page navigation">
												        <ul class="pagination" id="paging_area">
												            <li class="page-item first">
												                <a class="page-link" href="${contextPath}/revenue/revenue.do?page=1&size=${size}&deptCode=${deptCode}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">
												                    <i class="ti ti-chevrons-left ti-sm"></i>
												                </a>
												            </li>
												            <li class="page-item prev ${pi.currentPage == 1 ? 'disabled' : ''}">
												                <a class="page-link" href="${contextPath}/revenue/revenue.do?page=${pi.currentPage - 1}&size=${size}&deptCode=${deptCode}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">
												                    <i class="ti ti-chevron-left ti-sm"></i>
												                </a>
												            </li>
												            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
												                <li class="page-item ${i == pi.currentPage ? 'active' : ''}">
												                    <a class="page-link" href="${contextPath}/revenue/revenue.do?page=${i}&size=${size}&deptCode=${deptCode}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">
												                        ${i}
												                    </a>
												                </li>
												            </c:forEach>
												            <li class="page-item next ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
												                <a class="page-link" href="${contextPath}/revenue/revenue.do?page=${pi.currentPage + 1}&size=${size}&deptCode=${deptCode}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">
												                    <i class="ti ti-chevron-right ti-sm"></i>
												                </a>
												            </li>
												            <li class="page-item last">
												                <a class="page-link" href="${contextPath}/revenue/revenue.do?page=${pi.maxPage}&size=${size}&deptCode=${deptCode}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">
												                    <i class="ti ti-chevrons-right ti-sm"></i>
												                </a>
												            </li>
												        </ul>
												    </nav>
												</div>


										</div>
                </div>
            </div>

            <!-- 푸터 -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            <!-- 푸터 끝 -->
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('revenueForm').addEventListener('submit', function (event) {
        const storeInputs = document.querySelectorAll('.rvValue');
        let isFormValid = false;

        storeInputs.forEach(input => {
            if (input.value.trim() !== '') {
                isFormValid = true;
            }
        });

        if (!isFormValid) {
            event.preventDefault();
            alert('최소 하나의 매출 입력값을 입력해 주세요.');
        } else {
            // 빈 입력값을 가진 필드를 제거하여 제출
            storeInputs.forEach(input => {
                if (input.value.trim() === '') {
                    input.closest('.store-input-group').remove();
                }
            });
        }
    });
    
    // 사이드바 활성화 처리
    const element = document.getElementById("salesRegist");
    document.getElementById("sales").classList.add("open");
    element.style.backgroundColor = "#958CF4";
    element.style.color = "white";
    element.classList.add("active");
});
</script>
<!-- flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- flatpickr 한글 설정 JS -->
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
</body>
</html>
