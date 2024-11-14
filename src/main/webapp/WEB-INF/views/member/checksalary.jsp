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

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 출근기록조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 근무시간조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여지급 </a></li>

										<li class="nav-item"><a class="nav-link active" href="#"><i
												class="ti-sm ti ti-money me-1_5"></i> 급여내역확인 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 조직도 </a></li>

                    </ul>
                  </div>
                </div>
              </div>







              <div class="card" style=" padding: 30px;">
                <div class="d-flex">
                  <h5 class="card-header" style="width: 15%;">급여 확인</h5>


                  <div style="display: flex;">
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
                  </div>


                  <div style="width: 75%; align-items: center; justify-content: right;" class="d-flex">

                  </div>

                </div>
                <div class="table-responsive text-nowrap">
                  <table class="table" style="text-align: center;">
                    
                      <tr>
                        <th rowspan="2">사번</th>
                        <th rowspan="2">사원명</th>
                        <th rowspan="2">부서</th>
                        <th rowspan="2">직급</th>
                        <th colspan="3" style="text-align: center;">급여상세</th>
                        <th colspan="4" style="text-align: center;">공제항목</th>
                        <th rowspan="2">지급예정금액</th>
                        <th rowspan="2">지급날짜</th>
                        <th rowspan="2">&nbsp;</th> <!-- 급여명세서 다운 넣을 자리-->

                      </tr>
                      <tr>
                        <th>기본급</th>
                        <th>상여금</th>
                        <th>야근수당</th>
                        <th>국민연금</th>
                        <th>건강보험</th>
                        <th>고용보험</th>
                        <th>장기요양</th>

                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
 
                        <!-- 사번자리 -->
                        <td>
                          <span>2024001</span>
                        </td>
                        <!-- 사원명 -->
                        <td>
                          도존
                        </td>
                        <!-- 부서명 -->
                        <td>
                          인사팀
                        </td>
                        <!-- 직급명 -->
                        <td>
                          대리
                        </td>
                        <!-- 기본급 -->
                        <td>
                          2000000
                        </td>
                        <!-- 상여금 -->
                        <td>
                          1231230
                        </td>
                        <!-- 야근수당 -->
                        <td>
                          0
                        </td>
                        <!-- 국민연금 -->
                        <td>
                          30495
                        </td>
                        <!-- 건강보험 -->
                        <td>
                          42200
                        </td>
                        <!-- 고용보험 -->
                        <td>
                          5000
                        </td>
                        <!-- 장기요양 -->
                        <td>
                          12000
                        </td>
                        <!-- 지급예정금액 -->
                        <td>
                          200000000
                        </td>
                        <!-- 지급날짜 -->
                        <td>
                          2024-11-12                          
                        </td>
                        <td>
                          <!-- 파일 아이콘 -->
                          <img src="file-icon.png" alt="파일 아이콘" style="width: 24px; height: 24px; cursor: pointer;" onclick="openFormModal()">

                          <!-- 모달 구조 -->
                          <div id="formModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5);">
                            <div style="position: relative; width: 80%; max-width: 600px; margin: auto; top: 10%; background: white; padding: 20px; border-radius: 8px;">
                              <button onclick="closeFormModal()" style="position: absolute; top: 10px; right: 10px;">닫기</button>
                              <div id="formContent"></div>
                            </div>
                          </div>

                        </td>
                      </tr>


                      <tr>

                        <!-- 사번자리 -->
                        <td>
                          <span>2024001</span>
                        </td>
                        <!-- 사원명 -->
                        <td>
                          도존
                        </td>
                        <!-- 부서명 -->
                        <td>
                          인사팀
                        </td>
                        <!-- 직급명 -->
                        <td>
                          대리
                        </td>
                        <!-- 기본급 -->
                        <td>
                          2000000
                        </td>
                        <!-- 상여금 -->
                        <td>
                          1231230
                        </td>
                        <!-- 야근수당 -->
                        <td>
                          hello world
                        </td>
                        <!-- 국민연금 -->
                        <td>
                          30495
                        </td>
                        <!-- 건강보험 -->
                        <td>
                          42200
                        </td>
                        <!-- 고용보험 -->
                        <td>
                          5000
                        </td>
                        <!-- 장기요양 -->
                        <td>
                          12000
                        </td>
                        <!-- 지급예정금액 -->
                        <td>
                          200000000
                        </td>
                        <!-- 지급날짜 -->
                        <td>
                          2024-11-12                          
                        </td>
                        
                      </tr>


                      <tr>

                        <!-- 사번자리 -->
                        <td>
                          <span>2024001</span>
                        </td>
                        <!-- 사원명 -->
                        <td>
                          도존
                        </td>
                        <!-- 부서명 -->
                        <td>
                          인사팀
                        </td>
                        <!-- 직급명 -->
                        <td>
                          대리
                        </td>
                        <!-- 기본급 -->
                        <td>
                          2000000
                        </td>
                        <!-- 상여금 -->
                        <td>
                          1231230
                        </td>
                        <!-- 야근수당 -->
                        <td>

                        </td>
                        <!-- 국민연금 -->
                        <td>
                          30495
                        </td>
                        <!-- 건강보험 -->
                        <td>
                          42200
                        </td>
                        <!-- 고용보험 -->
                        <td>
                          5000
                        </td>
                        <!-- 장기요양 -->
                        <td>
                          12000
                        </td>
                        <!-- 지급예정금액 -->
                        <td>
                          200000000
                        </td>
                        <!-- 지급날짜 -->
                        <td>
                          2024-11-12                          
                        </td>

                      </tr>


                      <tr>

                        <!-- 사번자리 -->
                        <td>
                          <span>2024001</span>
                        </td>
                        <!-- 사원명 -->
                        <td>
                          도존
                        </td>
                        <!-- 부서명 -->
                        <td>
                          인사팀
                        </td>
                        <!-- 직급명 -->
                        <td>
                          대리
                        </td>
                        <!-- 기본급 -->
                        <td>
                          2000000
                        </td>
                        <!-- 상여금 -->
                        <td>
                          1231230
                        </td>
                        <!-- 야근수당 -->
                        <td>

                        </td>
                        <!-- 국민연금 -->
                        <td>
                          30495
                        </td>
                        <!-- 건강보험 -->
                        <td>
                          42200
                        </td>
                        <!-- 고용보험 -->
                        <td>
                          5000
                        </td>
                        <!-- 장기요양 -->
                        <td>
                          12000
                        </td>
                        <!-- 지급예정금액 -->
                        <td>
                          200000000
                        </td>
                        <!-- 지급날짜 -->
                        <td>

                        </td>

                      </tr>

            

                    </tbody>
                  </table>
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
   
   
   
   
   
</body>
</html>