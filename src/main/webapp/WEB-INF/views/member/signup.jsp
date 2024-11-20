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

										<li class="nav-item"><a class="nav-link active" href="#"> <i
												class="ti-sm ti ti-user-check me-1_5"></i> 직원등록</a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
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

						<div class="container-xxl flex-grow-1 container-p-y">
							<div class="row">
								<div class="col-md-12">

									<div class="card mb-6">
										<!-- Account -->
										<div class="card-body">
											<div style="text-align: center;">
                        <img
                          src="${contextPath}/assets/img/avatars/1.png"
                          alt="user-avatar"
                          class="d-block w-px-140 h-px-140 rounded mx-auto"
                          id="uploadedAvatar" 
                          style="margin-bottom: 20px; align-items: center;"
                          height="120px" 
                          />
												<div class="button-wrapper">
	                         <label for="upload" class="btn btn-primary me-3 mb-4" tabindex="0">
	                           <span class="d-none d-sm-block">첨부파일 업로드</span>
	                           <i class="ti ti-upload d-block d-sm-none"></i>
	                           <input
	                             type="file"
	                             id="upload"
	                             class="account-file-input"
	                             hidden
	                             accept="image/png, image/jpeg" 
	                            />
	                         </label>
													<button type="button"
														class="btn btn-label-secondary account-image-reset mb-4">
														<i class="ti ti-refresh-dot d-block d-sm-none"></i> <span
															class="d-none d-sm-block">Reset</span>
													</button>
												</div>
												
												<script>
													$(document).ready(function() {
														$('#upload').on("change", function(evt) {
															const file = evt.target.files[0]; // 사용자가 선택한 파일
															
															
															console.log(file );
															
															if(file){
																// 선택된 파일 업로드전 미리보기
																const reader = new FileReader();
																reader.onload = function(r) {
																	$('#uploadedAvatar').attr("src", r.target.result); // 이미지 변경
																};
																reader.readAsDataURL(file);
																
																
																let formData = new FormData();
																formData.append("uploadFile", file);
																
																$.ajax({
																	url: '${contextPath}/member/updateProfile.do',
																	type: 'post',
																	data: formData,
																	processData: false,
																	contentType: false,
																	success: function (res) {
																		if(res == "SUCCESS"){
																			location.reload();
																		}else {
																			alert('이미지변경실패');
																			
																		}
																		
																	}
																})
															}
															
														})
													})
													
													
													
													
													
												</script>
												
											</div>
										</div>
										<h5 class="pb-4 border-bottom mb-4"></h5>
										<div class="card-body pt-4">
											<form id="formAccountSettings" action="${ contextPath }/member/insert.do" method="post">
												<div class="row">
													<div class="mb-4 col-md-6">
														<label for="memName" class="form-label">이름</label> <input
															class="form-control" type="text" id="memName" name="memName"
															autofocus required />
													</div>
													<div class="mb-4 col-md-6">
														<label for="account" class="form-label">계좌번호</label>
														<div style="display: flex; gap: 10px;">
															<select class="form-select" style="flex: 1;" name="bankName">
																<option value="">선택</option>
																<option value="">국민</option>
																<option value="신한">신한</option>
																<option value="">우리</option>
															</select> <input class="form-control" type="text"
																name="account" id="account"
																placeholder="계좌번호 입력" style="flex: 3;" required />
														</div>
													</div>
													<div class="mb-4 col-md-6">
														<label for="memNo" class="form-label">사번</label>
														<input class="form-control" type="text" id="memNo" name="memNo" value="${ memNo }" readonly />
													</div>
													<div class="mb-4 col-md-6">
														<label for="deptCode" class="form-label">부서</label> <select
															id="deptCode" class="select form-select" name="deptCode">
															<option value="">선택</option>
															<option value="S1">영업총괄</option>
															<option value="S2">인사</option>
															<option value="S3">지원</option>
															<option value="T1">남성의류</option>
															<option value="T2">여성의류</option>
															<option value="T3">식품</option>
															<option value="T4">스포츠</option>
															<option value="T5">뷰티</option>
															<option value="T6">명품</option>
															<option value="T7">문화센터</option>
															<option value="T8">디지털 및 가전</option>
														</select>
													</div>
													<div class="mb-4 col-md-6">
														<label class="form-label" for="memPwd">비밀번호</label>
														<div class="input-group input-group-merge">
															<input type="text" id="memPwd" name="memPwd"
																class="form-control" />
														</div>
													</div>
													<div class="mb-4 col-md-6">
														<label for="posCode" class="form-label">직급</label> <select
															id="posCode" class="select form-select" name="posCode">
															<option value="">선택</option>
															<option value="C1">점장</option>
															<option value="C2">부점장</option>
															<option value="C3">부장</option>
															<option value="C4">팀장</option>
															<option value="C5">대리</option>
															<option value="C6">주임</option>
															<option value="C7">사원</option>
														</select>
													</div>
													<div class="mb-4 col-md-6">
														<label for="email" class="form-label">Email</label> <input
															class="form-control" type="text" id="email" name="email" required />
													</div>
													<div class="mb-4 col-md-6">
														<label for="salary" class="form-label">급여</label> <input
															type="text" class="form-control" id="salary"
															name="salary" required  />
													</div>
													<div class="mb-4 col-md-6">
														<label class="hireDate" for="country">입사날짜</label> <input
															class="form-control" type="date" id="hireDate" name="hireDate"
															placeholder="YYYY/MM/DD"  required />
													</div>
													<div class="mb-4 col-md-6">
														<label for="language" class="form-label">주소</label> <input
															class="form-control" type="text" id="address" name="address"
															placeholder="Address"  required />
													</div>
													<div class="mb-4 col-md-6">
														<label for="memSSN" class="form-label">주민등록번호</label> <input
															class="form-control" type="text" id="memSSN" name="memSSN"
															placeholder="000000-0000000"  required pattern="^\d{6}-\d{7}$"/>
													</div>
													<div class="mb-4 col-md-6">
														<label for="phone" class="form-label">전화번호</label> <input
															class="form-control" type="text" id="phone" name="phone"
															placeholder="010-1111-2222" required pattern="^\d{3}-\d{4}-\d{4}$"/>
													</div>
												</div>
												<div class="mt-2" style="justify-self: center;">
													<button type="submit" class="btn btn-primary me-3">등록하기</button>
													<button type="reset" class="btn btn-label-secondary">취소하기</button>
												</div>
											</form>
										</div>
										<!-- /Account -->
									</div>

								</div>
							</div>
						</div>

					
						

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





<!--  <script>
    $(document).ready(function() {
        $('#rank').select2();
        $('#positionrank').select2();
    });
</script>
-->
</body>
</html>