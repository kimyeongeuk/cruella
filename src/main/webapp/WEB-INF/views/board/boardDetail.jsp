<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
      dir="ltr" data-theme="theme-default" data-assets-path="${contextPath}/assets/" data-template="views"
      data-style="light">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/assets/js/config.js"></script>
<style>
  .icon-wrapper {
    position: relative;
  }
  .icon-wrapper .icon {
    border-radius: 50%;
    padding: 10px;
    transition: background-color 0.3s;
  }
  .icon-wrapper .icon:hover {
    background-color: #f0f0f0;
    cursor: pointer;
  }
  .action-box {
    display: none;
    position: absolute;
    top: 30px;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    z-index: 1000;
  }
  .action-box a {
    display: block;
    padding: 10px 20px;
    color: black;
    text-decoration: none;
    border-bottom: 1px solid #ddd;
  }
  .action-box a:last-child {
    border-bottom: none;
  }
  .action-box a:hover {
    background-color: #f0f0f0;
  }
  .content-pre {
    white-space: pre-wrap;
    word-wrap: break-word;
  }
  .attachment-list {
    display: none;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    width: fit-content;
    position: absolute;
    z-index: 1000;
  }
  .attachment-toggle-wrapper {
    position: relative;
  }
  .attachment-toggle-wrapper .attachment-list {
    margin-top: 5px; /* Adjusts spacing between the toggle and list */
  }
</style>

</head>
<body>
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">

    <!-- 헤더 시작 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- 헤더 끝 -->
    
    <div class="layout-page">

      <!-- nav 시작 -->
      <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
      <!-- nav 끝 -->

      <div class="content-wrapper">
        <div class="container-xxl flex-grow-1 container-p-y">

          <div class="container card" style="padding: 50px;">
            <div style="align-items: center;">
              <div>
                <span style="font-size: 14px;">팀게시판</span><br><br>
                <span style="font-size: 24px; color: black;">${b.boardTitle}</span>
                <br><br>
                <div class="d-flex justify-content-between align-items-center user-info">
                  <div class="avatar-wrapper d-flex align-items-center">
                    <div class="avatar me-2">
                      <img src="${contextPath}/resources/assets/img/avatars/1.png" alt class="rounded-circle"/>
                    </div>
                    <div class="d-flex flex-column">
                      <span class="emp_name text_truncate" style="color: black;">${b.memName}</span>
                    </div>
                    <div class="d-flex flex-column" style="margin-left: 20px;">
                      <span>${b.boardRegistDT}</span>
                    </div>
                  </div>
                  <div class="attachment-toggle-wrapper">
                    <span id="attachment-toggle" style="cursor: pointer;">첨부파일(${b.attachCount})</span>
                    <span style="margin-left: 20px; color: black;">조회수 (${b.boardCount})</span>
                    <div id="attachment-list" class="attachment-list">
                      <c:forEach var="at" items="${b.attachList}">
                        <a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${at.originalName}">${at.originalName}</a>
                        <br>
                      </c:forEach>
                    </div>
                  </div>
                </div>         
                <br>
                <hr>           
                <c:choose>
                	<c:when test="${ loginUser.memNo == b.memNo }">
                		<div class="d-flex justify-content-end align-items-center">
										  <div class="icon-wrapper">
										    <i class="ti ti-dots-vertical ti-md icon"></i>
										    <div class="action-box">
										      <form id="frm" action="" method="post">
										        <input type="hidden" id="no" name="no" value="" />
										        <a href="#" onclick="modifyPost(${b.boardNo})">
										          <i class="menu-icon tf-icons ti ti-edit"></i>
										        </a>
										        <a href="#" onclick="deletePost(${b.boardNo})">
										          <i class="menu-icon tf-icons ti ti-trash"></i>
										        </a>
										      </form>
										    </div>
										  </div>
										</div>
										
										<script>
										  
										</script>

                	</c:when>
                	<c:otherwise>
                		<br>
                	</c:otherwise>
                </c:choose>                          
                <div class="content">
                  <pre style="font-size: 16px; color:black; font-family: 'Noto Sans KR', sans-serif;">${b.boardContent}</pre>
                </div>
                <br>
                <hr>
                <div style="display: flex; align-items: center; justify-content: space-between;">
                  <div class="input" style="flex-grow: 1; margin-right: 10px;">
                    <textarea class="form-control" aria-label="With textarea" placeholder="댓글을 입력하세요." style="width: 100%; resize: none;"></textarea>
                  </div>
                  <div>
                    <button id="regist" class="btn btn-secondary" style="text-align: center;">등록</button>
                  </div>
                </div>
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                  <button id="back" class="btn btn-label-secondary" style="text-align: center;" onclick="boardList();">목록</button>
                </div>
              </div>
            </div>
          </div>

				<script>
				          
				function modifyPost(boardNo) {
				  var form = document.getElementById('frm');
				  form.setAttribute('action', '${contextPath}/board/boardModify.do');
				  document.getElementById('no').value = boardNo;
				  form.submit();
				}
				
				function deletePost(boardNo) {
				  if (confirm('정말로 삭제하시겠습니까?')) {
				    var form = document.getElementById('frm');
				    form.setAttribute('action', '${contextPath}/board/boardDelete.do');
				    document.getElementById('no').value = boardNo;
				    form.submit();
				  } 
				}
				 
				function boardList() {
				  window.location.href = '${contextPath}/board/boardList.do';
				}
				
				document.addEventListener('DOMContentLoaded', () => {
				  const icon = document.querySelector('.icon');
				  const actionBox = document.querySelector('.action-box');
				  const attachmentToggle = document.getElementById('attachment-toggle');
				  const attachmentList = document.getElementById('attachment-list');
				
				  icon.addEventListener('click', () => {
				    actionBox.style.display = actionBox.style.display === 'none' || !actionBox.style.display ? 'block' : 'none';
				  });
				
				  document.addEventListener('click', (e) => {
				    if (!icon.contains(e.target) && !actionBox.contains(e.target)) {
				      actionBox.style.display = 'none';
				    }
				  });
				
				  attachmentToggle.addEventListener('click', (e) => {
				    e.stopPropagation();
				    attachmentList.style.display = attachmentList.style.display === 'none' || !attachmentList.style.display ? 'block' : 'none';
				  });
				
				  document.addEventListener('click', () => {
				    attachmentList.style.display = 'none';
				  });
				
				  attachmentList.addEventListener('click', (e) => {
				    e.stopPropagation();
				  });
				});
				</script>
          
        </div>
        <!-- 세션 끝 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <!-- 푸터 끝 -->
        <div class="content-backdrop fade"></div>
      </div>
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
    <div class="drag-target"></div>
  </div>
</div>
