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
			    <div class="container card py-5">
			      <div class="d-flex align-items-center">
			        <div>
							  <span class="fs-4">팀게시판</span>
							  <span class="text-primary ms-4">
							    <c:choose>
							      <c:when test="${loginUser.deptCode eq 'S1'}">
							        영업총괄팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'S2'}">
							        인사팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'S3'}">
							        지원팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T1'}">
							        남성의류팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T2'}">
							        여성의류팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T3'}">
							        식품팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T4'}">
							        스포츠팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T5'}">
							        뷰티팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T6'}">
							        명품팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T7'}">
							        문화센터팀
							      </c:when>
							      <c:when test="${loginUser.deptCode eq 'T8'}">
							        디지털 및 가전팀
							      </c:when>
							      <c:otherwise>
							        기타부서팀
							      </c:otherwise>
							    </c:choose>
							  </span>
							</div>
  
			        <div class="ms-5">
			          <button id="create" class="btn btn-primary" style="width: 100px;" onclick="regist();">+ 글작성</button>	          
			          <i class="menu-icon tf-icons ti ti-trash ms-2"></i>
			        </div>

			        <div class="ms-auto d-flex">
			          <input type="text" class="form-control" id="noticeSearch" placeholder="검색어 입력" style="width: 260px;" />
			          <button id="searchBtn" class="btn btn-primary ms-2" style="width: 90px;">+ 검색</button>
			        </div>
			      </div>
			
			      <div class="card-datatable table-responsive pt-3">
			        <table class="datatables-basic table text-center">
			          <thead>
			            <tr>
			              <th style="width: 5%;"><input type="checkbox" /></th>
			              <th style="width: 15%;">카테고리</th>
			              <th style="width: 15%;">작성자</th>
			              <th style="width: 40%;">제목</th>
			              <th style="width: 15%;">작성일</th>
			              <th style="width: 10%;">조회수</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<c:choose>
			          		<c:when test="${ empty list }">
			          			<tr>
			          				<td colspan="6">조회된 게시글이 없습니다.</td>
			          			</tr>
			          		</c:when>
			          		<c:otherwise>
			          			<c:forEach var="board" items="${list}">
											  <tr onclick='location.href = "${contextPath}/board/${loginUser.memNo eq board.memNo ? "boardDetail.do" : "increase.do"}?no=${board.boardNo}";'>
											    <td><input type="checkbox" /></td>
											    <td>공지</td>
											    <td>${board.memName}</td>
											    <td>${board.boardTitle}</td>
											    <td>${board.boardRegistDT}</td>
											    <td>${board.boardCount}</td>
											  </tr>
											</c:forEach>
			          		</c:otherwise>
			          	</c:choose>
			          </tbody>
			        </table>
			
						  <!-- 페이징 바 -->
						  <div class="card-body">
						    <div class="row">
						      <span class="col-lg-12 d-flex justify-content-center">
						        <div class="demo-inline-spacing">
						          <nav aria-label="Page navigation">
						            <ul class="pagination">
						              <li class="page-item first">
						                <a class="page-link" href="javascript:void(0);" onclick="goToPage(1);">
						                  <i class="ti ti-chevrons-left ti-sm"></i>
						                </a>
						              </li>
						              <li class="page-item prev ${pi.currentPage == 1 ? 'disabled' : ''}">
						                <a class="page-link" href="javascript:void(0);" onclick="goToPage(${pi.currentPage - 1});">
						                  <i class="ti ti-chevron-left ti-sm"></i>
						                </a>
						              </li>
						              <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
						                <li class="page-item ${i == pi.currentPage ? 'active' : ''}">
						                  <a class="page-link" href="javascript:void(0);" onclick="goToPage(${i});">${i}</a>
						                </li>
						              </c:forEach>
						              <li class="page-item next ${pi.currentPage == pi.maxPage ? 'disabled' : ''}">
						                <a class="page-link" href="javascript:void(0);" onclick="goToPage(${pi.currentPage + 1});">
						                  <i class="ti ti-chevron-right ti-sm"></i>
						                </a>
						              </li>
						              <li class="page-item last">
						                <a class="page-link" href="javascript:void(0);" onclick="goToPage(${pi.maxPage});">
						                  <i class="ti ti-chevrons-right ti-sm"></i>
						                </a>
						              </li>
						            </ul>
						          </nav>
						        </div>
						      </span>
						    </div>
						  </div>
						
						  <script>
						    function goToPage(pageNumber) {
						    	//console.log(pageNumber);
						    	
						      window.location.href = `${contextPath}/board/boardList.do?page=` + pageNumber;
						    }
						    
						  </script>
						  
						  <!-- /페이징 바 -->

			        
			      </div>
			    </div>
			  </div>
			</div>
			
			<script>
			  function regist() {
			    window.location.href = "${contextPath}/board/boardRegist.do";
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