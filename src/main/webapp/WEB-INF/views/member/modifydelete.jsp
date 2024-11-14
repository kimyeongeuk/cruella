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
                          <div class="card-body">
                            <div style="text-align: center;">
                              <img
                                src="${ contextPath }/assets/img/avatars/1.png"
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
                                <button type="button" class="btn btn-label-secondary account-image-reset mb-4">
                                  <i class="ti ti-refresh-dot d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">Reset</span>
                                </button>
      
                              </div>
                            </div>
                          </div>
                          <h5 class="pb-4 border-bottom mb-4"></h5>
                          <div class="card-body pt-4">
                            <form id="formAccountSettings" method="GET" onsubmit="return false">
                              <div class="row">
                                <div class="mb-4 col-md-6">
                                  <label for="name" class="form-label">이름</label>
                                  <input
                                    class="form-control"
                                    type="text"
                                    id="name"
                                    name="name"
                                    placeholder="수정가능"
                                 />
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="accountNumber" class="form-label">계좌번호</label>
                                  <div style="display: flex; gap: 10px;">
                                      <select class="form-select" style="flex: 1;">
                                          <option value="">선택</option>
                                          <option value="">국민</option>
                                          <option value="">신한</option>
                                          <option value="">우리</option>
                                      </select>
                                      <input class="form-control" type="text" name="accountNumber" id="accountNumber" placeholder="수정가능" style="flex: 3;" />
                                  </div>
                              </div>
                                <div class="mb-4 col-md-6">
                                  <label for="employeeNumber" class="form-label">사번</label>
                                  <input
                                    class="form-control"
                                    type="text"
                                    id="employeeNumber"
                                    name="employeeNumber" 
                                    placeholder="수정불가능"
                                    readonly/>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="rank" class="form-label">부서</label>
                                  <select id="rank" class="select2 form-select">
                                    <option value="">인사</option>
                                    <option value="">영업총괄</option>
                                    <option value="">지원</option>
                                    <option value="">남성의류</option>
                                    <option value="">여성의류</option>
                                    <option value="">식품</option>
                                    <option value="">스포츠</option>
                                    <option value="">뷰티</option>
                                    <option value="">명품</option>
                                    <option value="">문화센터</option>
                                    <option value="">디지털 및 가전</option>
                                  </select>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label class="form-label" for="password">비밀번호</label>
                                  <div class="input-group input-group-merge">
                                    <input
                                      type="text"
                                      id="password"
                                      name="password"
                                      class="form-control"
                                      placeholder="수정불가능"
                                      readonly />
                                  </div>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="positionrank" class="form-label">직급</label>
                                  <select id="positionrank" class="select2 form-select">
                                    <option value="">선택</option>
                                    <option value="">점장</option>
                                    <option value="">부점장</option>
                                    <option value="">부장</option>
                                    <option value="">대리</option>
                                    <option value="">주임</option>
                                    <option value="">사원</option>
                                    <option value="">매장매니저</option>
                                  </select>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="email" class="form-label">Email</label>
                                  <input class="form-control" type="text" id="email" name="email" placeholder="수정불가능" readonly/>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="salary" class="form-label">급여</label>
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="salary"
                                    name="salary" 
                                    value="수정가능"/>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label class="joiningDate" for="country">입사날짜</label>
                                  <input class="form-control" type="text" id="joinDate" name="joinDate" placeholder="수정불가능" readonly/>
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="language" class="form-label">주소</label>
                                  <input class="form-control" type="text" id="address" name="address" placeholder="수정불가능" readonly />
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="timeZones" class="form-label">주민등록번호</label>
                                  <input class="form-control" type="text" id="idNo" name="idNo" placeholder="수정불가능" readonly />
                                </div>
                                <div class="mb-4 col-md-6">
                                  <label for="currency" class="form-label">전화번호</label>
                                  <input class="form-control" type="text" id="phone" name="phone" placeholder="수정불가능" readonly />
                                </div>
                              </div>
                              <div class="mt-2" style="justify-self: center;">
                                <button type="submit" class="btn btn-primary me-3">수정하기</button>
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">
                                    퇴사처리
                                  </button>
                              </div>
                            </form>
                          </div>
                          <!-- /Account -->
                        </div>
      
                      </div>
                    </div>
    
    
    
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
   
   
   
   
   <script>
    $(document).ready(function() {
        $('#rank').select2();
        $('#positionrank').select2();
    });
</script>
</body>
</html>