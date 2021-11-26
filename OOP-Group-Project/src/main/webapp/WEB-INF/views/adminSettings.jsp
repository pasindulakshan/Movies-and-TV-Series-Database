<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>

<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="TV Shows" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

<!-- main content -->
	<main class="main">
	<div id="msgbox-area" class="msgbox-area"></div>
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Admin Settings</h2>
					</div>
				</div>
				<!-- end main title -->

				
						
					</div>
				</div>
				<!-- end profile -->
				
				<!-- content tabs -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
						<div class="col-12">
							<div class="row">
							
								<!-- details form -->
								<div class="col-12 col-lg-6">
									<form action="AdminSettings" class="profile__form" method="post">
										<div class="row">
										
											<div class="col-12">
											
												<h4 class="profile__title">Profile details</h4>
											</div>
											
											<%Admin ad = (Admin) request.getAttribute("admin");%>

									
											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="email" >E-mail</label>
													<input id="email" type="text" name="email" class="profile__input" placeholder="admin12@gmail.com" value="<%out.print(ad.getEmail());%>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="firstname">First Name</label>
													<input id="firstname" type="text" name="fname" class="profile__input" placeholder="John" value="<%out.print(ad.getFName());%>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="lastname">Last Name</label>
													<input id="lastname" type="text" name="lname" class="profile__input" placeholder="Doe" value="<%out.print(ad.getLName());%>">
												</div>
											</div>
											
												<div class="col-12">
													<button class="profile__btn" type="Submit">Save</button>
												</div>
										   
										</div>   
									</form>
								</div>
								<!-- end details form -->
								
								<!-- password form -->
								<div class="col-12 col-lg-6">
									<form action="AdminChangePassword" class="profile__form" method="post">
										<div class="row">
											<div class="col-12">
											<div id="msgbox-area" class="msgbox-area"></div>
												<h4 class="profile__title">Change password</h4>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="oldpass">Old Password</label>
													<input id="oldpass" type="password" name="oldpass" class="profile__input">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="newpass">New Password</label>
													<input id="newpass" type="password" name="newpass" class="profile__input">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="confirmpass">Confirm New Password</label>
													<input id="confirmpass" type="password" name="confirmpass" class="profile__input">
												</div>
											</div>

											<div class="col-12">
												<button class="profile__btn" type="submit">Change</button>
											</div>
										</div>
									</form>
								</div>
								<!-- end password form -->
								

								</div>
							</div>
						</div>	
					</div>
					<!-- end content tabs -->
			
					</main>


<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
<%
	if(request.getParameter("status") != null){
		String add = request.getParameter("status");
		if(add.equals("strue")) {
			out.print("msgboxbox.show('Details updated');");
		}
		if(add.equals("sfalse")) {
			out.print("msgboxbox.show('Settings update failed');");
		}
		if(add.equals("pmissmatch")) {
			out.print("msgboxbox.show('Password missmatch');");
		}
		if(add.equals("emailExits")) {
			out.print("msgboxbox.show('Email alreday exists');");
		}
		if(add.equals("ptrue")) {
			out.print("msgboxbox.show('Password Changed');");
		}
		if(add.equals("pfalse")) {
			out.print("msgboxbox.show('Password Changed Failed');");
		}
		if(add.equals("wrongpass")) {
			out.print("msgboxbox.show('Wrong Password');");
		}
	}
	%>
</script>