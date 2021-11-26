
<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="TV Shows" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="sidebar.jsp"></jsp:include>

<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
				<div id="msgbox-area" class="msgbox-area"></div>
					<div class="main__title">
						<h2>Add New Admin</h2>
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
								
									<form action="AddAdmins" class="profile__form" method="post">
										<div class="row">
											<div class="col-12">
												<h4 class="profile__title">Profile details</h4>
											</div>

											

											<div class="col-12 col-md-6 col-lg-12 col-xl-12">
												<div class="profile__group">
													<label class="profile__label" for="email">E-mail</label>
													<input id="email" type="text" name="email" class="profile__input" placeholder="admin12@gmail.com">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="firstname">First Name</label>
													<input id="firstname" type="text" name="firstname" class="profile__input" placeholder="John">
												</div>
											</div>

											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="lastname">Last Name</label>
													<input id="lastname" type="text" name="lastname" class="profile__input" placeholder="Doe">
												</div>
											</div>
											
											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="password">Password</label>
													<input id="password" type="password" name="password" class="profile__input" placeholder="">
												</div>
											</div>
											
											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
												<div class="profile__group">
													<label class="profile__label" for="Cpassword">Confirm Password</label>
													<input id="Cpassword" type="password" name="Cpassword" class="profile__input" placeholder="">
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
					
					
					</main>
						
						


<!-- Include Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
<%
	if(request.getParameter("status") != null){
		String add = request.getParameter("status");
		if(add.equals("true")) {
			out.print("msgboxbox.show('Admin successfully Added');");
		}
		if(add.equals("false")) {
			out.print("msgboxbox.show('Admin adding failed');");
		}
		if(add.equals("pmissmatch")) {
			out.print("msgboxbox.show('Password missmatch');");
		}
		if(add.equals("emailExits")) {
			out.print("msgboxbox.show('Email alreday exists');");
		}
	}
	%>
</script>
