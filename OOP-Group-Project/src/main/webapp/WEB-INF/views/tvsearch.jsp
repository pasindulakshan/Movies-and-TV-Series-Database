<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.TVShow"%>
<%@page import="com.model.Item"%>
<%! @SuppressWarnings("unchecked") %>

<!-- Include Header -->
<jsp:include page="main-header.jsp">
<jsp:param value="Search TV Shows" name="title"/>
</jsp:include>



<div class="hero common-hero">
  <div class="container">
    <div class="row">
       <div class="col-md-12">
          <div class="hero-ct">
          <h1>Search TV Shows - <%out.print(request.getAttribute("result")); %> </h1>
          <ul class="breadcumb">
             <li class="active"><a href="/OOP-Group-Project">Home</a></li>
             <li> <span class="ion-ios-arrow-right"></span> tv shows search</li>
          </ul>
          </div>
      </div>
   </div>
 </div>
</div>

<!-- tvshows grid section-->
<div class="page-single">
  <div class="container">
     <div class="row ipad-width">
       <div class="col-md-8 col-sm-12 col-xs-12">
       <% List<TVShow> tvshows = (List<TVShow>)request.getAttribute("tvshows");%>
       <p>Found <%out.print(tvshows.size()); %> tv shows in Total</p>
          <div class="flex-wrap-movielist">
						<%for(TVShow t : tvshows){%>
						<div class="movie-item-style-2 movie-item-style-1">
							<img src="image/tvshows/covers/<%out.print(t.getCover());%>" alt="">
							<div class="hvr-inner">
	            				<a  href="tvshow?tid=<%out.print(t.getId());%>"> Read more <i class="ion-android-arrow-dropright"></i> </a>
	            			</div>
							<div class="mv-item-infor">
								<h6><a href="tvshow?tid=<%out.print(t.getId());%>"><%out.print(t.getTitle());%></a></h6>
								<p class="rate"><i class="ion-android-star"></i><span><%out.print(t.getRating());%></span> /10</p>
							</div>
						</div>		
				  		<%} %>		
				</div>	
		</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="sidebar">
					<div class="celebrities">
						<h4 class="sb-title">Top Rated TV Shows</h4>
				     <% List<Item> tvshows2 = (List<Item>)request.getAttribute("topRatedTVShows");
						for(Item c : tvshows2){
					  %>
						<div class="celeb-item">
							<a href="tvshow?tid=<%out.print(c.getId());%>"><img class="hpceleb" src="image/tvshows/covers/<%out.print(c.getCover());%>" alt=""></a>
							<div class="celeb-author">
								<h6><a href="tvshow?tid=<%out.print(c.getId());%>"><%out.print(c.getTitle());%></a></h6>
								<p class="rate"><i class="ion-android-star"></i><span><%out.print(c.getRating());%></span> /10</p>
							</div>
						</div>
					 <%} %>
						<a href="tvshows" class="btn">See all tv shows<i class="ion-ios-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Include Footer -->
<jsp:include page="main-footer.jsp"></jsp:include>