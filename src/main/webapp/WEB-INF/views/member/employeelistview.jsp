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
    
    
    
    
    
     <!-- Vendors CSS -->
    <link rel="stylesheet" href="../../assets/vendor/libs/node-waves/node-waves.css" />

    <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/@form-validation/form-validation.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/quill/typography.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="../../assets/vendor/libs/quill/editor.css" />

    <!-- Page CSS -->

    <link rel="stylesheet" href="../../assets/vendor/css/pages/app-ecommerce.css" />
    <link rel="stylesheet" href="../../assets/vendor/css/pages/page-faq.css" />
    
    
    
    
    
   
    
    
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

                      <li class="nav-item">
                        <a class="nav-link" href="#">
                          <i class="ti-sm ti ti-user-check me-1_5"></i> 직원 등록
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="#"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 직원 조회
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="#"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 출퇴근 기록관리
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="#"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 근무시간 조회
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="#"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 조직도 관리
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link active" href="#"
                          ><i class="ti-sm ti ti-users me-1_5"></i> 급여 지급
                        </a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link" href="#"
                          ><i class="ti-sm ti ti-money me-1_5"></i> 급여명세서 조회/발급
                        </a>
                      </li>

                    </ul>
                  </div>
                </div>
              </div>
              
              
             
              <div
                class="faq-header d-flex flex-column justify-content-center align-items-center " style="margin-bottom: 10px;">
                <img
                  src="${contextPath }/assets/img/pages/header.png"
                  class=""
                  alt="background image" style="width: 100%; height: 102px;"/>
                <div class="input-wrapper mt-4 input-group input-group-merge" style="position: relative; bottom: 84px;background: white; width: 52%;">
                  <span class="input-group-text" id="basic-addon1"><i class="ti ti-search"></i></span>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Search articles..."
                    aria-label="Search"
                    aria-describedby="basic-addon1" />
                </div>
              </div>
              <!--/상단 검색바-->

              <!--검색내용-->
              <div class="card" style="padding: 30px; padding: 30px;position: relative; bottom: 50px;">
                <h5 class="card-header">사원목록 </h5>
                <div class="table-responsive text-nowrap">
                  <table class="table" style="text-align: center;">
                    <thead>
                      <tr>
                        <th>사원명</th>
                        <th>부서</th>
                        <th>직급</th>
                        <th>이메일</th>
                        <th>&nbsp;</th>

                      </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td>
                          <span class="fw-medium">이예빈</span>
                        </td>

                        <td>인사팀</td>

                        <td>

                          <span class="fw-medium">대리</span>
                        </td>

                        
                        <td><span>shasha0326@naver.com</span></td>

                        <td><button class="badge bg-label-primary me-1" style="border: none;" type="button" href="">수정/삭제</button></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                <!-- 페이징바 , 클릭한 숫자에 클래스에 active 추가하기 -->
                <div class="card-body">
                  <div class="row" style="width: 100%; ">
                    <div style="display: flex; justify-content:center;"  >
                      
                      
                      <div class="demo-inline-spacing">
                        <!-- Basic Pagination -->
                        <nav aria-label="Page navigation">
                          <ul class="pagination">
                            <li class="page-item first">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevrons-left ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevron-left ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">1</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">2</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">3</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">4</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">5</a>
                            </li>
                            <li class="page-item next">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevron-right ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item last">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevrons-right ti-sm"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>
                        <!--/ Basic Pagination -->
                       
                      </div>
                    </div>
                  
                  </div>
                </div>
              </div>
            <!--/검색내용-->

            
    		
         
         
         
    
    
    
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