<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
	dir="ltr" data-theme="theme-default"
	data-assets-path="${ contextPath }/assets/" data-template="views"
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
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
			<!-- 헤더 끝 -->

			<div class="layout-page">

				<!-- nav 시작 -->
				<jsp:include page="/WEB-INF/views/common/nav.jsp" />
				<!-- nav 끗 -->


				<div class="content-wrapper">
					<!-- 세션 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- 이쪽에 세션정보 넣어야합니다 -->



						<div class="row">
							<div class="col-md-12">
								<div class="nav-align-top">
									<ul
										class="nav nav-pills flex-column flex-sm-row mb-6 gap-2 gap-lg-0">
										<c:if test="${ loginUser.deptCode eq 'S2'}">
											<li class="nav-item"><a class="nav-link"
												href="${ contextPath }/member/signup.do"> <i
													class="ti-sm ti ti-user-check me-1_5"></i> 직원등록
											</a></li>
										</c:if>

										<li class="nav-item"><a class="nav-link "
											href="${ contextPath }/member/employeelistview.do""><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link"
											href="${ contextPath }/wl/checkinrecordview.do""><i
												class="ti-sm ti ti-users me-1_5"></i> 출근기록조회 </a></li>

										<li class="nav-item"><a class="nav-link"
											href="${ contextPath }/member/workhoursview.do""><i
												class="ti-sm ti ti-users me-1_5"></i> 근무시간조회 </a></li>
										<c:if test="${ loginUser.deptCode eq 'S2'}">
											<li class="nav-item"><a class="nav-link"
												href="${ contextPath }/member/salarypayment.do""><i
													class="ti-sm ti ti-users me-1_5"></i> 급여지급 </a></li>
										</c:if>

										<li class="nav-item"><a class="nav-link active"
											href="${ contextPath }/member/checksalary.do""><i
												class="ti-sm ti ti-money me-1_5"></i> 급여내역확인 </a></li>
								</div>
							</div>
						</div>







						<div class="card" style="padding: 30px;">
							<div class="d-flex">
								<h5 class="card-header" style="width: 15%;">급여 확인</h5>


								<!--                   <div style="display: flex;">
                    <h5 class="card-header" style="display: flex; align-items: center;">
                      <select class="form-select" style="width: 100px; margin-right: 10px;" >
                          <option value="">2024</option>
                          <option value="">2023</option>
                      </select> 
                      <span>년</span>
                    </h5>
                  <h5 class="card-header" style="display: flex; align-items: center; padding: 0;">
                      <select class="form-select" style="width: 70px; margin-right: 10px;">
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4</option>
                      </select> 
                      <span>월</span>
                  </h5>
                  </div> -->


								<div
									style="width: 75%; align-items: center; justify-content: right;"
									class="d-flex"></div>

							</div>
							<div class="table-responsive text-nowrap">
								<table class="table" style="text-align: center;">

									<tr>
										<th rowspan="2">사번</th>
										<th rowspan="2">사원명</th>
										<th rowspan="2">부서</th>
										<th rowspan="2">직급</th>
										<th rowspan="2" style="text-align: center;">기본급</th>
										<th colspan="4" style="text-align: center;">공제항목</th>
										<th rowspan="2">지급예정금액</th>
										<th rowspan="2">지급날짜</th>
										<th rowspan="2">급여명세표</th>

									</tr>
									<tr>
										<th>국민연금</th>
										<th>건강보험</th>
										<th>고용보험</th>
										<th>장기요양</th>

									</tr>
									</thead>
									<tbody class="table-border-bottom-0">

										<tr>
											<!-- 사번자리 -->
											<td><span>${cs.memNo}</span></td>
											<!-- 사원명 -->
											<td>${cs.memName}</td>
											<!-- 부서명 -->
											<td>${cs.deptName}</td>
											<!-- 직급명 -->
											<td>${cs.posName}</td>
											<!-- 기본급 -->
											<td class="salary-field">${cs.salary}원</td>
											<!-- 국민연금 -->
											<td class="salary-field">${cs.pension}원</td>
											<!-- 건강보험 -->
											<td class="salary-field">${cs.health}원</td>
											<!-- 고용보험 -->
											<td class="salary-field">${cs.employment}원</td>
											<!-- 장기요양 -->
											<td class="salary-field">${cs.care}원</td>
											<!-- 지급예정금액 -->
											<td class="salary-field">${cs.totalSalary}원</td>
											<!-- 지급날짜 -->
											<td>${cs.paymentDate}</td>
											<!-- 급여명세표 -->
											<td>
												<form action="${contextPath}/member/paystub.do"
													method="post" id="submit_btn">
													<input type="hidden" value="${cs.memNo}" name="memNo">
													<i class="pay_icon far fa-file-alt"></i>
												</form>
											</td>
										</tr>
									</tbody>

								</table>
							</div>
						</div>




					</div>




				</div>
				<!-- 세션 끝 -->


				<script>
					$(document).on('click', '.pay_icon', function() {
						$(this).closest('form').submit();
					});
				</script>



				<!-- 푸터 시작 -->
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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
    // 사이드바 처리
	document.addEventListener("DOMContentLoaded", function () {
  	
		const element = document.getElementById("checksalary");
		
  	document.getElementById("member").classList.add("open");
  	element.style.backgroundColor = "#958CF4";
  	element.style.color = "white";
  	element.classList.add("active");
  	
  	
	});
	</script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 숫자에 콤마를 추가하는 함수
        function formatNumberWithCommas(number) {
            if (!number) return "";
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // 테이블 내 급여와 관련된 숫자 필드 포맷팅
        const salaryFields = document.querySelectorAll(".salary-field");

        salaryFields.forEach(field => {
            // "원"을 제외하고 숫자만 추출
            const rawValue = field.textContent.replace(/,/g, "").replace("원", "").trim();

            if (!isNaN(rawValue)) {
                // 콤마 추가 및 "원" 단위 복원
                field.textContent = formatNumberWithCommas(rawValue) + "원";
            }
        });
    });
</script>




</body>
</html>