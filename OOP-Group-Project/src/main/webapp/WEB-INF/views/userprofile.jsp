<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.*"%>
<jsp:include page="main-header.jsp">
	<jsp:param value="User Profile" name="title"/>
</jsp:include>

<div class="hero user-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1><%out.print((String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname")); %>'s profile</h1>
					<ul class="breadcumb">
						<li class="active"><a href="home">Home</a></li>
						<li> <span class="ion-ios-arrow-right"></span>Profile</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="page-single">
	<div class="container">
		<div class="row ipSad-width">
			<div class="col-md-3 col-sm-12 col-xs-12">
				<div class="user-information">
					<div class="user-img">
						<a href="#"><img src="images/uploads/user-img.png" alt=""><br></a>
						<a href="#" class="redbtn">Change avatar</a>
					</div>
					<div class="user-fav">
						<p>Account Details</p>
						<ul>
							<li  class="active"><a href="#">Profile</a></li>
							<li><a href="#">Favorite movies</a></li>
							<li><a href="#">Rated movies</a></li>
						</ul>
					</div>
					<div class="user-fav">SS
						<p>Others</p>
						<ul>
							<li><a href="#">Delete Account</a></li>
							<li><a href="UserLogout">Log out</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="form-style-1 user-pro">
					<form action="UserSettings" class="user" method="post">
					<%User u = (User) request.getAttribute("user");%>
						<h4>01. Profile details</h4>
						<div class="row">
							<div class="col-md-12 form-it">
								<label>Email Address</label>
								<input type="text" name="email" placeholder="edward@kennedy.com" value="<%out.print(u.getEmail());%>">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-it">
								<label>First Name</label>
								<input type="text" name="fname" placeholder="Edward " value="<%out.print(u.getFirstName());%>">
							</div>
							<div class="col-md-6 form-it">
								<label>Last Name</label>
								<input type="text" name="lname" placeholder="Kennedy" value="<%out.print(u.getLastName());%>">
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<input class="submit" type="submit" value="save">
							</div>
						</div>	
					</form>
					<form action="UserChangePass" class="password" method="post">
						<h4>02. Change password</h4>
						<div class="row">
							<div class="col-md-6 form-it">
								<label>Old Password</label>
								<input name="oldpassword" type="password" placeholder="**********">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-it">
								<label>New Password</label>
								<input name="newpassword" type="password" placeholder="***************">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-it">
								<label>Confirm New Password</label>
								<input name="confirmpassword" type="password" placeholder="*************** ">
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<input class="submit" type="submit" value="change">
							</div>
						</div>	
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Include Footer -->
<jsp:include page="main-footer.jsp"></jsp:include>