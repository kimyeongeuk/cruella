<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> 
<script>
const sock = new SockJS("${contextPath}/cruella"); 
sock.onmessage = onMessage;

function onMessage(evt){
	console.log(evt.data);
}

</script>



			    <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="ti ti-menu-2 ti-md"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item navbar-search-wrapper mb-0">
                  <a class="nav-item nav-link search-toggler d-flex align-items-center px-0" href="javascript:void(0);">
                    <i class="ti ti-search ti-md me-2 me-lg-4 ti-lg"></i>
                    <span class="d-none d-md-inline-block text-muted fw-normal">Search (Ctrl+/)</span>
                  </a>
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Language -->
                
                <!--/ Language -->

                <!-- Style Switcher -->
                <li class="nav-item dropdown-style-switcher dropdown">
                  <a
                    class="nav-link btn btn-text-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <i class="ti ti-md"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-styles">
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                        <span class="align-middle"><i class="ti ti-sun ti-md me-3"></i>Light</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                        <span class="align-middle"><i class="ti ti-moon-stars ti-md me-3"></i>Dark</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                        <span class="align-middle"
                          ><i class="ti ti-device-desktop-analytics ti-md me-3"></i>System</span
                        >
                      </a>
                    </li>
                  </ul>
                </li>
                <!-- / Style Switcher-->

                <!-- Quick links  -->
               
                <!-- Quick links -->

                <!-- 알림 -->
                <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-2">
                  <a
                    class="nav-link btn btn-text-secondary btn-icon rounded-pill dropdown-toggle hide-arrow"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    <span class="position-relative">
                      <i class="ti ti-bell ti-md"></i>
                      <span class="badge rounded-pill bg-danger badge-dot badge-notifications border"></span>
                    </span>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end p-0">
                    <li class="dropdown-menu-header border-bottom">
                      <div class="dropdown-header d-flex align-items-center py-3">
                        <h6 class="mb-0 me-auto">알림</h6>
                      </div>
                    </li>
                    
                 <c:forEach var="al" items="${ alert }"> 
                 	<c:if test="${ loginUser.memNo eq al.memNo }">
	                    <li class="dropdown-notifications-list scrollable-container">
	                      <ul class="list-group list-group-flush">
	                        <li class="list-group-item list-group-item-action dropdown-notifications-item">
	                          <div class="d-flex">
	                            <div class="flex-shrink-0 me-3">
	                              <div class="avatar">
	                                <img src="${ contextPath }<c:out value='${ loginUser.profileURL }' default='/assets/img/default_profile.png' />" alt="Avatar" class="rounded-circle" />
	                              </div>
	                            </div>
	                            <div class="flex-grow-1">
	                              <small class="mb-1 d-block text-body">${ al.alertContent }</small>
	                              <small class="text-muted">${ al.alertRegistDate }</small>
	                            </div>
	                            <div class="flex-shrink-0 dropdown-notifications-actions">
	                              <a href="javascript:void(0)" class="dropdown-notifications-archive">
	                              <span class="ti ti-x"></span>
	                              </a>
	                            </div>
	                          </div>
	                        </li>
	                      </ul>
	                    </li>
                    </c:if>
                  </c:forEach>
                    
                    
                    
                    
                  </ul>
                </li>
                <!--/ 알림 -->

                <!-- 유저정보 -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a
                    class="nav-link dropdown-toggle hide-arrow p-0"
                    href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item mt-0" href="${contextPath}/member/myinfo.do">
                        <div class="d-flex align-items-center">
                          <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                              <img src="${ contextPath }/resources/assets/img/avatars/1.png" alt class="rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">${loginUser.memName}</h6>
                            <small class="text-muted">${loginUser.deptName}</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider my-1 mx-n2"></div>
                    </li>
                   
                    <li>
                      <div class="d-grid px-2 pt-2 pb-1">
                      <form action="${contextPath}/member/logout.do" method="POST">
                        <button type="submit" class="btn btn-sm btn-danger d-flex" style="justify-self: center;">
                          <small class="align-middle">Logout</small>
                          <i class="ti ti-logout ms-2 ti-14px"></i>
                        </button>
                       </form>
                      </div>
                    </li>
                  </ul>
                </li>
                <!--/ 유저정보 -->
              </ul>
            </div>

            <!-- Search Small Screens -->
            <div class="navbar-search-wrapper search-input-wrapper d-none">
              <input
                type="text"
                class="form-control search-input container-xxl border-0"
                placeholder="Search..."
                aria-label="Search..." />
              <i class="ti ti-x search-toggler cursor-pointer"></i>
            </div>
          </nav>