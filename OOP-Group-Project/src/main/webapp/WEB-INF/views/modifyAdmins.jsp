<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>
    
<!-- Include Header -->
<jsp:include page="header.jsp">
	<jsp:param value="TV Shows" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="sidebar.jsp"></jsp:include>

<%Admin admin = (Admin) request.getAttribute("admin");%>
<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
			
				<!-- main title -->
				<div class="col-12">
				<div id="msgbox-area" class="msgbox-area"></div>
					<div class="main__title">
						<h2>Modify Admin Details</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- content tabs -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
						<div class="col-12">
							<div class="row">
							
								<!-- details form -->
								<div class="col-12 col-lg-6">
									<form action="ModifyAdmins" class="profile__form" method="post">
										<div class="row">
										
											<div class="col-12">
												<h4 class="profile__title">Profile details</h4>
											</div>

											<input type="hidden" name="AdminID" value="<%out.print(admin.getAdminId()); %>">
											

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="email">E-mail</label>
													<input id="email" type="hidden" name="oldemail"  value="<%out.print(admin.getEmail()); %>">
													<input id="email" type="text" name="email" class="profile__input" placeholder="admin12@gmail.com" value="<%out.print(admin.getEmail()); %>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="firstname">First Name</label>
													<input id="firstname" type="text" name="firstname" class="profile__input" placeholder="John" value="<%out.print(admin.getFName()); %>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="lastname">Last Name</label>
													<input id="lastname" type="text" name="lastname" class="profile__input" placeholder="Doe" value="<%out.print(admin.getLName()); %>">
												</div>
											</div>
											
												<div class="col-12">
													<button class="profile__btn" type="submit">Save</button>
												</div>
										   
										</div>   
									</form>
								</div>
								<!-- end details form -->

								</div>
							</div>
						</div>	
					</div>
					<!-- end content tabs -->

					<div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
						
						<!-- modal delete -->
						<div id="modal-delete3" class="zoom-anim-dialog mfp-hide modal">
							<h6 class="modal__title">Admin delete</h6>
					
							<p class="modal__text">Are you sure to permanently delete this admin account?</p>
					
							<div class="modal__btns">
								<button class="modal__btn modal__btn--apply" type="button">Delete</button>
								<button class="modal__btn modal__btn--dismiss" type="button">Dismiss</button>
							</div>
						</div>
	                    <!-- end modal delete -->

					</div>
					</div>
					</div>
					</main>


<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
<%
	if(request.getParameter("add") != null){
		String add = request.getParameter("add");
		if(add.equals("true")) {
			out.print("msgboxbox.show('Admin successfully Modified');");
		}
		if(add.equals("false")) {
			out.print("msgboxbox.show('Admin Modifying failed');");
		}
	}
	%>
</script>