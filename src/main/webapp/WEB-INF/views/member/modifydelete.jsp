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
     <!-- 이쪽에 세션정보 넣어야합니다 -->
    
              <div class="row">
                <div class="col-md-12">
                  <div class="nav-align-top">
                    <ul class="nav nav-pills flex-column flex-sm-row mb-6 gap-2 gap-lg-0">

										<li class="nav-item"><a class="nav-link" href="#"> <i
												class="ti-sm ti ti-user-check me-1_5"></i> 직원등록</a></li>

										<li class="nav-item"><a class="nav-link active" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 출근기록조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 근무시간조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여지급 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-money me-1_5"></i> 급여내역확인 </a></li>

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

										<form id="formAccountSettings"
											action="${ contextPath }/member/updateMember.do"
											method="post" enctype="multipart/form-data">
											<div class="card-body">
												<div style="text-align: center;">
													<c:choose>
														<c:when test="${not empty member.profileURL}">
															<img src="${ contextPath }<c:out value='${member.profileURL}'/>"
																alt="user-avatar"
																class="d-block w-px-140 h-px-140 rounded mx-auto"
																id="uploadedAvatar"
																style="margin-bottom: 20px; align-items: center;"
																height="120px" />
														</c:when>
														<c:otherwise>
															<img
																src="<c:out value='${contextPath}/assets/img/avatars/1.png'/>"
																alt="user-avatar"
																class="d-block w-px-140 h-px-140 rounded mx-auto"
																id="uploadedAvatar"
																style="margin-bottom: 20px; align-items: center;"
																height="120px" />
														</c:otherwise>
													</c:choose>

													<div class="button-wrapper">
														<label for="upload" class="btn btn-primary me-3 mb-4"
															tabindex="0"> <span class="d-none d-sm-block">첨부파일
																업로드</span> <i class="ti ti-upload d-block d-sm-none"></i> <input
															type="file" id="upload" class="account-file-input" hidden
															accept="image/png, image/jpg" name="uploadFile" />
														</label>
														<button type="button"
															class="btn btn-label-secondary account-image-reset mb-4">
															<i class="ti ti-refresh-dot d-block d-sm-none"></i> <span
																class="d-none d-sm-block">Reset</span>
														</button>

													</div>
												</div>
											</div>
											<h5 class="pb-4 border-bottom mb-4"></h5>
											<div class="card-body pt-4">
												<div class="row">
													<div class="mb-4 col-md-6">
														<label for="memName" class="form-label">이름</label> <input
															class="form-control" type="text" id="memName"
															name="memName" value="${ member.memName }" />
													</div>
													<div class="mb-4 col-md-6">
														<label for="account" class="form-label">계좌번호</label>
														<div style="display: flex; gap: 10px;">
															<select class="form-select" style="flex: 1;">
																<option value="">선택</option>
																<option value="">국민</option>
																<option value="신한"
																	${ member.bankName == '신한' ? 'selected' : '' }>신한</option>
																<option value="">우리</option>
															</select> <input class="form-control" type="text" name="account"
																id="account" value="${ member.account }"
																style="flex: 3;" />
														</div>
													</div>
													<div class="mb-4 col-md-6">
														<label for="memNo" class="form-label">사번</label> <input
															class="form-control" type="text" id="memNo" name="memNo"
															value="${ member.memNo }" readonly />
													</div>
													<div class="mb-4 col-md-6">
														<label for="deptCode" class="form-label">부서</label> <select
															id="deptCode" name="deptCode" class="select form-select">
															<option value="">선택</option>
															<option value="S1"
																${member.deptCode == 'S1' ? 'selected' : ''}>영업총괄</option>
															<option value="S2"
																${member.deptCode == 'S2' ? 'selected' : ''}>인사</option>
															<option value="S3"
																${member.deptCode == 'S3' ? 'selected' : ''}>지원</option>
															<option value="T1"
																${member.deptCode == 'T1' ? 'selected' : ''}>남성의류</option>
															<option value="T2"
																${member.deptCode == 'T2' ? 'selected' : ''}>여성의류</option>
															<option value="T3"
																${member.deptCode == 'T3' ? 'selected' : ''}>식품</option>
															<option value="T4"
																${member.deptCode == 'T4' ? 'selected' : ''}>스포츠</option>
															<option value="T5"
																${member.deptCode == 'T5' ? 'selected' : ''}>뷰티</option>
															<option value="T6"
																${member.deptCode == 'T6' ? 'selected' : ''}>명품</option>
															<option value="T7"
																${member.deptCode == 'T7' ? 'selected' : ''}>문화센터</option>
															<option value="T8"
																${member.deptCode == 'T8' ? 'selected' : ''}>디지털
																및 가전</option>
														</select>
													</div>
													<div class="mb-4 col-md-6">
														<label class="form-label" for="memPwd">비밀번호</label>
														<div class="input-group input-group-merge">
															<input type="text" id="memPwd" name="memPwd"
																class="form-control" value="****" readonly />
														</div>
													</div>
													<div class="mb-4 col-md-6">
														<label for="posCode" class="form-label">직급</label> <select
															id="posCode" name="posCode" class="select form-select">
															<option value="">선택</option>
															<option value="C1"
																${member.posCode == 'C1' ? 'selected' : ''}>점장</option>
															<option value="C2"
																${member.posCode == 'C2' ? 'selected' : ''}>부점장</option>
															<option value="C3"
																${member.posCode == 'C3' ? 'selected' : ''}>부장</option>
															<option value="C4"
																${member.posCode == 'C4' ? 'selected' : ''}>팀장</option>
															<option value="C5"
																${member.posCode == 'C5' ? 'selected' : ''}>대리</option>
															<option value="C6"
																${member.posCode == 'STAFF' ? 'C6' : ''}>주임</option>
															<option value="C7"
																${member.posCode == 'C7' ? 'selected' : ''}>사원</option>
														</select>

													</div>
													<div class="mb-4 col-md-6">
														<label for="email" class="form-label">Email</label> <input
															class="form-control" type="text" id="email" name="email"
															value="${ member.email }" />
													</div>
													<div class="mb-4 col-md-6">
														<label for="salary" class="form-label">급여</label> <input
															type="text" class="form-control" id="salary"
															name="salary" value="${ member.salary }" />
													</div>
													<div class="mb-4 col-md-6">
														<label class="hireDate" for="country">입사날짜</label> <input
															class="form-control" type="date" id="hireDate"
															name="hireDate" value="${ member.hireDate }" readonly />
													</div>
													<div class="mb-4 col-md-6">
														<label for="language" class="form-label">주소</label> <input
															class="form-control" type="text" id="address"
															name="address" value="${ member.address }" />
													</div>
													<div class="mb-4 col-md-6">
														<label for="memSSN" class="form-label">주민등록번호</label> <input
															class="form-control" type="text" id="memSSN"
															name="memSSN" value="${ member.memSSN }" readonly />
													</div>
													<div class="mb-4 col-md-6">
														<label for="phone" class="form-label">전화번호</label> <input
															class="form-control" type="text" id="phone" name="phone"
															value="${ member.phone }" />
													</div>
												</div>
												<div class="mt-2" style="justify-self: center;">
													<button type="submit" class="btn btn-primary me-3">수정하기</button>
													<button type="button" class="btn btn-danger"
														data-bs-toggle="modal" data-bs-target="#myModal">
														퇴사처리</button>
												</div>
										</form>
									</div>
									<!-- /Account -->
								</div>

							</div>
							</div>
						</div>
						<!-- 세션 끝 -->
                  <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header" >
                          <h4 class="modal-title" style="text-align: center; padding: 10px;">이 사원의 퇴사 처리를 진행하시겠습니까?</h4>
                          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                  
                        <!-- Modal body -->
												<div style="text-align: center; padding: 10px;">
												    <i class="ti ti-alert-circle" style="font-size: 48px; color: red; margin-bottom: 10px;"></i>
												    <p><strong>퇴사 처리 대상:</strong></p>
												    <p>사원명: ${ member.memName }</p>
												    <p>부서: ${ member.deptName }</p>
												    <p>직급: ${ member.posName }</p>
												    <p style="color: red; font-weight: bold;">퇴사 처리 후 모든 데이터가 삭제되며, 이 작업은 되돌릴 수 없습니다.</p>
												    <p>정말로 진행하시겠습니까?</p>
												</div>

                  
                        <!-- Modal footer -->
                        <div class="modal-footer" style="justify-self: center;">
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">예</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                          </div>
                  
                      </div>
                    </div>
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
   
   
   	<script>
		$(document).ready(function() {
			$('#upload').on("change", function(evt) {
				const file = evt.target.files[0]; // 사용자가 선택한 파일
				console.log("실행");
				const memNo = $('#memNo').val();

				if (file) {
					// 선택된 파일 업로드전 미리보기
					const reader = new FileReader();
					reader.onload = function(r) {
						$('#uploadedAvatar').attr("src", r.target.result); // 이미지 변경
					};
					reader.readAsDataURL(file);

					let formData = new FormData();
					formData.append("uploadFile", file);
					formData.append("memNo", memNo);
				}

			})
		})
	</script>
   
</body>
</html>