<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="${contextPath}/assets/"
  data-template="views"
  data-style="light">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/assets/js/config.js"></script>
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
         <!-- nav 끝 -->
         
         <div class="content-wrapper">
            <!-- 세션 시작 -->
            <div class="container-xxl flex-grow-1 container-p-y">
               <!-- 이쪽에 세션정보 넣어야합니다 ----------------------------------------------------------------------- -->
               
               <!-- Content wrapper -->
               <div class="content-wrapper">
                  <div class="container-xxl flex-grow-1 container-p-y">
                     <div class="container card" style="padding: 50px;">
                        <form action="${contextPath}/board/boardRegist.do" method="post" enctype="multipart/form-data">
                           <div style="align-items: center;">
                              <div>
                                 <span style="font-size: 24px;">팀게시판 작성</span><br><br><br>
                                 <label for="defaultFormControlInput" class="form-label">제목</label>
                                 <input type="text" class="form-control" id="defaultFormControlInput" name="title" placeholder="제목을 입력하세요."/>
                                 <br>
                                 <label for="formFile" class="form-label">첨부파일</label>
                                 <input class="form-control" type="file" id="formFile" name="file" multiple/>
                                 <br>
                                 <div id="file-container" style="margin-top: 10px;"></div>
                                 <br>
                                 <textarea id="full-editor" name="content" class="form-control" rows="10" placeholder="내용을 입력하세요."></textarea>
                                 <br>
                                 <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <button id="back" class="btn btn-secondary" type="button" onclick="window.history.back();">취소</button>
                                    <button id="registerButton" class="btn btn-primary">작성</button>
                                 </div>                                        
                              </div>             
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
               
               <script>
                  document.addEventListener('DOMContentLoaded', function() {
                     const fileInput = document.getElementById('formFile');
                     const fileContainer = document.getElementById('file-container');
                     let files = [];

                     fileInput.addEventListener('change', function(event) {
                        files = Array.from(event.target.files);
                        renderFiles();
                     });

                     function renderFiles() {
                        fileContainer.innerHTML = ''; // 기존 내용을 초기화

                        files.forEach((file, index) => {
                           const fileType = file.type;
                           const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                           const fileDiv = document.createElement('div');
                           fileDiv.style.position = 'relative';
                           fileDiv.style.display = 'inline-block';
                           fileDiv.style.margin = '10px';
                           fileDiv.setAttribute('data-index', index);

                           if (validImageTypes.includes(fileType)) {
                              const reader = new FileReader();
                              reader.onload = function(e) {
                                 const img = document.createElement('img');
                                 img.src = e.target.result;
                                 img.style.maxWidth = '200px';
                                 img.style.height = 'auto';
                                 fileDiv.appendChild(img);
                              };
                              reader.readAsDataURL(file);
                           } else {
                              const p = document.createElement('p');
                              p.textContent = file.name;
                              fileDiv.appendChild(p);
                           }

                           const removeButton = document.createElement('button');
                           removeButton.innerHTML = '&#10005;';
                           removeButton.style.position = 'absolute';
                           removeButton.style.top = '-20px';
                           removeButton.style.right = '-5px';
                           removeButton.style.background = 'none';
                           removeButton.style.border = 'none';
                           removeButton.style.fontSize = '20px';
                           removeButton.style.cursor = 'pointer';
                           removeButton.onclick = function() {
                              files.splice(index, 1);
                              renderFiles();
                              fileInput.files = new FileListItem(...files);
                           };

                           fileDiv.appendChild(removeButton);
                           fileContainer.appendChild(fileDiv);
                        });
                     }

                     // Helper function to create a new FileList
                     function FileListItem() {
                        const b = new DataTransfer();
                        files.forEach(file => b.items.add(file));
                        return b.files;
                     }
                  });

                  function removeFile() {
                     document.getElementById('formFile').value = '';
                     document.getElementById('file-container').innerHTML = '';
                  }
               </script>
            </div>
            <!-- 세션 끝 -->
            
            <!-- 푸터 시작 -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <!-- 푸터 끝 -->
            
            <div class="content-backdrop fade"></div>
         </div>
      </div>
      
      <div class="layout-overlay layout-menu-toggle"></div>
      <div class="drag-target"></div>
      
   </div>
</div>
</body>
</html>
