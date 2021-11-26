<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>

<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="TV Shows" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

<%User u = (User) request.getAttribute("user");%>
<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
				<div id="msgbox-area" class="msgbox-area"></div>
					<div class="main__title">
						<h2>Modify User Details</h2>
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
									<form action="ModifyUser" class="profile__form" method="post">
										<div class="row">
										
											<div class="col-12">
												<h4 class="profile__title">Profile details</h4>
											</div>

											<input type="hidden" name="uid" value="<%out.print(u.getId()); %>">
											

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="email">E-mail</label>
													<input id="email" type="hidden" name="oldemail"  value="<%out.print(u.getEmail()); %>">
													<input id="email" type="text" name="email" class="profile__input" placeholder="admin12@gmail.com" value="<%out.print(u.getEmail()); %>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="firstname">First Name</label>
													<input id="firstname" type="text" name="firstname" class="profile__input" placeholder="John" value="<%out.print(u.getFirstName()); %>">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="lastname">Last Name</label>
													<input id="lastname" type="text" name="lastname" class="profile__input" placeholder="Doe" value="<%out.print(u.getLastName()); %>">
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
		</div>
	</div>
</main>

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	<%
	if(request.getParameter("umodify") != null){
		String mdelete = request.getParameter("umodify");
		if(mdelete.equals("emailExits")) {
			out.print("msgboxbox.show('Email already exists');");
		}
	}
	if(request.getParameter("umodify") != null){
		String mmodify = request.getParameter("umodify");
		if(mmodify.equals("failed")) {
			out.print("msgboxbox.show('User update failed');");
		}
	}
	%>
	
</script>
