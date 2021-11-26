<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>
    
<!-- Include Header -->
<jsp:include page="main-header.jsp">
<jsp:param value="Celebritries" name="title"/>
</jsp:include>

<%Celebrity c = (Celebrity) request.getAttribute("celebrity");%>

<div class="hero hero3">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- <h1> movie listing - list</h1>
				<ul class="breadcumb">
					<li class="active"><a href="#">Home</a></li>
					<li> <span class="ion-ios-arrow-right"></span> movie listing</li>
				</ul> -->
			</div>
		</div>
	</div>
</div>
<!-- celebrity single section-->

<div class="page-single movie-single cebleb-single">
	<div class="container">
		<div class="row ipad-width">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="mv-ceb">
					<img src="image/Celebrities/covers/<%out.print(c.getCoverName());%>" alt="">
				</div>
			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct">
					<h1 class="bd-hd"><a href="celebrity?cid=<%out.print(c.getCid());%>"><%out.print(c.getFname()+" "+c.getLname());%></a></h1>
					<p class="ceb-single"><%out.print(c.getProfession()+" | "+c.getCountry());%></p>
					<div class="social-link cebsingle-socail">
						<a href="#"><i class="ion-social-facebook"></i></a>
						<a href="#"><i class="ion-social-twitter"></i></a>
						<a href="#"><i class="ion-social-googleplus"></i></a>
						<a href="#"><i class="ion-social-linkedin"></i></a>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li class="active"><a href="#overviewceb">Overview</a></li>
								<li><a href="#biography"> Biography</a></li>
								<li><a href="#filmography">Filmography</a></li>                        
							</ul>
						    <div class="tab-content">
						        <div id="overviewceb" class="tab active">
						            <div class="row">
						            	<div class="col-md-8 col-sm-12 col-xs-12">
						            		<p><%out.print(c.getBio());%></p>
											<p><%out.print(c.getDescription());%></p>
											<p class="time"><a href="#biography">See full bio <i class="ion-ios-arrow-right"></i></a></p>
											
											<div class="mvcast-item">											
											</div>
						            	</div>
						            	<div class="col-md-4 col-xs-12 col-sm-12">
						            		<div class="sb-it">
						            			<h6>First name:  </h6>
						            			<p><a href="#"><%out.print(c.getFname());%></a></p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Last name:  </h6>
						            			<p><a href="#"><%out.print(c.getLname());%></a></p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Date of Birth: </h6>
						            			<p><%out.print(c.getDob());%></p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Country:  </h6>
						            			<p><%out.print(c.getCountry());%>n</p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Height(in cm):</h6>
						            			<p><%out.print(c.getHeight());%></p>
						            		</div>
						            		<div class="sb-it">
						            			<h6>Profession:</h6>
						            			<p><%out.print(c.getProfession());%></p>
						            		</div>
						            		
						            	</div>
						            </div>
						        </div>
						        <div id="biography" class="tab">
						           <div class="row">
						            	<div class="rv-hd">
											<div>
												<h3>Biography of</h3>
						       	 				<h2><%out.print(c.getFname()+" "+c.getLname());%></h2>
											</div>							            						
						            	</div>
						            	<p><%out.print(c.getBio());%></p>
										<p><%out.print(c.getDescription());%></p>
						            </div>
						        </div>
						        
					       	 	<div id="filmography" class="tab">
						        	<div class="row">
						            	<div class="rv-hd">
						            		<div>
						            			<h3>Filmography of</h3>
					       	 					<h2><%out.print(c.getFname()+" "+c.getLname());%></h2>
						            		</div>
										
						            	</div>
						            	
										<!-- movie cast -->
										
										<% List<Item> items = (List<Item>)request.getAttribute("items");
							            for(Item i : items){
						                %>
										<div class="mvcast-item">
												<%if(i.getCategory().equals("Movie")){ %>
													<div class="cast-it">
														<div class="cast-left cebleb-film">
															<a href="movie?mid=<%out.print(i.getId()); %>"><img class="csfimg" src="image/movies/covers/<%out.print(i.getCover()); %>" alt=""></a>
															<div>
																<a href="movie?mid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %> </a>
																<p><%out.print(i.getRdate());%></p>
															</div>
														</div>
													</div>
												<%}else if(i.getCategory().equals("TVShow")){ %>
													<div class="cast-it">
														<div class="cast-left cebleb-film">
														    <a href="tvshow?tid=<%out.print(i.getId()); %>"><img class="csfimg" src="image/tvshows/covers/<%out.print(i.getCover()); %>" alt=""></a>
															<div>
																<a href="tvshow?tid=<%out.print(i.getId()); %>"><%out.print(i.getTitle()); %> </a>
																<p><%out.print(i.getRdate());%></p>
															</div>
														</div>
													</div>
											    <%} %>
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
<!-- celebrity single section-->

<!-- Include Footer -->
<jsp:include page="main-footer.jsp">
<jsp:param value="Celebritries" name="title"/>
</jsp:include>

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>