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

										<li class="nav-item"><a class="nav-link" href="#"> <i
												class="ti-sm ti ti-user-check me-1_5"></i> 직원등록</a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link active" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 출근기록조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 근무시간조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여지급 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여내역확인 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 조직도 </a></li>

									</ul>
								</div>
							</div>
						</div>

						<div class="card mb-6">
							<!--상단프로필-->
							<div
								class="user-profile-header d-flex flex-column flex-lg-row text-sm-start text-center mb-5">
								<div style="align-content: center; margin-top: 20px;">
									<img src="${ contextPath }/assets/img/avatars/1.png" alt="user image"
										class="d-block h-auto ms-0 ms-sm-6 rounded user-profile-img" />
								</div>
								<div class="flex-grow-1 mt-3 mt-lg-5">
									<div
										class="d-flex align-items-md-end align-items-sm-start align-items-center justify-content-md-between justify-content-start mx-5 flex-md-row flex-column gap-4">
										<div class="user-profile-info">
											<h4 class="mb-2 mt-lg-6">${ loginUser.getMemName() }</h4>
											<ul
												class="list-inline mb-0 d-flex align-items-center flex-wrap justify-content-sm-start justify-content-center gap-4 my-2">
												<li class="list-inline-item d-flex gap-2 align-items-center">
													<i class="ti ti-book ti-lg"></i>
													<span class="fw-medium">${ loginUser.getDeptName() }</span>
												</li>
												<li class="list-inline-item d-flex gap-2 align-items-center">
													<i class="ti ti-tag ti-lg"></i>
													<span class="fw-medium">${ loginUser.getPosName() }</span>
												</li>
												<li class="list-inline-item d-flex gap-2 align-items-center">
													<i class="ti ti-mail ti-lg"></i>
													<span class="fw-medium">
														${ loginUser.getEmail() }</span>
												</li>
											</ul>
										</div>
										<button id="toggleButton" class="btn btn-primary">관리자조회</button>
										<div id="searchBox" style="display: none; margin-top: 10px;">
											<input type="text" placeholder="검색어를 입력하세요" />
										</div>




									</div>
								</div>
							</div>
						</div>
						<!--/상단프로필-->
						<div class="card" style="padding: 30px;">

							<div style="display: flex;">
								<h5 class="card-header"
									style="display: flex; align-items: center;">
									<select class="form-select"
										style="width: 100px; margin-right: 10px;">
										<option value="">2024</option>
										<option value="">2023</option>
									</select> <span>년</span>
								</h5>

								<h5 class="card-header"
									style="display: flex; align-items: center; padding: 0;">
									<select class="form-select"
										style="width: 70px; margin-right: 10px;">
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
									</select> <span>월</span>
								</h5>
																<button type="button" class="btn btn-primary" id="select_sal_date" style="
																																													width: 100px;
																																						  						height: 37px; 
																																						 							position: relative; 
																																						  						top: 20px;
																																						  						left: 21px;
																																						  						margin-top: 5px	;">검색</button>
																																						  						
							</div>
							<div class="table-responsive text-nowrap">
								<table class="table" style="text-align: center;">
									<thead>
										<tr>
											<th>상태</th>
											<th>출근</th>
											<th>퇴근</th>
											<th>날짜</th>

										</tr>
									</thead>

									<tbody class="table-border-bottom-0">
										<c:forEach var="wl" items="${workLog}">
											<tr>
												<c:choose>
													<c:when test="${ wl.status eq 'C' }">
												    <td><span class="fw-medium">출근</span></td>
												  </c:when>
													<c:when test="${ wl.status eq 'N' }">
												    <td><span class="fw-medium">정상</span></td>
												  </c:when>
													<c:when test="${ wl.status eq 'L' }">
												    <td><span class="fw-medium">지각</span></td>
												  </c:when>
													<c:when test="${ wl.status eq 'A' }">
												    <td><span class="fw-medium">결근</span></td>
												  </c:when>
													<c:when test="${ wl.status eq 'E' }">
												    <td><span class="fw-medium">조퇴</span></td>
												  </c:when>
												  
												</c:choose>		
												<td><span class="fw-medium">${ wl.clockInTime }</span></td>
	
												<td><span class="fw-medium">${ wl.clockOutTime }</span></td>
												<td><span class="fw-medium">${ wl.workDate }</span></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

											<!-- "근태상태('C' 출근, 'N' 정상, 'L' 지각, 'A' 결근, 'E' 조퇴)" -->


					</div>
					<!-- 세션 끝 -->



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





</body>
</html>