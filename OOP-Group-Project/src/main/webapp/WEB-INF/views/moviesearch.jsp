<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Movie"%>
<%@page import="com.model.Item"%>
<%! @SuppressWarnings("unchecked") %>
<!-- Include Header -->
<jsp:include page="main-header.jsp">
	<jsp:param value="Search Movies" name="title"/>
</jsp:include>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>Search Movies - <%out.print(request.getAttribute("result")); %></h1>
					<ul class="breadcumb">
						<li class="active"><a href="/OOP-Group-Project">Home</a></li>
						<li> <span class="ion-ios-arrow-right"></span> movie search</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="page-single">
	<div class="container">
		<div class="row ipad-width">
			<div class="col-md-8 col-sm-12 col-xs-12">
			<% List<Movie> movies = (List<Movie>)request.getAttribute("movies");%>
			<p>Found <%out.print(movies.size()); %> tv shows in Total</p>
				<div class="flex-wrap-movielist">
						<%for(Movie m : movies){%>
						<div class="movie-item-style-2 movie-item-style-1">
							<img src="image/movies/covers/<%out.print(m.getCover());%>" alt="">
							<div class="hvr-inner">
	            				<a  href="movie?mid=<%out.print(m.getId());%>"> Read more <i class="ion-android-arrow-dropright"></i> </a>
	            			</div>
							<div class="mv-item-infor">
								<h6><a href="movie?mid=<%out.print(m.getId());%>"><%out.print(m.getTitle());%></a></h6>
								<p class="rate"><i class="ion-android-star"></i><span><%out.print(m.getRating());%></span> /10</p>
							</div>
						</div>		
				  		<%} %>		
				</div>		
			</div>
			
			
			
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="sidebar">
					<div class="celebrities">
						<h4 class="sb-title">Top Rated Movies</h4>
				     <% List<Item> movies2 = (List<Item>)request.getAttribute("topRatedMovies");
						for(Item c : movies2){
					  %>
						<div class="celeb-item">
							<a href="movie?mid=<%out.print(c.getId());%>"><img class="hpceleb" src="image/movies/covers/<%out.print(c.getCover());%>" alt=""></a>
							<div class="celeb-author">
								<h6><a href="movie?mid=<%out.print(c.getId());%>"><%out.print(c.getTitle());%></a></h6>
								<p class="rate"><i class="ion-android-star"></i><span><%out.print(c.getRating());%></span> /10</p>
							</div>
						</div>
					 <%} %>
						<a href="movies" class="btn">See all movies<i class="ion-ios-arrow-right"></i></a>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>
<!-- Include Footer -->
<jsp:include page="main-footer.jsp"></jsp:include>