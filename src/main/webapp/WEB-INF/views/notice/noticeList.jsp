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
     	<!-- 이쪽에 세션정보 넣어야합니다 ----------------------------------------------------------------------- -->
    	
    	<!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
          
          <div class="container card" style="padding: 50px;">
            <div style="display: flex; align-items: center;">
              <div>
                <span><span style="font-size: 24px;">공지사항</span>
                <span style="color: #7367F0; margin-left: 40px;">전체</span><span> / 인사관리팀</span></span>
              </div>
              <div  style="margin-left: 50px;">
                <button id="create" class="btn btn-primary" style="width: 100px;" onclick="regist();">+ 글작성</button>
                <i class="menu-icon tf-icons ti ti-trash" style="margin-left: 10px;"></i>
              </div>
              <div style="margin-left: auto;">
                <input type="text" class="form-control" id="noticeSearch" placeholder="검색어 입력" style="width: 260px;"/>
              </div>
              <div>
                <button id="searchBtn" class="btn btn-primary" style="width: 90px; margin-left: 10px;">+ 검색</button>
              </div>
            </div>
            
            <br>
            <div class="card-datatable table-responsive pt-0">

              <table class="datatables-basic table">
                <thead style="text-align: center;">
                  <tr>
                    <th style="width: 5%;"><input type="checkbox" name="" id=""></th>
                    <th style="width: 15%;">카테고리</th>
                    <th style="width: 15%;">작성자</th>
                    <th style="width: 40%;">제목</th>
                    <th style="width: 15%;">작성일</th>
                    <th style="width: 10%;">조회수</th>
                  </tr>
                </thead>
                <tbody style="text-align: center;">
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td style="color: #FF9F43;"><a href="${ contextPath }/notice/noticeDetail.do">공지사항 제목입니다.<i class="menu-icon tf-icons ti ti-file" style="margin-left: 10px;"></i></a></td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td style="color: #FF9F43;">공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td style="color: #FF9F43;">공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="" id=""></td>
                    <td>공지</td>
                    <td>관리자</td>
                    <td>공지사항 제목입니다.</td>
                    <td>2024.11.05</td>
                    <td>10</td>
                  </tr>
                </tbody>
              </table>
              
              <!-- 페이징바 , 클릭한 숫자에 클래스에 active 추가하기 -->
              <div class="card-body">
                <div class="row">
                  <span class="col-lg-12 d-flex justify-content-center">                    
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
                          <li class="page-item active">
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
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    	
    	<script>
			  function regist() {
			    window.location.href = "${contextPath}/notice/noticeRegist.do";
			  }
			</script>
    
    
    
    	<!-- 세션정보 끝 ---------------------------------------------------------------------------------------- -->
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