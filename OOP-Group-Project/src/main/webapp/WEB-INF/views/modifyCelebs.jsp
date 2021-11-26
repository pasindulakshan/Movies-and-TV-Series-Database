<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>

<%Celebrity c = (Celebrity) request.getAttribute("celebrity");%>

<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="TV Shows" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Modify celebrity</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="ModifyCelebs" class="form" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-12 col-md-5 form__cover">
								<div class="row">
									<div class="col-12 col-sm-6 col-md-12">
										<div class="form__img">
											<label for="form__img-upload">Upload a photo (270 x 400)</label>
											<input id="form__img-upload" name="form__img-upload" type="file" accept=".png, .jpg, .jpeg">
											<img id="form__img" src="#" alt=" ">
										</div>
									</div>
								</div>
							</div>
							
							<input type="hidden" name="cid" value="<%out.print(request.getParameter("cid")); %>">

							<div class="col-12 col-md-7 form__content">
								<div class="row">
									<div class="col-12">
									    <label class="profile__label" for="fname">First Name</label>
										<input type="text" class="form__input" name="fname" placeholder="First name" value="<%out.print(c.getFname());%>" required>
									</div>
									
									<div class="col-12">
									    <label class="profile__label" for="lname">Last Name</label>
										<input type="text" class="form__input" name="lname" placeholder="Last name" value="<%out.print(c.getLname());%>" required>
									</div>
									
                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <label class="profile__label" for="dob">Date Of Birth</label>
										<input type="text" class="form__input" name="dob" placeholder="Date Of Birth" value="<%out.print(c.getDob());%>" required>
									</div>
									
									<div class="col-12 col-sm-6 col-lg-3">
									    <label class="profile__label" for="country">Country</label>
										<input type="text" class="form__input" name="country" placeholder="Country" value="<%out.print(c.getCountry());%>" required>
									</div>
									
									<div class="col-12 col-sm-6 col-lg-3">
									    <label class="profile__label" for="height">Height</label>
										<input type="text" class="form__input" name="height" placeholder="Height" value="<%out.print(c.getHeight());%>" required>
									</div>
									
                                    <div class="col-12 col-sm-6 col-lg-3">
                                        <label class="profile__label" for="profession">Profession</label>
										<input type="text" class="form__input" name="profession" placeholder="Profession" value="<%out.print(c.getProfession());%>" required>
									</div>
                                    
									<div class="col-12">
									    <label class="profile__label" for="description">Description</label>
										<textarea id="text" name="description" class="form__textarea" placeholder="Description" required><%out.print(c.getDescription());%></textarea>
									</div>
									
									<div class="col-12">
									    <label class="profile__label" for="bio">Bio</label>
										<textarea id="text" name="bio" class="form__textarea" placeholder="Bio" required><%out.print(c.getBio());%></textarea>
									</div>									
											
								</div>
							</div>
							<div class="col-12">
										<button type="submit" type="button" class="form__btn">Save</button>
						
							</div>
						</div>
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>
	<!-- end main content -->

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>