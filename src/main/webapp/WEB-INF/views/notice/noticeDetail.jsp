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
      </style>


          <!-- Content wrapper -->
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="container card" style="padding: 50px;">
                <div style="align-items: center;">
                  <div>
                    <span style="font-size: 14px;">공지사항</span><br><br>
                    <span style="font-size: 24px; color: black;">공지사항 제목입니다.</span>
                    <br><br>
                    <div class="d-flex justify-content-between align-items-center user-info">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2">
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" /> 
                        </div>
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>3시간전</span>
                        </div>
                      </div>
                      <div class="d-flex">
                        <span id="attachment-toggle" style="cursor: pointer;">첨부파일(1)</span>
                        <span style="margin-left: 20px; color: black;">조회수 10</span>
                      </div>
                    </div>
                    <div id="attachment-list" style="display: none; margin-top: 10px; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
                          <strong>첨부파일</strong><br>
                          <a href="sample1.pdf" class="file-link">파일명1.pdf</a><br>
                          <a href="sample2.jpg" class="file-link">파일명2.jpg</a><br>
                          <a href="sample3.docx" class="file-link">파일명3.docx</a>
                        </div>
                        <br>
                        <hr>
                        <div class="d-flex justify-content-end align-items-center">
                          <div class="icon-wrapper">
                            <i class="ti ti-dots-vertical ti-md icon"></i>
                            <div class="action-box">
                              <a href="${ contextPath }/notice/noticeModify.do"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                              <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                            </div>
                          </div>
                        </div>
                        <pre class="content-pre">
배송 정보

배송 방법 : 택배
배송 지역 : 전국지역배송 
비용 : 무료배송 
기간 : 3일 ~ 7일
배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.
고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.

교환및 반품정보
교환 및 반품이 가능한 경우
- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의 경우  포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 
교환/반품이 불가능합니다.
- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알
게 된 날로부터 30일이내

교환 및 반품이 불가능한 경우
- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우.
단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외
- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에 따른 반품/교환은 제조사 
기준에 따릅니다.)
- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
단, 화장품등의 경우 시용제품을 제공한 경우에 한 합니다.
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우
- 복제가 가능한 상품등의 포장을 훼손한 경우
(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)

※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
(색상 교환, 사이즈 교환 등 포함)
                        </pre>                          
                        <div style="display: flex; justify-content: center; margin-top: 20px;">
                      <button id="back" class="btn btn-secondary" style="text-align: center;">목록</button>
                    </div>        
                  </div>
                </div>
              </div>           
            </div>
          </div>
          
          <script>
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
          
              attachmentToggle.addEventListener('click', () => {
                attachmentList.style.display = attachmentList.style.display === 'none' || !attachmentList.style.display ? 'block' : 'none';
              });
          
              document.querySelectorAll('.file-link').forEach(fileLink => {
                fileLink.addEventListener('mouseover', () => {
                  fileLink.style.backgroundColor = '#f0f0f0'; // 마우스 호버 시 스타일 추가
                  fileLink.style.cursor = 'pointer'; // 마우스 호버 시 커서 스타일 변경
                });
          
                fileLink.addEventListener('mouseout', () => {
                  fileLink.style.backgroundColor = ''; // 마우스 호버 시 스타일 제거
                  fileLink.style.cursor = ''; // 마우스 호버 시 커서 스타일 제거
                });
          
                fileLink.addEventListener('click', () => {
                  const fileName = fileLink.textContent;
                  alert(`${fileName} 다운로드가 시작됩니다.`); // 파일 다운로드 시 알림 메시지 표시
                });
              });
            });
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