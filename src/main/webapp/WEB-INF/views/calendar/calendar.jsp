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
    
    <style>

      .fc-scrollgrid{
        background-color: white;
      }

      .select2-selection__clear{ /* select 태그에 작게 x표시 뜨는거 안보이게 */
        display:none;
      }
      .select2-search__field{ /* select 태그에 option 창에서 검색창 뜨는거 안보이게 */
        display:none;
      }

      .fc-event-title-container{
        color: rgb(45, 45, 45);
      }

			.select2-selection__rendered{
				display:none;
			}

    </style>


    <!-- 풀캘린더 블로그 참고 popper, tippy 이게 필요하다는데 왜?
    <script src="js/main.js"></script>
    <script src="js/locales-all.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="https://unpkg.com/tippy.js@6"></script> -->






    <!-- fullcalendar-->

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script type="text/javascript">

      

      document.addEventListener('DOMContentLoaded', function() {
      var calendar;  // global(전역) 변수로 calendar 선언
      var calendarEl = document.getElementById('calendar');
        
        // Fullcalendar 옵션 설정 부분
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', // 로드 될때 캘린더 화면 기본 설정
          selectable: true, // 달력 셀 부분 클릭, 드래그 선택 가능
          aspectRatio: 2.2,
          contentHeight: 850,
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          editable: true, // default | false 이벤트 드래그 등의 편집여부를 설정함
          selectMirror: true, 
          textColor: 'black',

          // 블로그
          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('일정 입력');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },

        // 이벤트 조회
        events: [ 
					<c:forEach var="list" items="${list}"> // List로 불러오는거는 for문으로!
          {
            title: '${list.calTitle}',
            start: '${list.calStartDt}',
            end: '${list.calEndDt}'
          },
          </c:forEach>
        ],


          select: function(evt){ // 날짜 셀 클릭시 실행되는 펑션
            console.log(evt); // {startStr:'시작날짜', endStr:'끝날짜'} 가 들어있다. 즉, 셀 드래그로 선택시 첫 날짜는 startStr에, 마지막 날짜는 endStr에 담긴다.

            //alert('sss');
            //$('#modify').modal();
            
            // day 클릭시 모달창 뜨게하는 것 -> 모달 만들어서 바꿔줘야 함
            var dayclickmodal = new bootstrap.Modal(document.getElementById("dayclickmodal"));
            // evt로 부터 도출한 날짜 값을 modal 영역 내의 날짜 input 요소에 출력 
            $("#start").val(evt.startStr);  // 시작일을 'start' input에 입력 => String 값 반환됨

             // 종료일에서 하루를 빼는 코드 (String -1 int 는 안되기때문에 Date로 형변환 후 처리하고 다시 String으로 만들어서 #end input에 담아야한다)
            var endDate = new Date(evt.endStr);  // 종료일을 Date 객체로 변환
            endDate.setDate(endDate.getDate() -1);  // 하루를 빼기

            var endDateString = endDate.toISOString().split('T')[0];  // YYYY-MM-DD 형식으로 변환
            $("#end").val(endDateString);  // 종료일 -1일을 'end' input에 입력  


            dayclickmodal.show();
          }
        });

        
        
        
        // 일정추가하는 모달창 이벤트
        $("#saveChanges").on("click", function () {
        	
        	
        	
        	var startDate = $("#start").val();  // 시작일
            var endDate = $("#end").val();  // 종료일

            // 종료일에 하루를 더해서 달력에 맞게 수정
            var endDateModified = new Date(endDate);
            endDateModified.setDate(endDateModified.getDate() + 1);  // 종료일에 하루를 더 추가

            var eventData = {
                title: $("#title").val(),
                start: startDate,
                end: endDateModified.toISOString().split('T')[0],  // 수정된 end 날짜를 YYYY-MM-DD 형식으로 변환
                color: $("#color").val(),
            };
        	
        	
        	
        	
        	
        	
        	
        	
          //var eventData = {
           // title: $("#title").val(),
           // start: $("#start").val(),
          //  end: $("#end").val() +2,
          //  color: $("#color").val(),
         // };
          
          
          
          //빈값입력시 오류
          if (
            eventData.title == "" ||
            eventData.start == "" ||
            eventData.end == ""
          ) {
            alert("입력하지 않은 부분이 있습니다.");

            //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
          } else if ($("#start").val() > $("#end").val()) {
            alert("날짜를 바르게 입력하세요.");
          } else {
            	
              // 이벤트 추가
              calendar.addEvent(eventData);
              $("#exampleModal").modal("hide");
            }

        
          
        
          
        
          
          
       // db에 일정 insert
       
      
       
       
       
          
          // DB에 일정 추가 AJAX 요청
             $.ajax({
               url: '${contextPath}/calendar/insertCalendar.do',  // 서버 URL
               type: 'POST',
               //contentType: 'application/json',  // JSON 형식으로 보내기
               data: {
             	  calTitle: $('#title').val(),  // jQuery를 사용하여 실제 값 가져오기
           	    calStartDt: $('#start').val(),
           	    calEndDt: $('#end').val(),
           	    calCategory: $('#calCategory').val(),  // 선택된 카테고리 값을 가져오기
           	    calRgb: $('#color').val()  // 선택된 색상을 가져오기
               },
               success: function(res) {
                 if (res > 0) {  // 성공적으로 일정이 추가되었을 때
                   alert('일정이 추가되었습니다.');
                   $('#dayclickmodal').modal('hide');  // 모달 닫기

                 } else {
                   alert('일정 추가에 실패했습니다. 다시 시도해주세요.');
                 }
               },
              
             });

             // 모달 닫기 및 폼 초기화
                                
                   $("#exampleModal").modal("hide");
                   $("#title").val("");
                   $("#start").val("");
                   $("#end").val("");
                   $("#color").val("");
           
             
             
             // /db에 일정 insert
             
        
            
            
          });

        calendar.render();

      });

    </script>



              <!-- fullcalendar cdn 프로그램 -->

              <script src="
              https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.js
              "></script>
              <link href="
              https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.css
              " rel="stylesheet">
    
    
    
    
    
  
    
    
    
    
    
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


   <div class="content-wrapper" style="height: 1100px;">
   <!-- 세션 시작 -->
    <div class="container-xxl flex-grow-1 container-p-y" style="display:flex; flex-direction: column;">
     <!-- 이쪽에 세션정보 넣어야합니다 -->
              
                    <!-- Filter -->
                  <div class="middle-all" style="padding-top: 30px; width:200px; height:50px; display:flex; flex-direction: column;">   

                      <div class="form-check form-check-secondary mb-5 ms-2" style="display:flex; flex-direction: row; width: 500px; height: 20px;">
                        <input
                          class="form-check-input select-all"
                          type="checkbox"
                          id="selectAll"
                          data-value="all"
                          checked />
                        <label class="form-check-label" for="selectAll" style=" width:50px;">전체</label>



                        <div class="app-calendar-events-filter text-heading" style="display:flex; flex-direction: row;">
                          <div class="form-check form-check-secondary mb-5 ms-2">
                            <input
                              class="form-check-input input-filter"
                              type="checkbox"
                              id="select-personal"
                              data-value="personal"
                              checked />
                            <label class="form-check-label" for="select-personal" style=" width:70px;">전사 일정</label>
                          </div>
                          <div class="form-check form-check-secondary mb-5 ms-2">
                            <input
                              class="form-check-input input-filter"
                              type="checkbox"
                              id="select-business"
                              data-value="business"
                              checked />
                            <label class="form-check-label" for="select-business" style=" width:50px;">팀 일정</label>
                          </div>
                          <div class="form-check form-check-secondary mb-5 ms-2">
                            <input
                              class="form-check-input input-filter"
                              type="checkbox"
                              id="select-family"
                              data-value="family"
                              checked />
                            <label class="form-check-label" for="select-family" style=" width:80px;">개인 일정</label>
                          </div>
                          
                        </div>
                      </div>
                    



                  </div>

                   



                  


                <!-- fullcalendar -->
                <div id='calendar' style="padding-top:10px;"></div>
                
                
    
    
    
    
    <!-- day 클릭시 모달 -->
    <div class="modal fade" id="dayclickmodal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered1 modal-simple modal-add-new-cc">
        <div class="modal-content" style="height: 620px;">
          <div class="modal-body">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="text-center mb-6">
              <h4 class="mb-2">일정</h4>
            </div>

              
              <div class="col-12 text-center" style="height:160px;">

                <label for="calCategory" style="float:left;">일정 종류</label>
                  <select
                    id="calCategory"
                    name="calCategory"
                    class="select2 form-select"
                    data-allow-clear="true" >
                    <option class="optionHover" value="선택" disabled selected style="display: none;">선택</option>
                    <option class="optionHover" value="전사 일정" class="optionHover">전사 일정</option>
                    <option class="optionHover" value="팀 일정" class="optionHover">팀 일정</option>
                    <option class="optionHover" value="개인 일정" class="optionHover">개인 일정</option>
                  </select>
                
                <label for="title" style="float:left; margin-top: 20px;">일정명</label>
                  <input
                    id="title"
                    name="title"
                    class="form-control credit-card-mask"
                    type="text"
                    aria-describedby="title2"
                    style="margin-bottom:20px;" />
                <label for="start" style="float:left;">시작일</label>
                  <input
                    id="start"
                    name="start"
                    class="form-control credit-card-mask"
                    type="date"
                    aria-describedby="title2"
                    style="margin-bottom:20px;" />
                <label for="end" style="float:left;">종료일</label>
                  <input
                    id="end"
                    name="end"
                    class="form-control credit-card-mask"
                    type="date"
                    aria-describedby="title2"
                    style="margin-bottom:20px;" />
    


                    
                  

                  <label for="color" style="float:left;">배경색</label>


                  <select
                    id="color"
                    name="color"
                    class="select2 form-select"
                    data-allow-clear="true">
                    
                    <option value="rgb(128, 108, 199)" class="companyCal" style="background-color: rgb(128, 108, 199);" selected>전사 일정</option>

                    <option value="rgb(28, 134, 221)" class="teamCal" style="background-color: rgb(28, 134, 221);" selected>팀 일정</option>

                    <option class="personalCal" value="선택" disabled selected style="display: none;">선택</option>
                    <option value="rgb(253, 191, 191)" class="personalCal" style="background-color: rgb(253, 191, 191); color:transparent;">연빨강</option>
                    <option value="rgb(255, 201, 165)" class="personalCal" style="background-color: rgb(255, 201, 165); color:transparent;">연주황</option>
                    <option value="rgb(255, 245, 191)" class="personalCal" style="background-color: rgb(255, 245, 191); color:transparent;">연노랑</option>
                    <option value="rgb(207, 253, 226)" class="personalCal" style="background-color: rgb(207, 253, 226); color:transparent;">연초록</option>
                    <option value="rgb(200, 247, 255)" class="personalCal" style="background-color: rgb(202, 240, 247); color:transparent;">연파랑</option>
                    <option value="rgb(201, 206, 255)" class="personalCal" style="background-color: rgb(201, 206, 255); color:transparent;">연남색</option>
                    <option value="rgb(238, 212, 255)" class="personalCal" style="background-color: rgb(238, 212, 255); color:transparent;">연보라</option>
                  </select>




                <button type="submit" class="btn btn-primary me-3" style="margin-top:30px;" id="saveChanges" data-bs-dismiss="modal">일정 추가</button>
                <button
                  type="reset"
                  class="btn btn-label-secondary btn-reset"
                  data-bs-dismiss="modal"
                  aria-label="Close" 
                  style="margin-top:30px;">
                  취소
                </button>
              </div>
              </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /day 클릭시 모달 -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
   
   <script>
      

      
            $(document).ready(function() {
                // #calCategory select에서 change 이벤트 발생 시
                $('#calCategory').change(function() {
                    // id="calCategory"에 들어있는 value 값 가져오기 ( val 은 jquery문 )
                    const selectedValue = $(this).val();

                    $('#color').html("");

                    let a = "";
                    if(selectedValue === '전사 일정'){
                      a = '<option value="rgb(128, 108, 199)" class="optionHover" style="background-color: rgb(128, 108, 199);">전사 일정</option>'
                    }else if(selectedValue === '팀 일정'){
                      a = '<option value="rgb(12, 114, 197)" class="optionHover" style="background-color: rgb(12, 114, 197);">팀 일정</option>'
                    }else{ // '개인 일정'
                      a += '<option value="rgb(253, 191, 191)" class="optionHover" style="background-color: rgb(253, 191, 191); color:transparent;" selected>연빨강</option>';
                      a += '<option value="rgb(255, 201, 165)" class="optionHover" style="background-color: rgb(255, 201, 165); color:transparent;">연주황</option>';
                      a += '<option value="rgb(255, 245, 191)" class="optionHover" style="background-color: rgb(255, 245, 191); color:transparent;">연노랑</option>'; 
                      a += '<option value="rgb(207, 253, 226)" class="optionHover" style="background-color: rgb(207, 253, 226); color:transparent;">연초록</option>';      
                      a += '<option value="rgb(200, 247, 255)" class="optionHover" style="background-color: rgb(202, 240, 247); color:transparent;">연파랑</option>';     
                      a += '<option value="rgb(201, 206, 255)" class="optionHover" style="background-color: rgb(201, 206, 255); color:transparent;">연남색</option>';     
                      a += '<option value="rgb(238, 212, 255)" class="optionHover" style="background-color: rgb(238, 212, 255); color:transparent;">연보라</option>';    
                    }

                    $('#color').html(a); // jQuery문으로 innerHTML에 넣는 구문이 .html이다.



                });
            });




    </script>
   
   
   
</body>
</html>