<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .container {
            width: 600px;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 10px 10px;
            padding-bottom: 50px;
        }
        .title {
            text-align: center;
            font-size: x-large;
            font-weight: bold;
            margin-bottom: 70px;
            margin-top: 70px;
        }
        .salary-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        .salary-table th, .salary-table td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
            font-size: 0.9em;
        }
        .salary-table .section-title {
            font-weight: bold;
        }
        .total-row {
            font-weight: bold;
            text-align: right;
        }
        .total-amount {
            color: blue;
            font-weight: bold;
        }
        .deduction-amount {
            color: red;
            font-weight: bold;
        }
        .net-pay {
            text-align: right;
            font-weight: bold;
            margin-top: 50px;
            font-size: 1em;
        }
        /* Remove bottom border for "지급 항목" and "공제 항목" row */
        .no-border th {
            border-bottom: none;
        }
    </style>
</head>
<body>

	<div style="width: 77%; text-align: right;">
		<div style="display: flex; justify-content: left;">

			<span style="position: relative; left: 89%; cursor: pointer;" id="pdfDownloadButton">
				<img src="${contextPath}/resources/assets/img/free-icon-pdf-5453995.png" style="width: 38px;" />
			</span>


		</div>
	</div>

	<div class="container" id="content_div">
		<div class="title">9월 급여명세서</div>
		<p>지급일: ${list.paymentDate }</p>
		<table class="salary-table">
			<tr>
				<td style="background-color: lightgray;">부서</td>
				<td>${ list.deptName }</td>
				<td style="background-color: lightgray;">직급</td>
				<td>${ list.posName }</td>
			</tr>
			<tr>
				<td style="background-color: lightgray;">성명</td>
				<td>${ list.memName }</td>
				<td style="background-color: lightgray;">입사일</td>
				<td>${ list.hireDate }</td>
			</tr>
			<tr class="no-border" style="background-color: lightgray;">
				<th colspan="2" style="height: 40px;">지급 항목</th>
				<th colspan="2">공제 항목</th>
			</tr>
			<tr>
				<td>기본급</td>
				<td>${ list.salary }</td>
				<td>국민연금</td>
				<td>${ list.pension }</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>건강보험</td>
				<td>${ list.health }</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>고용보험</td>
				<td>${ list.employment }</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>장기요양</td>
				<td>${ list.care }</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr class="total-row">
				<td class="section-title">지급 총액</td>
				<td class="total-amount">${ list.salary }</td>
				<td class="section-title">공제 총액</td>
				<td class="deduction-amount"><c:set var="deductionTotal"
						value="${list.pension + list.health + list.employment + list.care}" />
					${deductionTotal}</td>
			</tr>
		</table>
		<p class="net-pay">실지급액: ${ list.totalSalary } 원정</p>
	</div>



<script>
$(document).ready(function() {
    function pdf_down() {
        const element = document.getElementById('content_div');  // PDF로 변환할 요소
        const userName = '${ list.memName }';  // 사용자 이름
        
        const options = {
            margin: 10,    // 여백
            filename: '급여명세서_' + userName + '.pdf',  // 파일 이름
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 1 },  // 해상도 설정
            jsPDF: { unit: 'mm', format: 'a3', orientation: 'portrait' }
        };

        // html2pdf 라이브러리를 사용하여 선택한 요소를 PDF로 변환
        html2pdf()
            .from(element)   // PDF로 변환할 요소
            .set(options)     // 옵션 설정
            .save();          // PDF 파일 저장
    }

    // 이벤트 바인딩
    $('#pdfDownloadButton').on('click', pdf_down);
});
</script>









</body>
</html>