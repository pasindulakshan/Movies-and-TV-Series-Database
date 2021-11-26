<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>
<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="" name="title"/>
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
					<h2>Dashboard</h2>

					<a href="AddMovies" class="main__title-link">add item</a>
				</div>
			</div>
			<!-- end main title -->

			<!-- stats -->
			<div class="col-12 col-sm-6 col-xl-3">
				<div class="stats">
					<span>Total Views</span>
					<p><%out.print(request.getAttribute("views")); %></p>
					<i class="icon ion-ios-stats"></i>
				</div>
			</div>
			<!-- end stats -->
			
			<!-- stats -->
			<div class="col-12 col-sm-6 col-xl-3">
				<div class="stats">
					<span>Total Downloads</span>
					<p><%out.print(request.getAttribute("downloads")); %></p>
					<i class="icon ion-ios-cloud-download"></i>
				</div>
			</div>
			<!-- end stats -->

			<!-- stats -->
			<div class="col-12 col-sm-6 col-xl-3">
				<div class="stats">
					<span>Items added this month</span>
					<p><%out.print(request.getAttribute("newItems")); %></p>
					<i class="icon ion-ios-film"></i>
				</div>
			</div>
			<!-- end stats -->
			
			<!-- stats -->
			<div class="col-12 col-sm-6 col-xl-3">
				<div class="stats">
					<span>New users this month</span>
					<p><%out.print(request.getAttribute("newUsers")); %></p>
					<i class="icon ion-ios-happy"></i>
				</div>
			</div>
			<!-- end stats -->

			<!-- dashbox -->
			<div class="col-12 col-xl-6">
				<div class="dashbox">
					<div class="dashbox__title">
						<h3><i class="icon ion-ios-trophy"></i> Top Rated Movies</h3>

						<div class="dashbox__wrap">
							<a class="dashbox__refresh" href="AdminDashboard"><i class="icon ion-ios-refresh"></i></a>
							<a class="dashbox__more" href="AdminMovies">View All</a>
						</div>
					</div>
					<div class="dashbox__table-wrap">
						<table class="main__table main__table--dash">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>VIEWS</th>
									<th>RATING</th>
								</tr>
							</thead>
							<tbody>
							<% List<Item> movies = (List<Item>)request.getAttribute("topRatedMovies");
								
									for(Item m : movies){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(m.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getTitle());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getViews());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate"><i class="icon ion-ios-star"></i><%out.print(m.getRating());%></div>
									</td>
								</tr>
								<%} %>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end dashbox -->
			
			<!-- dashbox -->
			<div class="col-12 col-xl-6">
				<div class="dashbox">
					<div class="dashbox__title">
						<h3><i class="icon ion-ios-trophy"></i> Top Rated TV Shows</h3>

						<div class="dashbox__wrap">
							<a class="dashbox__refresh" href="AdminDashboard"><i class="icon ion-ios-refresh"></i></a>
							<a class="dashbox__more" href="AdminTVShows">View All</a>
						</div>
					</div>

					<div class="dashbox__table-wrap">
						<table class="main__table main__table--dash">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>VIEWS</th>
									<th>RATING</th>
								</tr>
							</thead>
							<tbody>
							<% List<Item> tvshows = (List<Item>)request.getAttribute("topRatedTVShows");
								
									for(Item t : tvshows){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(t.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getTitle());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getViews());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate"><i class="icon ion-ios-star"></i><%out.print(t.getRating());%></div>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end dashbox -->

			<!-- dashbox -->
			<div class="col-12 col-xl-6">
				<div class="dashbox">
					<div class="dashbox__title">
						<h3><i class="icon ion-ios-film"></i> Latest items</h3>

						<div class="dashbox__wrap">
							<a class="dashbox__refresh" href="AdminDashboard"><i class="icon ion-ios-refresh"></i></a>
							<a class="dashbox__more" href="">View All</a>
						</div>
					</div>

					<div class="dashbox__table-wrap">
						<table class="main__table main__table--dash">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>CATEGORY</th>
									<th>VIEWS</th>
								</tr>
							</thead>
							<tbody>
							<% List<Item> items = (List<Item>)request.getAttribute("latestItems");
								
									for(Item i : items){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(i.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(i.getTitle());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green"><%out.print(i.getCategory());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(i.getViews());%></div>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end dashbox -->

			<!-- dashbox -->
			<div class="col-12 col-xl-6">
				<div class="dashbox">
					<div class="dashbox__title">
						<h3><i class="icon ion-ios-contacts"></i> Latest users</h3>

						<div class="dashbox__wrap">
							<a class="dashbox__refresh" href="AdminDashboard"><i class="icon ion-ios-refresh"></i></a>
							<a class="dashbox__more" href="AdminUsers">View All</a>
						</div>
					</div>

					<div class="dashbox__table-wrap">
						<table class="main__table main__table--dash">
							<thead>
								<tr>
									<th>ID</th>
									<th>FULL NAME</th>
									<th>EMAIL</th>
									<th>Joined Date</th>
								</tr>
							</thead>
							<tbody>
							<% List<User> user = (List<User>)request.getAttribute("latestUsers");
								
									for(User u : user){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(u.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(u.getFirstName()+ " " + u.getLastName());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--grey"><%out.print(u.getEmail());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(u.getJoinedDate());%></div>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- end dashbox -->
		</div>
	</div>
</main>
<!-- end main content -->


<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>