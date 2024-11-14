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
        <div class="container-xxl flex-grow-1 container-p-y">
          <div class="container card" style="padding: 50px;">
            <div style="align-items: center;">
              <div>
                <span style="font-size: 24px;">팀게시판 수정</span><br><br><br>
                <label for="defaultFormControlInput" class="form-label">제목</label>
                <input
                  type="text"
                  class="form-control"
                  id="defaultFormControlInput"
                  placeholder="제목을 입력하세요."
                  value="팀게시판 제목입니다."/>
                <br>
                <label for="formFile" class="form-label">첨부파일</label>
                <input class="form-control" type="file" id="formFile" />
                <br>
                <div id="file-container" style="margin-top: 10px;"></div> <!-- 파일을 표시할 컨테이너를 파일 폼 바로 아래에 배치 -->
                <br>
                <div id="full-editor">
                  팀게시판 내용입니다.
                </div> 
                <br>     
                <div style="display: flex; justify-content: space-between; align-items: center;">
                  <button id="back" class="btn btn-secondary">취소</button>
                  <button id="registerButton" class="btn btn-primary">수정</button>
                </div>                                        
              </div>             
            </div>
          </div>           
        </div>
      </div>
      
      <script>
        document.getElementById('formFile').addEventListener('change', function(event) {
          const file = event.target.files[0];
          if (file) {
            const fileType = file.type;
            const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];
      
            const fileContainer = document.getElementById('file-container');
            if (validImageTypes.includes(fileType)) {
              const reader = new FileReader();
      
              reader.onload = function(e) {
                fileContainer.innerHTML = `
                  <div style="position: relative; display: inline-block;">
                    <img src="${e.target.result}" style="max-width: 200px; height: auto;" /> <!-- 이미지 크기를 작게 조정 -->
                    <button 
                      onclick="removeFile()" 
                      style="position: absolute; top: 5px; right: 5px; background: none; border: none; font-size: 20px; cursor: pointer;">
                      &#10005; <!-- 검정색 'X' 버튼 -->
                    </button>
                  </div>
                `;
              }
      
              reader.readAsDataURL(file);
            } else {
              fileContainer.innerHTML = `
                <div style="position: relative; display: inline-block;">
                  <p>${file.name}</p>
                  <button 
                    onclick="removeFile()" 
                    style="background: none; border: none; font-size: 20px; cursor: pointer;">
                    &#10005; <!-- 검정색 'X' 버튼 -->
                  </button>
                </div>
              `;
            }
          } else {
            console.log("No file selected");
          }
        });
      
        function removeFile() {
          document.getElementById('formFile').value = '';  // 파일 첨부 필드에서 파일 제거
          document.getElementById('file-container').innerHTML = '';  // 파일 컨테이너 비우기
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