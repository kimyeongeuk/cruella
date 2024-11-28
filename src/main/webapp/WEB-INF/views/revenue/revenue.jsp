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
  data-assets-path="${contextPath}/assets/"
  data-template="views"
  data-style="light">
<head>
    <meta charset="UTF-8">
    <title>Revenue Entry</title>
    <script src="${contextPath}/resources/assets/js/config.js"></script>
</head>
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
                <!-- 여기부터 -->

            <!-- 페이지 제목 -->
            <h4 class="fw-bold py-3 mb-4">매출 등록</h4>
    
            <!-- 성공 메시지 -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success" role="alert">
                    ${successMessage}
                </div>
            </c:if>
    
            <!-- 실패 메시지 -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger" role="alert">
                    ${errorMessage}
                </div>
            </c:if>
    
            <!-- 매출 등록 폼 -->
            <form action="${contextPath}/revenue/register.do" method="post">
              <input type="hidden" name="memNo" value="${loginUser.memNo}"/>
    
                        <div class="mb-3">
                            <label for="deptCode" class="form-label">카테고리</label>
                            <select class="form-select" id="deptCode" name="deptCode" disabled>
                                <option value="T1" ${loginUser.deptCode == 'T1' ? 'selected' : ''}>남성의류</option>
                                <option value="T2" ${loginUser.deptCode == 'T2' ? 'selected' : ''}>여성의류</option>
                                <option value="T3" ${loginUser.deptCode == 'T3' ? 'selected' : ''}>식품</option>
                                <option value="T4" ${loginUser.deptCode == 'T4' ? 'selected' : ''}>스포츠</option>
                                <option value="T5" ${loginUser.deptCode == 'T5' ? 'selected' : ''}>뷰티</option>
                                <option value="T6" ${loginUser.deptCode == 'T6' ? 'selected' : ''}>명품</option>
                                <option value="T7" ${loginUser.deptCode == 'T7' ? 'selected' : ''}>문화센터</option>
                                <option value="T8" ${loginUser.deptCode == 'T8' ? 'selected' : ''}>디지털 및 가전</option>
                            </select>
                            <!-- 숨겨진 필드로 데이터 전송 -->
                            <input type="hidden" name="deptCode" value="${loginUser.deptCode}" />
                        </div>

              <div class="mb-3">
                <label for="rvStore" class="form-label">매장</label>
                <select class="form-select" id="rvStore" name="rvStore">
                <!-- 옵션은 JavaScript에서 DEPT_CODE에 따라 동적으로 추가 -->
                </select>
              </div>
              
              <div class="mb-3">
                <label for="rvValue" class="form-label">당일매출</label>
                <input type="number" class="form-control" id="rvValue" name="rvValue" required/>
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
  document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM이 로드됨");

    // DEPT_CODE와 관련된 상점 데이터
    const storeData = {
        "T1": ["레노마셔츠", "라코스테"],
        "T2": ["샤넬", "구찌"],
        "T3": ["롯데마트", "홈플러스"],
        "T4": ["나이키", "아디다스"],
        "T5": ["아모레퍼시픽", "LG생활건강"],
        "T6": ["루이비통", "에르메스"],
        "T7": ["CGV", "롯데시네마"],
        "T8": ["삼성전자", "LG전자"]
    };

    console.log("상점 데이터 로드됨");

    // DEPT_CODE 변경 시 상점 목록 업데이트
    document.getElementById("deptCode").addEventListener("change", function () {
        const deptCode = this.value;
        const storeSelect = document.getElementById("rvStore");

        console.log("deptCode 변경됨: " + deptCode);

        // 이전 옵션 초기화
        storeSelect.innerHTML = "";

        // 새로운 옵션 추가
        if (storeData[deptCode]) {
            storeData[deptCode].forEach(store => {
                const option = document.createElement("option");
                option.value = store;
                option.textContent = store;
                storeSelect.appendChild(option);
            });
        }
    });

    // 페이지 로드 시 기본 DEPT_CODE의 상점 목록 로드
    document.getElementById("deptCode").dispatchEvent(new Event("change"));
    console.log("기본 DEPT_CODE 상점 목록 로드됨");
  });
</script>
</body>
</html>
