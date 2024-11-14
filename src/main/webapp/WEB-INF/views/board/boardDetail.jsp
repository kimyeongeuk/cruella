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
                    <span style="font-size: 14px;">팀게시판</span><br><br>
                    <span style="font-size: 24px; color: black;">팀게시판 제목입니다.</span>
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
                        <div class="action-box" style="display: none;">
                          <a href="${ contextPath }/board/boardModify.do"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                              <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                            </div>
                          </div>
                        </div>
                        <pre class="content-pre">
팀원 여러분, 안녕하세요!
따스한 봄이 찾아왔습니다! 우리 백화점은 이번 봄 시즌을 맞이하여 새로운 프로모션을 준비했습니다. 여러분의 협조와 참여가 이번 프로모션의 성공을 좌우할 것입니다. 아래는 프로모션의 상세 내용과 여러분의 역할에 대한 안내입니다.
📅 프로모션 기간
기간: 2025년 3월 20일(월) ~ 2025년 4월 30일(일)
장소: 백화점 전층
🌟 프로모션 개요
봄맞이 할인전:
전 품목 20% 할인
특정 브랜드 최대 50% 할인
스페셜 이벤트:
주말마다 럭키드로우 이벤트 진행
SNS 해시태그 이벤트 (#우리백화점봄맞이)
고객 사은품 증정:
일정 금액 이상 구매 고객에게 사은품 증정
사은품 종류: 친환경 장바구니, 봄맞이 화분 등
🛠️ 팀원 역할 안내
매장 관리:
매장 진열 및 상품 정리
프로모션 상품 위치 파악 및 고객 응대
고객 응대:
프로모션 관련 문의 응대
이벤트 참여 방법 안내
SNS 관리:
SNS 이벤트 홍보 및 참여 독려
고객 후기에 대한 빠른 응대
💡 중요 사항
출근 시간: 프로모션 기간 동안 출근 시간을 엄수해주세요.
유니폼 착용: 깨끗한 유니폼 착용을 부탁드립니다.
위생 관리: 매장 내 위생 관리에 신경 써주시기 바랍니다.
🙏 마무리 인사
이번 프로모션은 고객 만족도를 높이고, 매출을 증대시키는 중요한 이벤트입니다. 여러분의 열정과 노력에 항상 감사드리며, 이번 프로모션도 성공적으로 진행될 수 있도록 힘을 모아주시길 바랍니다. 궁금한 점이나 도움이 필요한 사항이 있으면 언제든지 저에게 문의해주세요.
감사합니다!
                        </pre>   
                        <br><hr>
                        <div style="display: flex; align-items: center; justify-content: space-between;">
                      <div class="input" style="flex-grow: 1; margin-right: 10px;">
                        <textarea class="form-control" aria-label="With textarea" placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
                      </div>  
                      <div>
                        <button id="regist" class="btn btn-secondary" style="text-align: center;">등록</button>
                      </div> 
                    </div>
                    <hr>     
                    <span>댓글(100)</span>  
                    <hr>  
                    <div class="d-flex justify-content-between align-items-center user-info">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2">
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" /> 
                        </div>
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <br>
                    <span style="color: black; margin: 40px;">안녕하세요</span>
                    <br><br>
                    <button
                      type="button"
                      class="btn btn-sm btn-outline-secondary"
                      style="margin-left: 40px;"
                      data-bs-toggle="modal"
                      data-bs-target="#modalScrollable">
                      답글 10
                    </button>  
                    <hr>
                    <br>
                    <div class="d-flex justify-content-between align-items-center user-info">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2">
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" /> 
                        </div>
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <br>
                    <span style="color: black; margin: 40px;">안녕하세요</span>
                    <br><br>
                    <button
                      type="button"
                      class="btn btn-sm btn-outline-secondary"
                      style="margin-left: 40px;"
                      data-bs-toggle="modal"
                      data-bs-target="#modalScrollable">
                      답글 10
                    </button>                    
                    <hr>
                    <div style="display: flex; justify-content: center; margin-top: 20px;">
                      <button id="back" class="btn btn-secondary" style="text-align: center;">목록</button>
                    </div>        
                  </div>
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
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" /> 
                        </div>
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 40px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div style="width: 100%;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2 d-flex justify-content-between">
                          <i class="menu-icon tf-icons ti ti-currency-leu" style="margin-right: auto; font-size: 40px; margin-top: -10px;"></i>
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" style="margin-left: auto;" /> 
                        </div>            
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black; margin-left: 40px;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 80px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>
                  <div style="width: 100%;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2 d-flex justify-content-between">
                          <i class="menu-icon tf-icons ti ti-currency-leu" style="margin-right: auto; font-size: 40px; margin-top: -10px;"></i>
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" style="margin-left: auto;" /> 
                        </div>            
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black; margin-left: 40px;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 80px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>
                  <div style="width: 100%;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2 d-flex justify-content-between">
                          <i class="menu-icon tf-icons ti ti-currency-leu" style="margin-right: auto; font-size: 40px; margin-top: -10px;"></i>
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" style="margin-left: auto;" /> 
                        </div>            
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black; margin-left: 40px;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 80px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>
                  <div style="width: 100%;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2 d-flex justify-content-between">
                          <i class="menu-icon tf-icons ti ti-currency-leu" style="margin-right: auto; font-size: 40px; margin-top: -10px;"></i>
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" style="margin-left: auto;" /> 
                        </div>            
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black; margin-left: 40px;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 80px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>
                  <div style="width: 100%;">
                    <div class="d-flex justify-content-between align-items-center" style="margin: 10px;">
                      <div class="avatar-wrapper d-flex align-items-center">
                        <div class="avatar me-2 d-flex justify-content-between">
                          <i class="menu-icon tf-icons ti ti-currency-leu" style="margin-right: auto; font-size: 40px; margin-top: -10px;"></i>
                          <img src="../../assets/img/avatars/1.png" alt class="rounded-circle" style="margin-left: auto;" /> 
                        </div>            
                        <div class="d-flex flex-column">
                          <span class="emp_name text_truncate" style="color: black; margin-left: 40px;">Jodan Strvenson</span>
                        </div>
                        <div class="d-flex flex-column" style="margin-left: 20px;">
                          <span>2024.11.05 23:06:31</span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end align-items-center">
                        <div class="icon-wrapper">
                          <i class="ti ti-dots-vertical ti-md comment-icon" style="cursor: pointer;"></i>
                          <div class="action-box comment-action-box" style="display: none;">
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-edit"></i></a>
                            <a href="javascript:void(0);"><i class="menu-icon tf-icons ti ti-trash"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p style="margin-left: 80px; margin-top: 20px; color: black;">안녕하세요</p>
                    <br><hr>
                  </div>                 
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

          <script>
            document.addEventListener('DOMContentLoaded', () => {
              const icon = document.querySelector('.icon');
              const actionBox = document.querySelector('.action-box');
              const attachmentToggle = document.getElementById('attachment-toggle');
              const attachmentList = document.getElementById('attachment-list');
              const commentIcons = document.querySelectorAll('.comment-icon');

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

              commentIcons.forEach(icon => {
                const commentActionBox = icon.nextElementSibling;
                icon.addEventListener('click', () => {
                  commentActionBox.style.display = commentActionBox.style.display === 'none' || !commentActionBox.style.display ? 'block' : 'none';
                });

                document.addEventListener('click', (e) => {
                  if (!icon.contains(e.target) && !commentActionBox.contains(e.target)) {
                    commentActionBox.style.display = 'none';
                  }
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