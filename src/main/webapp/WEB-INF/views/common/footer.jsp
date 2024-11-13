<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


 <footer class="content-footer footer bg-footer-theme">
   <div class="container-xxl">
     <div
       class="footer-container d-flex align-items-center justify-content-between py-4 flex-md-row flex-column">
       <div class="text-body">
         ©
         <script>
           document.write(new Date().getFullYear());
         </script>
         , made by Cruella 
       </div>
       <div class="d-none d-lg-inline-block">
         <a href="#" class="footer-link me-4" target="_blank"
           >홈</a
         >
         <a href="#" target="_blank" class="footer-link me-4"
           >전자 결재</a
         >

         <a
           href="#"
           target="_blank"
           class="footer-link me-4"
           >공지사항</a
         >

         <a href="#" target="_blank" class="footer-link d-none d-sm-inline-block"
           >일정관리</a
         >
       </div>
     </div>
   </div>
 </footer>