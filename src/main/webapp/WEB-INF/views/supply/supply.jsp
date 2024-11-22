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
    <div class="container-xxl flex-grow-1 container-p-y" style="margin-top: 35px;">
     <!-- 이쪽에 세션정보 넣어야합니다 -->
    
    <!-- select - option 등으로 필터링, 오더링 넣기 -->
              <div class="btn-group">
                <button
                	id="categoryId"
                  type="button"
                  class="btn btn-label-secondary dropdown-toggle"
                  data-bs-toggle="dropdown"
                  aria-expanded="false">
                  카테고리별 조회
                </button>
                <ul class="dropdown-menu" >
							    <li><a class="dropdown-item" href="javascript:void(0);" onclick="updateButtonText(this)">전체
							    <input type="hidden" value="전체">
							    </a>
							    
							    </li>
							    
							    <li><a class="dropdown-item" href="javascript:void(0);" onclick="updateButtonText(this)">전자기기</a></li>
							    <li><a class="dropdown-item" href="javascript:void(0);" onclick="updateButtonText(this)">사무용품</a></li>
							    <li><a class="dropdown-item" href="javascript:void(0);" onclick="updateButtonText(this)">기타</a></li>
							  </ul>
              </div>



              <!-- 비품 신청서 버튼(포워딩) -->
              <button
                type="button"
                class="btn btn-outline-primary"
                style="float:inline-end; margin-left:10px;">
                비품 신청서
              </button>

              <!-- /비품 신청서 버튼 -->

              <!-- 비품 추가 모달 버튼 --> <!-- 지원팀만 보이게 -->
                <button
                  type="button"
                  class="btn btn-outline-primary"
                  data-bs-toggle="modal" 
                  data-bs-target="#addNewItem"
                  style="float:inline-end; margin-left:10px;">
                  비품 추가
                </button>

                <!-- 비품 신청 모달 버튼 ( 아직 구현안함 ) -->
                <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal" 
                data-bs-target="#applySupply"
                style="float:inline-end;">
                비품 신청
              </button>






              <!-- 비품 추가 모달창 -->
              <div class="modal fade" id="addNewItem" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
                  <div class="modal-content">
                    <div class="modal-body">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      <div class="text-center mb-6">
                        <h4 class="address-title mb-2" style="padding-bottom:30px;">비품 추가</h4>
                      </div>
                      <form id="addNewItemForm" class="row g-6" onsubmit="return false">
                        <div class="col-12">
                          <div class="row">
                            <div class="col-md mb-md-0 mb-4">
                              <div class="form-check custom-option custom-option-icon">
                                <label class="form-check-label custom-option-content" for="customRadioHome">
                                  <span class="custom-option-body">
                                    <svg
                                      width="28"
                                      height="28"
                                      viewBox="0 0 28 28"
                                      fill="none"
                                      xmlns="http://www.w3.org/2000/svg">
                                      <path
                                        opacity="0.2"
                                        d="M16.625 23.625V16.625H11.375V23.625H4.37501V12.6328C4.37437 12.5113 4.39937 12.391 4.44837 12.2798C4.49737 12.1686 4.56928 12.069 4.65939 11.9875L13.4094 4.03592C13.5689 3.88911 13.7778 3.80762 13.9945 3.80762C14.2113 3.80762 14.4202 3.88911 14.5797 4.03592L23.3406 11.9875C23.4287 12.0706 23.4992 12.1706 23.548 12.2814C23.5969 12.3922 23.6231 12.5117 23.625 12.6328V23.625H16.625Z" />
                                      <path
                                        d="M23.625 23.625V12.6328C23.623 12.5117 23.5969 12.3922 23.548 12.2814C23.4992 12.1706 23.4287 12.0706 23.3406 11.9875L14.5797 4.03592C14.4202 3.88911 14.2113 3.80762 13.9945 3.80762C13.7777 3.80762 13.5689 3.88911 13.4094 4.03592L4.65937 11.9875C4.56926 12.069 4.49736 12.1686 4.44836 12.2798C4.39936 12.391 4.37436 12.5113 4.375 12.6328V23.625M1.75 23.625H26.25M16.625 23.625V17.5C16.625 17.2679 16.5328 17.0454 16.3687 16.8813C16.2046 16.7172 15.9821 16.625 15.75 16.625H12.25C12.0179 16.625 11.7954 16.7172 11.6313 16.8813C11.4672 17.0454 11.375 17.2679 11.375 17.5V23.625"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round" />
                                    </svg>
                                    <span class="custom-option-title">첨부파일</span>
                                  </span>
                                  <input
                                    name="customRadioIcon"
                                    class="form-check-input"
                                    type="radio"
                                    value=""
                                    id="customRadioHome"
                                    checked />
                                </label>
                              </div>
                            </div>
                            




                            <div class="col-12" style="margin-top:20px;">
                              <label class="form-label" for="supplycategory">카테고리</label>
                              <select
                                id="supplycategory"
                                name="supplycategory"
                                class="select2 form-select"
                                data-allow-clear="true">
                                <option value="전자기기">전자기기</option>
                                <option value="사무용품">사무용품</option>
                                <option value="기타">기타</option>
                              </select>
                            </div>



                          </div>
                        </div>
                        <div class="col-12" style="margin-top:20px;">
                          <label class="form-label" for="modalAddressFirstName">비품명</label>
                          <input
                            type="text"
                            id="modalAddressFirstName"
                            name="modalAddressFirstName"
                            class="form-control" />
                        </div>
                        <div class="col-12" style="margin-top:20px;">
                          <label class="form-label" for="modalAddressLastName">모델명</label>
                          <input
                            type="text"
                            id="modalAddressLastName"
                            name="modalAddressLastName"
                            class="form-control"/>
                        </div>


                        <div class="col-12" style="margin-top:20px;">
                          <label class="form-label" for="repairHistory">수리내역</label>
                          <select
                            id="repairHistory"
                            name="repairHistory"
                            class="select2 form-select"
                            data-allow-clear="true">
                            <option value="O">O</option>
                            <option value="X">X</option>
                          </select>
                        </div>

                        <!-- 수리내역이 O 일 때만 나타나게? -->

                        <div class="col-12" style="margin-top:20px;">
                          <label class="form-label" for="modalAddressLastName">수리 상세 내용</label>
                          <input
                            type="text"
                            id="modalAddressLastName"
                            name="modalAddressLastName"
                            class="form-control" />
                        </div>

                        <!-- 상태 select에만 x표시 뜨는거 수정해보기 -->
                        <div class="col-12" style="margin-top:20px;">
                          <label class="form-label" for="modalAddressCountry">상태</label>
                          <select
                            id="modalAddressCountry"
                            name="modalAddressCountry"
                            class="select2 form-select"
                            data-allow-clear="true">
                            <option value="정상">정상</option>
                            <option value="고장">고장</option>
                            <option value="수리중">수리중</option>
                          </select>
                        </div>


                        
                        <div class="col-12 text-center" style="margin-top:50px;">
                          <button type="submit" class="btn btn-primary me-3">추가</button>
                          <button
                            type="reset"
                            class="btn btn-label-secondary"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                            취소
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>

              <!-- /비품 추가 모달창 -->




              <!-- 비품 신청 모달창 -->
              <div class="modal fade" id="applySupply" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-simple modal-add-new-address">
                  <div class="modal-content" style="width:600px;">
                    <div class="modal-body">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      <div class="text-center mb-6">
                        <h4 class="address-title mb-2" style="padding-bottom:30px;">비품 신청</h4>
                      </div>
                      <form id="applySupplyForm" class="row g-6" onsubmit="return false">
                        <div class="col-12 col-md-6" style="margin-top:20px; width:500px;">
                          <label class="form-label" for="supplyCategory">카테고리</label>
                          <select
                            id="supplyCategory"
                            name="supplyCategory"
                            class="select2 form-select"
                            data-allow-clear="true">
                            <option value="" disabled selected hidden>선택</option>
                            <option value="전자기기">전자기기</option>
                            <option value="사무용품">사무용품</option>
                            <option value="기타">기타</option>
                          </select>
                        </div>

                        <div class="col-12" style="margin-top:20px; width:500px;">
                          <label class="form-label" for="supplyType">비품 종류</label>
                          <select
                            id="supplyType"
                            name="supplyType"
                            class="select2 form-select"
                            data-allow-clear="true">
                            <option value="선택" disabled selected style="display:none;">선택</option>
                            <option value="컴퓨터 본체">컴퓨터 본체</option>
                            <option value="노트북">노트북</option>
                            <option value="마우스">마우스</option>
                            <option value="결제 단말기">결제 단말기</option>
                            <option value="키보드">키보드</option>
                            <option value="복합기">복합기</option>
                            <option value="빔 프로젝터">빔 프로젝터</option>
                          </select>
                        </div>


                        <div class="col-12 text-center" style="margin-top:50px;">
                          <button type="submit" class="btn btn-primary me-3">신청</button>
                          <button
                            type="reset"
                            class="btn btn-label-secondary"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                            취소
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>

              <!-- /비품 신청 모달창 -->







                            




                            






















              <!-- Category List Table -->
              <div class="card" style="margin-top:10px;"> 
                <div class="card-datatable ">
                  <table class="table border-top">
                    <thead>
                      <tr style="height:30px;">
                        <th style="text-align:center; width:150px;">카테고리</th>
                        <th style="text-align:center;">비품종류</th>
                        <th style="text-align:center;">잔여 재고</th>
                        <th style="text-align:center;">정상</th>
                        <th style="text-align:center;">수리중</th>
                        <th style="text-align:center;">지급 현황<!-- 지원팀만 이 열이 보이게 --></th>
                      </tr>
                    </thead>
                    <tbody id="tbodyId">
                  <!--  
                      <c:choose>
									<c:when test="${ empty list }">
										<tr style="height:55px;">
											<td colspan="${ loginUser.deptCode != 'S3' ? 6 : 5 }" style="text-align:center;">조회된 비품이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="s" items="${ list }">
											<tr style="height:55px;" onclick="location.href='${contextPath}/supply/supply.do?no=${s.supNo}'">
												<td style="text-align:center; width:150px;">${ s.supCategory }</td>
                        <td style="text-align:center;"> ${ s.supType } &nbsp;
                          <button type="button" class="btn rounded-pill btn-outline-primary btn btn-sm">정보</button>
                        </td>
                        <td style="text-align:center;"> ${ s.leftSupply } </td>
                        <td style="text-align:center;"> ${ s.repairSupply } </td>
                        <td style="text-align:center;"> ${ s.workSupply } </td>
                        <td style="text-align:center;">
                          <button type="button" class="btn rounded-pill btn-outline-info btn btn-sm">상세보기</button>
                        </td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								 -->   
                    </tbody>
                  </table>

                  <!-- 페이징바 -->


                  
                <!-- 페이징바 , 클릭한 숫자에 클래스에 active 추가하기 -->
                <div class="card-body" style="justify-items: center;">
                  <div class="row">
                    <div class="col-lg-6">
                      
                      <div class="demo-inline-spacing">
                        <!-- Basic Pagination -->
                        <nav aria-label="Page navigation">
                          <ul class="pagination">
                            <li class="page-item first">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevrons-left ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevron-left ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">1</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">2</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">3</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">4</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">5</a>
                            </li>
                            <li class="page-item next">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevron-right ti-sm"></i
                              ></a>
                            </li>
                            <li class="page-item last">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="ti ti-chevrons-right ti-sm"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>
                        <!--/ Basic Pagination -->
                       
                      </div>
                    </div>
                  
                  </div>
                </div>

                <!-- /페이징바 -->
                </div>
              </div>




                
            </div>
            
            
           <!-- Session End -->
    
    
    
    
    </div>
   <!-- 세션 끝 -->


	    <script>
	    
	    $(document).ready(function(){
	    	
	    	selectSupplyList("전체", 1);
		  })
	    
	    
	  // 버튼에 선택된 항목 텍스트를 업데이트하는 함수
	  function updateButtonText(element) {
		  
		  console.log("updateButtonText함수 실행됨");
	    const button = element.closest('.btn-group').querySelector('button');
	    
	    button.innerHTML = element.innerHTML;
	    
	    
	    
	    
	    selectSupplyList(element.innerText, 1);
	  }
	  
		// 현재 선택되어있는 카테고리에 맞춰서 리스트 조회하는 ajax
		
	  function selectSupplyList(category, pageNo){ 
			
			
		    $.ajax({
				  url: '${contextPath}/supply/list.do', // ajax로 리스트 조회용 controller 따로 호출
				  type: 'GET',
				  data: {
					  supCategory: category,
					  pageNo: pageNo
				  },
				  success: function(res){
					  
					  console.log(res.list);  // {pi: {}, list: []}
					  
					  let a = "";
					  for(let i=0; i<res.list.length; i++){
						  a += "<tr style='height:55px;'>"
							     +		"<td style='text-align:center; width:150px;'>" + res.list[i].supCategory + "</td>"
							     +		"<td style='text-align:center;'>" + res.list[i].supType 
							     +
							     				"<button style='margin-left: 10px;' type='button' class='btn rounded-pill btn-outline-primary btn btn-sm'>" + '정보' + "</button>"
							     +		"</td>"
							     +		"<td style='text-align:center;'>" + res.list[i].leftSupply + "</td>"
							     +		"<td style='text-align:center;'>" + res.list[i].repairSupply + "</td>"
							     +		"<td style='text-align:center;'>" + res.list[i].workSupply + "</td>"
							     +		"<td style='text-align:center;'>" 
							     +
									  			"<button type='button' class='btn rounded-pill btn-outline-info btn btn-sm'>" + '상세보기' + "</button>"			
									 +		"</td>"
									 +  "</tr>"
					  }
					  $("#tbodyId").html(a);
					  
					  
				  }
			  }) 
	  }
	  
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