<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="java.util.List"%>
<%! @SuppressWarnings("unchecked") %>
<!-- include header -->
<jsp:include page="main-header.jsp">
	<jsp:param value="Home" name="title"/>
</jsp:include>


<div class="slider movie-items">
	<div class="container">
		<div class="row">
			<div class="social-link">
				<p>Follow us: </p>
				<a href="#"><i class="ion-social-facebook"></i></a>
				<a href="#"><i class="ion-social-twitter"></i></a>
				<a href="#"><i class="ion-social-googleplus"></i></a>
				<a href="#"><i class="ion-social-youtube"></i></a>
			</div>
	    	<div  class="slick-multiItemSlider">
	    	<% List<Item> items = (List<Item>)request.getAttribute("latestItems");
				for(Item i : items){
			%>
	    		<div class="movie-item">
	    		<%if(i.getCategory().equals("Movie")){ %>
	    			<div class="mv-img">
	    				<a href="movie?mid=<%out.print(i.getId()); %>"><img class="msimg" src="image/movies/covers/<%out.print(i.getCover()); %>" alt=""></a>
	    			</div>
	    			<div class="title-in">
	    				<div class="cate">
	    					<span class="blue"><a href="#">Movie</a></span>
	    				</div>
	    				<h6><a href="movie?mid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %></a></h6>
	    				<p><i class="ion-android-star"></i><span><%out.print(i.getRating()); %></span> /10</p>
	    			</div>
	    		<%}else if(i.getCategory().equals("TVShow")){ %>
	    			<div class="mv-img">
	    				<a href="tvshow?tid=<%out.print(i.getId()); %>"><img class="msimg" src="image/tvshows/covers/<%out.print(i.getCover()); %>" alt="" ></a>
	    			</div>
	    			<div class="title-in">
	    				<div class="cate">
	    					<span class="yell"><a href="#">TVShow</a></span>
	    				</div>
	    				<h6><a href="tvshow?tid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %></a></h6>
	    				<p><i class="ion-android-star"></i><span><%out.print(i.getRating()); %></span> /10</p>
	    			</div>
	    		<%} %>
	    		</div>
	    	<%} %>
	    	</div>
	    </div>
	</div>
</div>

<div class="movie-items">
	<div class="container">
		<div class="row ipad-width">
			<div class="col-md-8">
				<div class="title-hd">
					<h2>Movies</h2>
					<a href="movies" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					<ul class="tab-links">
						<li class="active"><a href="#tab1">#Top rated</a></li>                     
					</ul>
				    <div class="tab-content">
				        <div id="tab1" class="tab active">
				            <div class="row">
				            	<div class="slick-multiItem">
				            	<% List<Item> items2 = (List<Item>)request.getAttribute("topRatedMovies");
									for(Item i : items2){
								%>
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img class="mhimg" src="image/movies/covers/<%out.print(i.getCover()); %>" alt="">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="movie?mid=<%out.print(i.getId()); %>"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="movie?mid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %></a></h6>
					            				<p><i class="ion-android-star"></i><span><%out.print(i.getRating()); %></span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            	<%} %>
				            	</div>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="title-hd">
					<h2>on tv</h2>
					<a href="tvshows" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					<ul class="tab-links-2">
						<li class="active"><a href="#tab22">#Top rated </a></li>                   
					</ul>
				    <div class="tab-content">
				        <div id="tab22" class="tab active">
				           <div class="row">
				            	<div class="slick-multiItem">
				            		<% List<Item> items3 = (List<Item>)request.getAttribute("topRatedTVShows");
									for(Item i : items3){
								%>
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img class="mhimg" src="image/tvshows/covers/<%out.print(i.getCover()); %>" alt="">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="tvshow?tid=<%out.print(i.getId()); %>"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="tvshow?tid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %></a></h6>
					            				<p><i class="ion-android-star"></i><span><%out.print(i.getRating()); %></span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            	<%} %>
				            	</div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="sidebar">
					<div class="celebrities">
						<h4 class="sb-title">Spotlight Celebrities</h4>
				     <% List<Celebrity> celebs = (List<Celebrity>)request.getAttribute("spotlightCelebs");
						for(Celebrity c : celebs){
					  %>
						<div class="celeb-item">
							<a href="celebrity?cid=<%out.print(c.getCid());%>"><img class="hpceleb" src="image/Celebrities/covers/<%out.print(c.getCoverName());%>" alt=""></a>
							<div class="celeb-author">
								<h6><a href="celebrity?cid=<%out.print(c.getCid());%>"><%out.print(c.getFname()+" "+c.getLname());%></a></h6>
								<span><%out.print(c.getProfession()+", "+c.getCountry());%></span>
							</div>
						</div>
					 <%} %>
						<a href="celebrities" class="btn">See all celebrities<i class="ion-ios-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Include Footer -->
<jsp:include page="main-footer.jsp"></jsp:include>