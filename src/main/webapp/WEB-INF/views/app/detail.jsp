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


        <!-- Session Start -->
        <div class="content-wrapper" style="height: 1500px;">
          <div class="container-xxl flex-grow-1 container-p-y">

            

            





            <!-- 양식영역 -->
            
             
                      <div style="display: flex; justify-content: right;">
                        <button type="button" class="btn btn-success">결재</button>
                        <span style="width: 52px;"></span>
                        <button type="button" class="btn btn-warning">반려</button>
                      </div>
                        


                <div class="col-12" style="margin-top: 20px;">
                  <div class="card mb-6">


                    <style>
                      * {
                        padding: 0px;
                        margin: 0px;
                        box-sizing: border-box;
                      }

                      .app_type {
                        width: 298px;
                        height: 100px;
                        text-align: center;
                        font-size: 30px;
                        font-weight: 800;
                        border: 1px solid black;
                      }

                      .app_line_div {
                        display: flex;
                        justify-content: right;
                        border: 1px solid black;
                        padding-bottom: 2px;


                      }

                      .line_title {
                        position: relative;
                        writing-mode: vertical-rl;
                        height: 147px;
                        text-align: center;
                        border: 1px solid black;

                      }

                      .line_user {

                        display: flex;
                        flex-direction: column;
                        text-align: center;
                        width: 100px;

                      }

                      .line_user span {
                        border: 1px solid black;
                      }

                      .signLine {
                        height: 102px;
                        display: flex;
                        justify-content: center;
                        align-items: center;

                      }

                      .line_div {
                        width: 600px;
                      }

                      .app_table_container {
                        border-spacing: 0;
                        height: 40px;
                      }

                      .dept_td,
                      .app_date,
                      .app_no,
                      .app_title_td {
                        width: 110px;
                        border: 1px solid black;
                      }

                      .dept_td_result,
                      .app_date_result {
                        width: 188px;
                        border: 1px solid black;
                      }

                      .app_no_result {
                        width: 192px;
                        border: 1px solid black;
                      }

                      .app_result_div {
                        text-align: center;
                      }

                      .app_title {
                        border: 1px solid black;
                      }

                      .sign_date {
                        height: 23px;
                      }
                    </style>
                    
                    



                    <table class="app_table_container">
                      <thead>
                        <tr>
                          <td class="app_type">
                          	<span id="form_type_result">
                          		<c:choose>
                          			<c:when test="${app.docType eq '기안서' }">
                          				기&nbsp;&nbsp;안&nbsp;&nbsp;서
                          			</c:when>
                          			<c:when test="${app.docType eq '품의서' }">
                          				품&nbsp;&nbsp;의&nbsp;&nbsp;서
                          			</c:when>
                          			<c:when test="${app.docType eq '연차신청서' }">
                          				연&nbsp;&nbsp;차&nbsp;&nbsp;신&nbsp;&nbsp;청&nbsp;&nbsp;서
                          			</c:when>
                          			<c:when test="${app.docType eq '증명서신청서' }">
                          				증&nbsp;&nbsp;명&nbsp;&nbsp;서&nbsp;&nbsp;신&nbsp;&nbsp;청&nbsp;&nbsp;서
                          			</c:when>
                          			<c:when test="${app.docType eq '지각사유서' }">
                          				지&nbsp;&nbsp;각&nbsp;&nbsp;/&nbsp;&nbsp;불&nbsp;&nbsp;참&nbsp;&nbsp;사유서
                          			</c:when>
                          			<c:when test="${app.docType eq '요청서' }">
                          				요&nbsp;&nbsp;청&nbsp;&nbsp;서
                          			</c:when>
                          		</c:choose>
                          	
                          	</span>
                          </td>
                          <td class="line_div">
                            <span class="app_line_div">

							
                              <span class="line_title"><b>결재선</b></span>
                              
                              <c:forEach var="a" items="${app.rovalList}">
                              <span class="line_user">
                                <span>${a.deptName}</span>
                                <span class="signLine">
                                  <img class="signImg_div" style="display:none;width: 100px; height: 100px;">
                                 <c:choose>
                                	<c:when test="${a.rvNo eq memNo}">
                                	
                                		<button type="button" class="signbtn_div btn btn-dark">서명</button>
                                		
                                	</c:when>
                                	<c:otherwise>
                                		서명
                                	</c:otherwise>
                                 </c:choose>
                                
                                </span>
                                <span class="sign_date">${a.memName}</span>
                              </span>
                              </c:forEach>


                            </span>
                          </td>
                        </tr>
                      </thead>
                    </table>

                    <!-- db 조회해서 담기 -->
                    <table class="app_table_container">
                      <tr class="app_result_div">
                        <td class="dept_td">기안부서</td>
                        <td class="dept_td_result">${app.deptName }</td>
                        <td class="app_date">직급</td>
                        <td class="app_date_result">${app.posName }</td>
                        <td class="app_no">기안일</td>
                        <td class="app_no_result">${app.docDt }</td>
                        
                 
                        
                        <%-- <!-- 타입, 기안자 사번 -->
                        <input type="hidden" name="docType" value="연차신청서">
                        <input type="hidden" name="memNo" value="${m.memNo}"> --%>
                        
                      </tr>
                    </table>
                   

                    <table style="border-spacing: 0;">
                      <tr>
                        <td class="app_title_td" style="text-align: center; height: 40px;">기안자</td>
                        <td class="app_title_result" style="width: 788px; border: 1px solid black; ">
                          <span style="position: relative; left: 10px;" id="userNo_value" ></span>
                          <span id="ref_list_div" style="position: relative; left: 8px;">${app.memName }</span>
                        </td>
                      </tr>
                    </table>
                    
                    
                    <c:if test="${app.docType eq '증명서신청서' }">
                    <!-- 증명서일때 -->
                    <table style="border-spacing: 0;">
                      <tr>
                        <td class="app_title_td" style="text-align: center; height: 40px;">발행날짜</td>
                        <td class="app_title_result" style="width: 788px; border: 1px solid black; ">

                          <span class="date-range" style="position: relative;left: 10px;">
                            
                          </span>
                        

                        </td>
                      </tr>
                    </table>
                    <!-- /증명서일때 -->
                    </c:if>
                    
                    
                    <c:if test="${app.docType eq '연차신청서' }">
                    <!-- 연차신청서일때 -->
                    <table style="border-spacing: 0;">
                      <tr>
                        <td class="app_title_td" style="text-align: center; height: 40px;">휴가종류</td>
                        <td class="app_title_result" style="width: 788px; border: 1px solid black; ">
                          <span style="position: relative; left: 10px;">연차</span>
                        </td>
                      </tr>
                    </table>
                    
                    
                    
                     <style>
                            .date-range {
                              display: flex;
                              align-items: center;
                            }

                            .start-date,
                            .end-date {
                              padding: 8px;
                              margin: 0 5px;
                              border: 1px solid #ccc;
                              border-radius: 4px;
                              font-size: 14px;
                            }

                            .date-separator {
                              font-size: 16px;
                              margin: 0 10px;
                            }

                            .date-difference {
                              font-size: 14px;
                              margin-left: 10px;
                            }

                            .date-difference b {
                              color: #e74c3c;
                            }
                          </style>
                    
                    
                     <table style="border-spacing: 0;">
                      <tr>
                        <td class="app_title_td" style="text-align: center; height: 40px;">기간 및 일시</td>
                        <td class="app_title_result" style="width: 788px; border: 1px solid black; ">
							<span style="position: relative; left: 12px;">
								${app.appDateStart } ~ ${app.appDateEnd }
							</span>
                          
                        </td>
                      </tr>
                    </table>
                    <!-- /연차신청서일때 -->
                    </c:if>
                    
                    
                    <table style="border-spacing: 0;">
                      <tr>
                        <td class="app_title_td" style="text-align: center; height: 40px;">제목</td>
                        <td class="app_title_result" style="width: 788px; border: 1px solid black;">
                          <span style="position: relative;left: 12px;">${app.docTitle }</span>
                            
                          <!-- 제목글자수 제한 조건을 걸거나 아니면 리스트 조회시 보이는 글자수 제한 걸기 -->
                        </td>
                      </tr>
                    </table>


                    <div style="border: 1px solid black;">
                      <div class="content-wrapper">
                        <div class="container-xxl flex-grow-1 container-p-y">
                          <div class="row">

                            <!-- Full Editor -->
                            <div class="col-12">
                              <div class="card">

                                <div class="card-body" style="height: 500px;">
		
									${app.docContent }


                                </div>
                              </div>
                            </div>
                            <!-- /Full Editor -->
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- file input -->
                    <div class="card" style="border: 1px solid; border-radius: 0;">
                      <h5 class="card-header"></h5>
                      <div class="card-body">
                        <div class="mb-4">
                        <!-- 파일 -->
                        
                        	<div>
                        	<c:forEach var="a" items="${app.attachList}">
                        		<a href="${contextPath}${a.filePath}/${a.filesystemName}"  download="${a.originalName}">
                        			${a.originalName}
                        		</a>
                        		<br>
                        	</c:forEach>
                        	</div>
                          
                        </div>

                      </div>
                    </div>
                    <!-- /file input -->
					<input type="hidden" name="docContent" id="docContentInput" />




          </div>
        </div>
        <!-- /session -->


        <!-- </div> -->
        <!-- /레이아웃 컨테이너 -->


        <!-- </div> -->


        <!-- </div> -->


<script>
	
$(document).ready(function(){
	
	  $('.signbtn_div').on('click', function(){
	        
	        
	      
	        const sign = '${loginUser.signPath}';
	       
	        $(this).closest('.line_user')
	             .find('.signImg_div')
	             .css('display', 'block') 
	             .attr('src', sign); 
	        
	        $(this).remove();
	    });
	
})
		

</script>

     






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