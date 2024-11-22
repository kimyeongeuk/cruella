<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="${contextPath}/assets/" data-template="views" data-style="light">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/assets/js/config.js"></script>
<style>
  .delete-btn {
    position: absolute;
    top: -20px;
    right: -5px;
    background: none;
    border: none;
    font-size: 20px;
    color: black;
    cursor: pointer;
    line-height: 1;
  }
  .delete-btn:hover {
    color: red;
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
        <!-- 세션 시작 -->
        <div class="container-xxl flex-grow-1 container-p-y">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="container card" style="padding: 50px;">
                <form id="modify-form" action="${contextPath}/board/boardUpdate.do" method="post" enctype="multipart/form-data">
                  <div class="card-body" style="align-items: center;">
                    <div>
                      <input type="hidden" name="deptCode" value="${loginUser.deptCode}"/>
                      <input type="hidden" name="boardNo" value="${b.boardNo}"/>
                      <input type="hidden" id="boardContent" name="boardContent"/>
                      <span style="font-size: 24px;">팀게시판 수정</span><br><br><br>
                      <label for="defaultFormControlInput" class="form-label">제목</label>
                      <input type="text" class="form-control" id="defaultFormControlInput" name="boardTitle" placeholder="제목을 입력하세요." value="${b.boardTitle}" required/>
                      <br>
                      <label for="formFile" class="form-label">첨부파일</label>
                      <input class="form-control" type="file" id="formFile" name="uploadFiles" multiple/>
                      <div id="file-container" style="margin-top: 10px;">
                        <c:forEach var="at" items="${b.attachList}">
                          <div class="file-item" style="position: relative; display: inline-block; margin: 10px;" data-fileno="${at.fileNo}">
                            <c:choose>
                              <c:when test="${fn:endsWith(at.filesystemName, '.jpg') || fn:endsWith(at.filesystemName, '.jpeg') || fn:endsWith(at.filesystemName, '.png') || fn:endsWith(at.filesystemName, '.gif')}">
                                <img src="${contextPath}${at.filePath}/${at.filesystemName}" style="max-width: 200px; height: auto;"/>
                              </c:when>
                              <c:otherwise>
                                <p style="margin: 0; padding: 5px; border: 1px solid #ccc; background: #f9f9f9;">
                                  ${at.originalName}
                                </p>
                              </c:otherwise>
                            </c:choose>
                            <span class="origin_attach_del delete-btn" data-fileno="${at.fileNo}">&#10005;</span>
                          </div>
                        </c:forEach>
                      </div>
                      <br>
                      <div id="board-editor"></div>
                      <br>
                      <div style="display: flex; justify-content: space-between; align-items: center;">
                        <button id="back" class="btn btn-secondary" type="button" onclick="window.history.back();">취소</button>
                        <button id="registerButton" class="btn btn-primary" type="submit">수정</button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- 푸터 시작 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <!-- 푸터 끝 -->
        <div class="content-backdrop fade"></div>
      </div>
    </div>
  </div>
</div>
<div class="layout-overlay layout-menu-toggle"></div>
<div class="drag-target"></div>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script>
document.addEventListener('DOMContentLoaded', function () {
  // JSP 변수 값을 JavaScript 변수로 안전하게 전달
  var boardContentValue = `${b.boardContent}`; // HTML 이스케이프 해제
  console.log(boardContentValue); // 값이 올바르게 전달되었는지 로그 확인

  // Quill 에디터 초기화
  const quill = new Quill('#board-editor', {
    theme: 'snow',
    placeholder: '내용을 입력해주세요.',
    modules: {
      toolbar: [
        [{ font: [] }, { size: [] }],
        ['bold', 'italic', 'underline', 'strike'],
        [{ color: [] }, { background: [] }],
        [{ script: 'super' }, { script: 'sub' }],
        [{ header: '1' }, { header: '2' }, 'blockquote', 'code-block'],
        [{ list: 'ordered' }, { list: 'bullet' }, { indent: '-1' }, { indent: '+1' }],
        [{ direction: 'rtl' }],
        ['link', 'image', 'video', 'formula'],
        ['clean']
      ]
    }
  });

  const boardContentHidden = document.getElementById('boardContent');
  boardContentHidden.value = boardContentValue; // 숨겨진 input에 값 설정

  if (boardContentHidden && boardContentHidden.value) {
    quill.clipboard.dangerouslyPasteHTML(0, boardContentHidden.value); // Quill에 HTML 내용 삽입
  }

  // 폼 제출 시 내용 동기화
  const form = document.querySelector('#modify-form');
  form.addEventListener('submit', function () {
    boardContentHidden.value = quill.root.innerHTML; // Quill의 내용을 숨겨진 input에 저장
  });

  const fileInput = document.getElementById('formFile');
  const fileContainer = document.getElementById('file-container');
  const dataTransfer = new DataTransfer();

  fileInput.addEventListener('change', function(event) {
    const newFiles = Array.from(event.target.files);
    newFiles.forEach(file => dataTransfer.items.add(file));
    renderFiles();
    fileInput.files = dataTransfer.files;
  });

  function renderFiles() {
    fileContainer.innerHTML = '';
    Array.from(dataTransfer.files).forEach((file, index) => {
      const fileType = file.type;
      const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

      const fileDiv = document.createElement('div');
      fileDiv.style.position = 'relative';
      fileDiv.style.display = 'inline-block';
      fileDiv.style.margin = '10px';
      fileDiv.setAttribute('data-index', index);

      if (validImageTypes.includes(fileType)) {
        // 이미지 파일일 경우
        const reader = new FileReader();
        reader.onload = function (e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.style.maxWidth = '200px';
          img.style.height = 'auto';
          fileDiv.appendChild(img);
        };
        reader.readAsDataURL(file);
      } else {
        // 이미지 파일이 아닐 경우
        const p = document.createElement('p');
        p.textContent = file.name;
        p.style.margin = '0';
        p.style.padding = '5px';
        p.style.border = '1px solid #ccc';
        p.style.background = '#f9f9f9';
        fileDiv.appendChild(p);
      }

	    const removeButton = document.createElement('button');
	    removeButton.innerHTML = '&#10005;';
	    removeButton.className = 'delete-btn'; // 동일한 클래스 추가
	    removeButton.onclick = function () {
	      fileDiv.remove();
	      dataTransfer.items.remove(index);
	      fileInput.files = dataTransfer.files;
	    };

	    fileDiv.appendChild(removeButton);
	    fileContainer.appendChild(fileDiv);
	  });
	}

  $(document).ready(function() {
	  $(".origin_attach_del").on("click", function() {
	    // 삭제할 첨부파일 번호를 submit시 넘기기 위한 작업
	    let hiddenEl = "<input type='hidden' name='delFileNo' value='" + $(this).data("fileno") + "'>";
	    $("#modify-form").append(hiddenEl);

	    // 화면으로부터 삭제된 것처럼 보여지게 해당 첨부파일 링크 삭제 처리
	    $(this).parent().remove();
	  });
	});
});



</script>
</body>
</html>
