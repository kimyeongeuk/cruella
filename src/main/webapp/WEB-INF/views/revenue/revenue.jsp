<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="${contextPath}/assets/" data-template="views" data-style="light">
<head>
    <meta charset="UTF-8">
    <title>Revenue Entry</title>
    <script src="${contextPath}/resources/assets/js/config.js"></script>
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
</style>
<body>
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
                            <input type="hidden" name="deptCode" value="${loginUser.deptCode}"/>
                            <div id="storeInputs">
                                <!-- 첫 번째 매장 입력 필드 -->
                                <div class="store-input-group mb-3">
                                    <label for="rvStore1" class="form-label">매장 1</label>
                                    <select class="form-select rvStore" name="rvStores[]">
                                        <c:forEach items="${storeOptions}" var="store" varStatus="status">
                                            <c:if test="${status.index == 0}">
                                                <option value="${store}" selected>${store}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <label for="rvValue1" class="form-label">당일 매출</label>
                                    <input type="number" class="form-control rvValue" name="rvValues[]"/>
                                </div>

                                <!-- 두 번째 매장 입력 필드 -->
                                <div class="store-input-group mb-3">
                                    <label for="rvStore2" class="form-label">매장 2</label>
                                    <select class="form-select rvStore" name="rvStores[]">
                                        <c:forEach items="${storeOptions}" var="store" varStatus="status">
                                            <c:if test="${status.index == 1}">
                                                <option value="${store}" selected>${store}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <label for="rvValue2" class="form-label">당일 매출</label>
                                    <input type="number" class="form-control rvValue" name="rvValues[]"/>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">매출등록</button>
                        </form>
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
});

// 사이드바 처리
document.addEventListener("DOMContentLoaded", function () {
	
	const element = document.getElementById("salesRegist");
	
	document.getElementById("sales").classList.add("open");
	element.style.backgroundColor = "#958CF4";
	element.style.color = "white";
	element.classList.add("active");
	
	
});
</script>
</body>
</html>
