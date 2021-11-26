<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="com.model.Movie"%>
<%@page import="com.model.Celebrity"%>
<%@page import="com.model.Cast"%>
<%@page import="com.model.Genre"%>

<%! @SuppressWarnings("unchecked") %>


<%Movie m = (Movie) request.getAttribute("movie");%>

<!-- Include Header -->
<jsp:include page="main-header.jsp">
	<jsp:param value="Movie" name="title"/>
</jsp:include>
<div class="hero mv-single-hero">
	<div class="container">
		<div class="row"> 
			<div class="col-md-12">
				
			</div>
		</div>
	</div>
</div>
<div class="page-single movie-single movie_single">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="movie-img sticky-sb">
					<img src="image/movies/covers/<%out.print(m.getCover());%>" alt="">
					<div class="movie-btn">	
						<div class="btn-transform transform-vertical red">
							<div><a href="#" class="item item-1 redbtn"> <i class="ion-play"></i> Watch Trailer</a></div>
							<div><a href="<%out.print(m.getTrailer());%>" class="item item-2 redbtn fancybox-media hvr-grow"><i class="ion-play"></i></a></div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct main-content">
					<h1 class="bd-hd"><%out.print(m.getTitle());%><span>&nbsp;<%out.print(m.getRdate().substring(0,4));%></span></h1>
					
					<div class="movie-rate">
						<div class="rate">
							<i class="ion-android-star"></i>
							<p><span><%out.print(m.getRating());%></span> /10<br>
								<!--span class="rv">56 Reviews</span-->
							</p>
						</div>
						<div class="rate-star">
							<p>Rate This Movie:  </p>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star-outline"></i>
						</div>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li class="active"><a href="#overview">Overview</a></li>
								<li><a href="#cast">  Cast And Crew </a></li>
								                       
							</ul>
						    <div class="tab-content">
						        <div id="overview" class="tab active">
						            <div class="row">
						            	<div class="col-md-8 col-sm-12 col-xs-12">
						            		<p><%out.print(m.getDescription());%></p>
						            		
											<div class="title-hd-sm">
												<h4>cast</h4>
												<a href="#" class="time">Full Cast And Crew  <i class="ion-ios-arrow-right"></i></a>
											</div>
											
											<!-- movie cast -->
											<div class="mvcast-item">	
											<% List<Cast> casts = m.getCasts();
								
											for(Cast c : casts){
												Celebrity actor=c.getActor();
											%>										
												<div class="cast-it">
													<div class="cast-left">
														<img class="hpceleb" src="image/Celebrities/covers/<%out.print(actor.getCoverName());%>" alt="">
														<a href="celebrity?cid=<%out.print(actor.getCid());%>"><%out.print(actor.getFname()+" "+actor.getLname());%></a>
													</div>
													<p><%out.print(c.getRole());%></p>
												</div>
												<%} %>
												
												
												
											</div>
											
						            	</div>
						            	<div class="col-md-4 col-xs-12 col-sm-12">
						            		<div class="sb-it">
						            			<h6>Director: </h6><p>
						            			<% List<Celebrity> directors = m.getDirectors1();
								
												for(Celebrity d : directors){
												%>
						            				<a href="celebrity?cid=<%out.print(d.getCid());%>"><%out.print(d.getFname()+" "+d.getLname());%></a>
						            			<%} %>
						            			</p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Writer: </h6><p>
						            			<% List<Celebrity> writers = m.getWriters1();
								
												for(Celebrity w : writers){
												%>
						            				<a href="celebrity?cid=<%out.print(w.getCid());%>"><%out.print(w.getFname()+" "+w.getLname());%></a>
						            			<%} %>
						            			</p>
						            		</div>
						            		
						            		<div class="sb-it">
						            			<h6>Genres:</h6>
						            			<p>
						            			<% List<Genre> genres = m.getGenres1();
								
												for(Genre g : genres){
												%>
						            			<a href="#"><%out.print(g.getName());%> </a>
						            			<%} %> 
						            			</p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Release Date:</h6>
						            			<p><%out.print(m.getRdate());%></p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Run Time:</h6>
						            			<p><%out.print(m.getRuntime());%></p>
						            		</div>
						            		
						            	</div>
						            </div>
						        </div>
						        <div id="cast" class="tab">
						        	<div class="row">
						            	<h3>Cast And Crew of</h3>
					       	 			<h2><%out.print(m.getTitle());%></h2>
										<!-- //== -->
					       	 			<div class="title-hd-sm">
											<h4>Directors</h4>
										</div>
										<div class="mvcast-item">
											<% List<Celebrity> directors1 = m.getDirectors1();
								
												for(Celebrity d : directors){
												%>		
											<div class="cast-it">
												<div class="cast-left">
													<img class="hpceleb" src="image/Celebrities/covers/<%out.print(d.getCoverName());%>" alt="">
						            				<a href="celebrity?cid=<%out.print(d.getCid());%>"><%out.print(d.getFname()+" "+d.getLname());%></a>
												</div>
											</div>
											<%} %>
										</div>
										<div class="title-hd-sm">
											<h4>Cast</h4>
										</div>
										<div class="mvcast-item">
											<% List<Cast> casts1 = m.getCasts();
								
											for(Cast c : casts){
												Celebrity actor=c.getActor();
											%>										
											<div class="cast-it">
												<div class="cast-left">
													<img class="hpceleb" src="image/Celebrities/covers/<%out.print(actor.getCoverName());%>" alt="">
													<a href="celebrity?cid=<%out.print(actor.getCid());%>"><%out.print(actor.getFname()+" "+actor.getLname());%></a>
												</div>
												<p><%out.print(c.getRole());%></p>
											</div>
											<%} %>
											
											
										</div>
										
										</div>
						            </div>
					       	 	</div>
					       	 	
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Include Footer -->
<jsp:include page="main-footer.jsp"></jsp:include>