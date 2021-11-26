<!-- sidebar -->
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="AdminDashboard" class="sidebar__logo">
			<img src="images/logo1.png" alt="">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="images/user.svg" alt="">
			</div>

			<div class="sidebar__user-title">
				<span>Admin</span>
				<p><%out.print((String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname")); %></p>
			</div>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<ul class="sidebar__nav">
			<li class="sidebar__nav-item">
				<a href="AdminDashboard" class="sidebar__nav-link"><i class="icon ion-ios-keypad"></i> Dashboard</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AddMovies" class="sidebar__nav-link"><i class="icon ion-ios-add-circle"></i> Add Movies</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AddTVShows" class="sidebar__nav-link"><i class="icon ion-ios-add-circle"></i> Add TV Shows</a>
			</li>

			<li class="sidebar__nav-item">
				<a href="AdminMovies" class="sidebar__nav-link"><i class="icon ion-ios-film"></i> Movies</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AdminTVShows" class="sidebar__nav-link"><i class="icon ion-ios-film"></i> TV Shows</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AdminCelebs" class="sidebar__nav-link"><i class="icon ion-ios-person"></i> Celebrities</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AddCelebrities" class="sidebar__nav-link"><i class="icon ion-ios-add-circle"></i> Add Celebrities</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AdminGenres" class="sidebar__nav-link"><i class="icon ion-ios-apps"></i> Genres</a>
			</li>
			
			<li class="sidebar__nav-item">
				<a href="AdminUsers" class="sidebar__nav-link"><i class="icon ion-ios-contacts"></i> Users</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AddAdmins" class="sidebar__nav-link"><i class="icon ion-ios-add-circle"></i>New Administrator</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="Admins" class="sidebar__nav-link"><i class="icon ion-ios-medal"></i>View All Administrators</a>
			</li>
			<li class="sidebar__nav-item">
				<a href="AdminSettings" class="sidebar__nav-link"><i class="icon ion-ios-settings"></i>Settings</a>
			</li>
			<%
			if(session != null || session.getAttribute("adminUser") == null) {
			%>
			<li class="sidebar__nav-item">
				<a href="Logout" class="sidebar__nav-link"><i class="icon ion-ios-log-out"></i>Logout</a>
			</li>
			<%} %>
		</ul>
		<!-- end sidebar nav -->
		
		<!-- sidebar copyright -->
		<div class="sidebar__copyright">© 2021. <br>Created by Lakshan</div>
		<!-- end sidebar copyright -->
	</div>
	<!-- end sidebar -->