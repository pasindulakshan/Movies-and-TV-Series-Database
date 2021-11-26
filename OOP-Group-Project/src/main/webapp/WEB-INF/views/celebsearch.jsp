<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Celebrity"%>
<%! @SuppressWarnings("unchecked") %>

<!-- Include Header -->
<jsp:include page="main-header.jsp">
<jsp:param value="Celebritries Search" name="title"/>
</jsp:include>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>Celebrity Search - <%out.print(request.getAttribute("result")); %></h1>
					<ul class="breadcumb">
						<li class="active"><a href="home">Home</a></li>
						<li> <span class="ion-ios-arrow-right"></span> celebrity search</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- celebrity grid v1 section-->
<div class="page-single">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-9 col-sm-12 col-xs-12">
			<% List<Celebrity> celebs = (List<Celebrity>)request.getAttribute("celebs");%>
	          <p>Found <%out.print(celebs.size()); %> celebrities in Total</p>
	          		<div class="celebrity-items">
							<%for(Celebrity c : celebs){%>
							      <div class="ceb-item">
						             <a href="celebrity?cid=<%out.print(c.getCid());%>"><img src="image/Celebrities/covers/<%out.print(c.getCoverName());%>" alt=""></a>
						             <div class="ceb-infor">
										<h2><a href="celebrity?cid=<%out.print(c.getCid());%>"><%out.print(c.getFname()+" "+c.getLname());%></a></h2>
							            <span><%out.print(c.getProfession()+", "+c.getCountry());%></span>
						             </div>
					             </div>
					         
                      		 <% } %>
				 </div>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="sidebar">
					<div class="celebrities">
						<h4 class="sb-title">Spotlight Celebrities</h4>
				     <% List<Celebrity> celebs2 = (List<Celebrity>)request.getAttribute("spotlightCelebs");
						for(Celebrity c : celebs2){
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
<!--end of celebrity grid v1 section-->

<!-- Include footer -->
<jsp:include page="main-footer.jsp">
<jsp:param value="Celebrities" name="title"/>
</jsp:include>

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>