<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en"
	class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
	dir="ltr" data-theme="theme-default"
	data-assets-path="${ contextPath }/assets/" data-template="views"
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
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
			<!-- 헤더 끝 -->

			<div class="layout-page">

				<!-- nav 시작 -->
				<jsp:include page="/WEB-INF/views/common/nav.jsp" />
				<!-- nav 끗 -->


				<div class="content-wrapper">
					<!-- 세션 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- 이쪽에 세션정보 넣어야합니다 -->


						<div class="row">
							<div class="col-md-12">
								<div class="nav-align-top">
									<ul
										class="nav nav-pills flex-column flex-sm-row mb-6 gap-2 gap-lg-0">

										<li class="nav-item"><a class="nav-link" href="#"> <i
												class="ti-sm ti ti-user-check me-1_5"></i> 직원등록
										</a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 직원조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 출근기록조회 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 근무시간조회 </a></li>

										<li class="nav-item"><a class="nav-link active" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여지급 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 급여내역확인 </a></li>

										<li class="nav-item"><a class="nav-link" href="#"><i
												class="ti-sm ti ti-users me-1_5"></i> 조직도 </a></li>

									</ul>
								</div>
							</div>
						</div>





						<div
							class="faq-header d-flex flex-column justify-content-center align-items-center " style="margin-bottom: -36px;">
							<img src="${contextPath }/assets/img/pages/header.png" class=""
								alt="background image" style="width: 100%; height: 102px;" />
							<div class="input-wrapper mt-4 input-group input-group-merge"
								style="position: relative; bottom: 84px; background: white; width: 52%;">
								<span class="input-group-text" id="basic-addon1"><i
									class="ti ti-search"></i></span> <input type="text"
									class="form-control" placeholder="Search articles..."
									aria-label="Search" aria-describedby="basic-addon1" />
							</div>
						</div>



						<div class="card">
							<div class="d-flex">
								<h5 class="card-header" style="width: 15%;">급여 지급</h5>

								<div style="display: flex;">
								
								
								<h5 class="card-header"
										style="display: flex; align-items: center;">
										<select id="provide_status" class="form-select"
											style="width: 100px; margin-right: 10px;">
											
												
												<option value="" selected>선택</option>
												<option value="Y">지급</option>
												<option value="N">미지급</option>
										
											
										</select> 
									</h5>
								
								
								
									<h5 class="card-header"
										style="display: flex; align-items: center;">
										<select id="yearSelect" class="form-select"
											style="width: 100px; margin-right: 10px;">
											
												<option value="" selected>선택</option>
											<c:forEach var="y" begin="4" end="4" step="1">
												<option value="2${y}">202${y}</option>
											</c:forEach>
											
										</select> <span>년</span>
									</h5>
									
									
									
									<h5 class="card-header"
										style="display: flex; align-items: center; padding: 0;">
										<select id="monthSelect" class="form-select"
											style="width: 90px; margin-right: 10px;">
											
											<option value="" selected>선택</option>
											<c:forEach var="i" begin="10" end="12" step="1">
												<option value="${i}">${i}</option>
											</c:forEach>
											
										</select> <span>월</span>
									</h5>
									
									
									
									
									
								</div>

								<button type="button" class="btn btn-primary"
									id="select_sal_date"
									style="width: 110px; height: 42px; position: relative; top: 20px; left: 21px;">검색</button>




								<script>
										
												$(document).ready(function(){
													
													$('#select_sal_date').on('click',function(){
													
															let year = $('#yearSelect').val();
															let month = $('#monthSelect').val();
															let provide = $('#provide_status').val();
															
															location.href = "${contextPath}/member/salarypayment2.do?year=" + year + "&month=" + month + "&provide=" + provide;
														
													})
													
												})
											
										</script>																												  						


								<div
									style="width: 75%; align-items: center; justify-content: right;"
									class="d-flex"></div>
								<div
									style="width: 10%; text-align: right; align-content: center; margin-right: 15px;">

									<button type="button"
										class="btn btn-primary waves-effect waves-light" id="pay_btn" style="width:102px;">급여지급</button>
								</div>
							</div>
							<div class="table-responsive text-nowrap">
								<table class="table" style="text-align: center;">

									<tr>
										<th
											class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
											rowspan="2" colspan="1"><input type="checkbox"
											class="form-check-input"></th>
										<th rowspan="2">사번</th>
										<th rowspan="2">사원명</th>
										<th rowspan="2">부서</th>
										<th rowspan="2">직급</th>
										<th rowspan="2" style="text-align: center;">기본급</th>
										<th colspan="4" style="text-align: center;">공제항목</th>
										<th rowspan="2">지급예정금액</th>
										<th rowspan="2">지급날짜</th>
										<th rowspan="2">급여명세표</th>

									</tr>
									<tr>

										<th>국민연금</th>
										<th>건강보험</th>
										<th>고용보험</th>
										<th>장기요양</th>

									</tr>
									</thead>
									<tbody class="table-border-bottom-0">
									
									<c:if test="${ not empty list }">
										<c:forEach var="member" items="${list}">
											<tr>
												<td><input type="checkbox" class="dd form-check-input" value="${ member.memNo }" >
												</td>
												<!-- 사번 -->
												<td><span>${member.memNo}</span></td>
												<!-- 사원명 -->
												<td>${member.memName}</td>
												<!-- 부서명 -->
												<td>${member.deptName}</td>
												<!-- 직급명 -->
												<td>${member.posName}</td>
												<!-- 기본급 -->
												<td>${member.salary}</td>
												<!-- 국민연금 -->
												<td>${member.pension}</td>
												<!-- 건강보험 -->
												<td>${member.health}</td>
												<!-- 고용보험 -->
												<td>${member.employment}</td>
												<!-- 장기요양 -->
												<td>${member.care}</td>
												<!-- 지급예정금액 -->
												<td>${member.totalSalary}</td>
												<!-- 지급날짜 -->
												<td>${member.paymentDate}</td>
												<!-- 급여명세표 -->
												<td>
												
												<c:if test="${member.salStatus eq 'Y' }">
												
													<form action="${contextPath }/member/paystub.do" method="post" id="submit_btn">
													
													
														<input type="hidden" value="${member.memNo}" name="memNo">
														<i class="pay_icon far fa-file-alt"></i>
													
													
													</form>
												</c:if>
												
												</td>
											</tr>
										</c:forEach>
										</c:if>
										
										<script>
										
										$(document).on('click', '.pay_icon', function () {
										    $(this).closest('form').submit(); 
										});
										
										</script>
										
								
										
										
										<c:if test="${ empty list}">
										<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td style="height: 92px;">조회된 결과가 없습니다</td>
												
												
											</tr>
											
										
										</c:if>
										
										
										
									</tbody>

								</table>
							</div>
						</div>

						<script>
						$(document).ready(function () {

						    $('#pay_btn').on('click', function () {
						        const check = [];
						        $('.dd:checked').each(function () {
						            var memNo = $(this).val();
						            check.push(memNo);
						        });

						        if (check.length == 0) {
						            alert('사원을 체크해주세요');
						            return;
						        }

						        const year = $('#yearSelect').val();
						        const month = $('#monthSelect').val();

						        if (!year || !month) {
						            alert('년도와 월을 선택해주세요.');
						            return;
						        }

						        if (confirm('급여를 지급하시겠습니까?')) {
						           

						                    // 2. 급여 지급 로직 실행
						                    $.ajax({
						                        url: '${contextPath}/member/payBtn.do',
						                        contentType: 'application/json',
						                        type: 'POST',
						                        data: JSON.stringify({ memNo: check }),
						                        success: function (payRes) {
						                            if (payRes > 0) {
						                                alert('성공적으로 지급되었습니다.');
						                                location.href = '${contextPath}/member/salarypayment.do';
						                            } else {
						                                alert('지급할 급여 정보가 없습니다.');
						                            }
						                        },
						                        
						                        })
						                    }
						                });
						                
						            });
						      
						   

						

						</script>


					</div>



				</div>
				<!-- 세션 끝 -->



				<!-- 푸터 시작 -->
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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