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
  .action-replybox {
    display: none;
    position: absolute;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    z-index: 1000;
  }
  .action-replybox a {
    display: block;
    padding: 10px 20px;
    color: black;
    text-decoration: none;
    border-bottom: 1px solid #ddd;
  }
  .action-replybox a:last-child {
    border-bottom: none;
  }
  .action-replybox a:hover {
    background-color: #f0f0f0;
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
                            <a href="#" onclick="modifyBoardPost(${b.boardNo})">
                              <i class="menu-icon tf-icons ti ti-edit"></i>
                            </a>
                            <a href="#" onclick="deleteBoardPost(${b.boardNo})">
                              <i class="menu-icon tf-icons ti ti-trash"></i>
                            </a>
                          </form>
                        </div>
                      </div>
                    </div>                  
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
                  <table id="reply_area" class="table" align="center">
                    <thead>
                      <tr>    
                        <th colspan="2" width="650">
                          <textarea class="form-control" id="reply_content" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary" style="text-align: center;" onclick="fn_insertReply();">등록</button></th>
                      </tr>
                      <tr>
                        <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                      </tr>
                    </thead>
                    <tbody>
                                                                    
                    </tbody>
                  </table>
                </div>
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                  <button id="back" class="btn btn-label-secondary" style="text-align: center;" onclick="boardList();">목록</button>
                </div>
                <div id="editReplyModal" class="modal" tabindex="-1">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title">댓글 수정</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <textarea id="editReplyContent" class="form-control" rows="3"></textarea>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary" onclick="updateReply()">저장</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								<!-- Modal -->
	              <div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-scrollable" role="document">
								    <div class="modal-content">
								
								      <div class="modal-header">
								        <div style="width: 100%;">
								          <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
								            <div class="avatar-wrapper d-flex align-items-center">
								              <div class="avatar me-2">
								                <img src="${contextPath}/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
								              </div>
								              <div class="d-flex flex-column">
								                <span class="emp_name text_truncate" id="modal-author" style="color: black;"></span>
								              </div>
								              <div class="d-flex flex-column" style="margin-left: 20px;">
								                <span id="modal-date"></span>
								              </div>
								            </div>
								            <div class="d-flex justify-content-end align-items-center">
								              <div class="icon-wrapper">
								                <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer; display: none;"></i>
								                <div class="action-box comment-action-box" style="display: none;">
								                  <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
								                  <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
								                </div>
								              </div>
								            </div>
								          </div>
								          <p id="modal-content" style="margin-left: 40px; margin-top: 20px; color: black;"></p>
								          <br><hr>
								        </div>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								
								      <div class="modal-body">
								        <!-- 내용 추가 -->
								      </div>
								
								      <div class="modal-footer">
								        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
								          <div class="input" style="flex-grow: 1;">
								            <textarea class="form-control" aria-label="With textarea" placeholder="답글을 입력해주세요." style="width: 100%; border: 0px; resize: none;"></textarea>
								          </div>
								          <div>
								            <button id="regist" class="btn btn-sm btn-outline-secondary" style="text-align: center;">등록</button>
								          </div>
								        </div>
								      </div>
								
								    </div>
								  </div>
								</div>

								
              </div>
            </div>
          </div>
        </div>
        <!-- 푸터 시작 -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <!-- 푸터 끝 -->
        <div class="content-backdrop fade"></div>
      </div>
      <!-- nav layout page 닫기 -->
    </div>
    <!-- layout-container 닫기 -->
  </div>
  <!-- layout wrapper 닫기 -->
  <form id="frm" method="post">
    <input type="hidden" id="no" name="replyNo" value="" />
  </form>
</div>
<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>
</body>
<script>
$(document).on('show.bs.modal', '#modalScrollable', function(event) {
  var button = $(event.relatedTarget); // 버튼 정보
  var replyId = button.data('reply-id');
  var replyContent = button.data('reply-content');
  var replyAuthor = button.data('reply-author');
  var replyDate = button.data('reply-date');
  var replyMemNo = button.data('reply-memno');

  console.log("replyMemNo:", replyMemNo);
  console.log("loginUserMemNo:", loginUserMemNo);

  var modal = $(this);
  modal.find('#modal-author').text(replyAuthor);
  modal.find('#modal-date').text(replyDate);
  modal.find('#modal-content').text(replyContent);

  // 작성자인 경우에만 ... 아이콘 보이게 설정
  if (replyMemNo == loginUserMemNo) {
    modal.find('.comment-icon').show();
  } else {
    modal.find('.comment-icon').hide();
  }
});



$(document).ready(function(){
  fn_replyList();

  // 아이콘 클릭 시 액션 박스 표시
  $(document).on('click', '.icon', function() {
    $(this).next('.action-replybox').toggle();
  });

  // 클릭 시 외부 영역 클릭하면 액션 박스 숨기기
  $(document).on('click', function(e) {
    if (!$(e.target).closest('.icon-wrapper').length) {
      $('.action-replybox').hide();
    }
  });

  // attachment-toggle 클릭 시 첨부파일 목록 표시
  $(document).on('click', '#attachment-toggle', function(e) {
    e.stopPropagation();
    $('#attachment-list').toggle();
  });

  // 클릭 시 외부 영역 클릭하면 첨부파일 목록 숨기기
  $(document).on('click', function(e) {
    if (!$(e.target).closest('.attachment-toggle-wrapper').length) {
      $('#attachment-list').hide();
    }
  });

  // 클릭 이벤트 전파 중지 (첨부파일 리스트 내에서)
  $('#attachment-list').on('click', function(e) {
    e.stopPropagation();
  });
});

var loginUserMemNo = "${loginUser.memNo}";

function fn_replyList() {
  $.ajax({
    url: '${contextPath}/board/rlist.do',
    data: { no: ${b.boardNo} },
    success: function(resData) {
      console.log("Received data:", resData); // 서버로부터 받은 데이터 확인
      
      $("#rcount").text(resData.length); // 댓글 수 출력
      let tr = "";
      for(let i = 0; i < resData.length; i++){
        console.log("loginUserMemNo:", loginUserMemNo);
        console.log("replyMemNo:", resData[i].memNo); // 댓글 작성자의 memNo

        tr += "<tr><td colspan='3'>"
              + "<div class='d-flex justify-content-between align-items-center user-info'>"
              + "<div class='avatar-wrapper d-flex align-items-center'>"
              + "<div class='avatar me-2'>"
              + "<img src='${contextPath}/resources/assets/img/avatars/1.png' alt='Avatar' class='rounded-circle' />"
              + "</div>"
              + "<div class='d-flex align-items-center'>"
              + "<span class='emp_name text_truncate' style='color: black; margin-right: 20px;'>" + resData[i].memName + "</span>"
              + "<span>" + resData[i].replyRegistDT + "</span>"
              + "</div></div>";

        // 댓글 작성자가 로그인한 사용자와 같은지 확인
        if (loginUserMemNo == resData[i].memNo) {
          tr += "<div class='d-flex justify-content-end align-items-center'>"
                + "<div class='icon-wrapper'>"
                + "<i class='ti ti-dots-vertical ti-md comment-icon' style='cursor: pointer;'></i>"
                + "<div class='action-replybox'>"
                + "<form id='rfrm' action='' method='post'>"
                + "<input type='hidden' id='replyNo' name='replyNo' value='' />"
                + "<a href='#' onclick='modifyReply(" + resData[i].replyNo + ", `" + resData[i].replyContent + "`)'>"
                + "<i class='menu-icon tf-icons ti ti-edit'></i></a>"
                + "<a href='#' onclick='deleteReply(" + resData[i].replyNo + ")'>"
                + "<i class='menu-icon tf-icons ti ti-trash'></i></a>"
                + "</form>"
                + "</div></div></div>";
        } else {
          tr += "<br>";
        }

        tr += "</div><br>"
              + "<span style='color: black; margin: 40px;'>" + resData[i].replyContent + "</span><br><br>"
              + "<button type='button' class='btn btn-sm btn-outline-secondary' style='margin-left: 40px;' data-bs-toggle='modal' data-bs-target='#modalScrollable' data-reply-id='" + resData[i].replyNo + "' data-reply-content='" + resData[i].replyContent + "' data-reply-author='" + resData[i].memName + "' data-reply-date='" + resData[i].replyRegistDT + "' data-reply-memno='" + resData[i].memNo + "'>답글 10</button>"
              + "</td></tr>";
      }

      $("#reply_area tbody").html(tr);
    },
    error: function(xhr, status, error) {
      console.error("에러 발생:", status, error);
    }
  });
}



// 댓글 등록용 (ajax) 함수
function fn_insertReply(){
  $.ajax({
    url: '${contextPath}/board/rinsert.do',
    type: 'post',
    data: {
      replyContent: $("#reply_content").val(),
      boardNo: ${b.boardNo}
    },
    success: function(resData){
      console.log("Insert result:", resData); // 응답 결과 확인
      if(resData === "SUCCESS"){
        fn_replyList();
        $("#reply_content").val("");
      } else {
        alert("댓글 작성 실패");
      }
    },
    error: function(xhr, status, error) {
      console.error("에러 발생:", status, error);
    }
  });
}


//게시글 수정
function modifyBoardPost(boardNo) {
  var form = document.getElementById('frm');
  form.setAttribute('action', '${contextPath}/board/boardModify.do');
  document.getElementById('no').value = boardNo;
  form.submit();
}

// 게시글 삭제
function deleteBoardPost(boardNo) {
  if (confirm('정말로 삭제하시겠습니까?')) {
    var form = document.getElementById('frm');
    form.setAttribute('action', '${contextPath}/board/boardDelete.do');
    document.getElementById('no').value = boardNo;
    form.submit();
  }
}

//수정할 댓글 번호를 저장할 변수
let currentReplyNo;

// 댓글 수정 폼을 열 때 호출하는 함수
function modifyReply(replyNo, content) {
  currentReplyNo = replyNo;
  document.getElementById('editReplyContent').value = content;
  $('#editReplyModal').modal('show');
}

// 서버로 수정된 댓글 내용을 전송하는 함수
function updateReply() {
  const updatedContent = document.getElementById('editReplyContent').value;
  $.ajax({
    type: 'POST',
    url: '${contextPath}/board/updateReply.do',
    data: {
      replyNo: currentReplyNo,
      content: updatedContent
    },
    success: function(response) {
      if (response.status === "SUCCESS") {
        alert("댓글이 수정되었습니다.");
        $('#editReplyModal').modal('hide');
        fn_replyList(); // 댓글 목록 갱신
      } else {
        alert("댓글 수정에 실패하였습니다. 다시 시도해주세요.");
      }
    },
    error: function(xhr, status, error) {
      console.error("에러 발생:", status, error);
    }
  });
}

// 댓글 삭제 함수
function deleteReply(replyNo) {
  if (confirm('정말로 삭제하시겠습니까?')) {
    $.ajax({
      type: 'POST',
      url: '${contextPath}/board/deleteReplyCompletely.do',
      data: { replyNo: replyNo },
      success: function(response) {
        if (response.status === "SUCCESS") {
          alert("댓글이 삭제되었습니다.");
          fn_replyList(); // 댓글 목록 갱신
        } else {
          alert("댓글 삭제에 실패하였습니다. 다시 시도해주세요.");
        }
      },
      error: function(xhr, status, error) {
        console.error("에러 발생:", status, error);
      }
    });
  }
}


function boardList() {
  window.location.href = '${contextPath}/board/boardList.do';
}

document.addEventListener('DOMContentLoaded', () => {
  // 이벤트 위임을 사용하여 동적으로 생성된 요소를 처리
  document.body.addEventListener('click', (e) => {
    // 게시글의 .icon 클릭 처리
    if (e.target.matches('.icon')) {
      const actionBox = e.target.closest('.icon-wrapper').querySelector('.action-box');
      if (actionBox) {
        actionBox.style.display = actionBox.style.display === 'none' || !actionBox.style.display ? 'block' : 'none';
        hideOtherBoxes('.action-box', actionBox);
      }
    }

    // 댓글의 .comment-icon 클릭 처리
    if (e.target.matches('.comment-icon')) {
      const replyBox = e.target.closest('.icon-wrapper').querySelector('.action-replybox');
      if (replyBox) {
        replyBox.style.display = replyBox.style.display === 'none' || !replyBox.style.display ? 'block' : 'none';
        hideOtherBoxes('.action-replybox', replyBox);
      }
    }

    // attachment-toggle 클릭 처리
    if (e.target.matches('#attachment-toggle')) {
      e.stopPropagation();
      const attachmentList = document.getElementById('attachment-list');
      attachmentList.style.display = attachmentList.style.display === 'none' || !attachmentList.style.display ? 'block' : 'none';
      hideOtherBoxes('.attachment-list', attachmentList);
    }
  });

  // 외부 클릭 이벤트 처리 (모든 action-box, action-replybox 및 attachment-list 숨기기)
  document.addEventListener('click', (e) => {
    document.querySelectorAll('.action-box').forEach(box => {
      if (!box.contains(e.target) && !e.target.matches('.icon')) {
        box.style.display = 'none';
      }
    });

    document.querySelectorAll('.action-replybox').forEach(box => {
      if (!box.contains(e.target) && !e.target.matches('.comment-icon')) {
        box.style.display = 'none';
      }
    });

    const attachmentList = document.getElementById('attachment-list');
    if (attachmentList && !attachmentList.contains(e.target) && e.target.id !== 'attachment-toggle') {
      attachmentList.style.display = 'none';
    }
  });

  // 클릭 이벤트 전파 중지 (첨부파일 리스트 내에서)
  const attachmentList = document.getElementById('attachment-list');
  if (attachmentList) {
    attachmentList.addEventListener('click', (e) => {
      e.stopPropagation();
    });
  }

  // 다른 상자 숨기기 함수
  function hideOtherBoxes(selector, currentBox) {
    document.querySelectorAll(selector).forEach(box => {
      if (box !== currentBox) {
        box.style.display = 'none';
      }
    });
  }
});

</script>
</html>
