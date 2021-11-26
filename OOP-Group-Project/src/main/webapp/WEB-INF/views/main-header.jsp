<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<!-- Basic need -->
	<title>${param.title}</title>

    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
	<!-- Mobile specific meta -->
	<meta name=viewport content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone-no">

	<!-- CSS files -->
	<link rel="stylesheet" href="css/plugins.css">
	<link rel="stylesheet" href="css/style.css">
	
	<link rel="icon" type="image/png" href="icon/favicon.png" sizes="32x32">

</head>
<body>
<!--preloading-->
<div id="preloader">
    <img class="logo" src="images/logo1.png" alt="" width="119" height="58" >
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<!--end of preloading-->
<!--login form popup-->
<div class="login-wrapper" id="login-content">
    <div class="login-content">
        <a href="" class="close">x</a>
        <h3>Login</h3>
        <form method="post" action="UserLogin">
        	<div class="row">
        		 <label for="username">
                    Email:
                    <input type="text" name="email" id="email" placeholder="HughJackman@gmail.com" required="required" />
                </label>
        	</div>
           
            <div class="row">
            	<label for="password">
                    Password:
                    <input type="password" name="password" id="password" placeholder="******"  required="required" />
                </label>
            </div>
            <div class="row">
            	<div class="remember">
					<div>
						<input type="checkbox" name="remember" value="Remember me"><span>Remember me</span>
					</div>
            		<a href="#">Forget password ?</a>
            	</div>
            </div>
           <div class="row">
           	 <button type="submit">Login</button>
           </div>
        </form>
    </div>
</div>
<!--end of login form popup-->


<!--signup form popup-->
<div class="login-wrapper"  id="signup-content">
    <div class="login-content">
        <a href="#" class="close">x</a>
        <h3>sign up</h3>
        <form method="post" action="UserSingup"> 
            <div class="row">
                <label for="email-2">
                    your email:
                    <input type="email" name="email" id="email-2" placeholder="email" required="required" />
                </label>
            </div>
            <div class="row">
                <label for="email-2">
                    your FirstName:
                    <input type="text" name="firstName" id="email-2" placeholder="first name" required="required" />
                </label>
            </div>
            <div class="row">
                <label for="email-2">
                    your LastName:
                    <input type="text" name="lastName" id="email-2" placeholder="last name" required="required" />
                </label>
            </div>
             <div class="row">
                <label for="password-2">
                    Password:
                    <input type="password" name="password" id="password" placeholder=""  required="required" />
                </label>
            </div>
             <div class="row">
                <label for="repassword-2">
                    re-type Password:
                    <input type="password" name="repassword" id="repassword" placeholder="" required="required" />
                </label>
            </div>
           <div class="row">
             <button type="submit">sign up</button>
           </div>
        </form>
    </div>
</div>
<!--end of signup form popup-->



<!-- BEGIN | Header -->
<header class="ht-header">
	<div class="container">
		<nav class="navbar navbar-default navbar-custom">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
				    <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					    <span class="sr-only">Toggle navigation</span>
					    <div id="nav-icon1">
							<span></span>
							<span></span>
							<span></span>
						</div>
				    </div>
				    <a href="/OOP-Group-Project"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
			    </div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav flex-child-menu menu-left">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						<li><a href="/OOP-Group-Project">Home</a></li>
						<li><a href="movies">Movies</a></li>
						<li><a href="tvshows">TV Shows</a></li>
						<li><a href="celebrities">Celebrities</a></li>
						
					</ul>
					<%if(session == null || session.getAttribute("user") == null) {%>
					<ul class="nav navbar-nav flex-child-menu menu-right">          
						<li><a href="#">Help</a></li>
						<li class="loginLink"><a href="#">LOG In</a></li>
						<li class="btn signupLink"><a href="#">sign up</a></li>
					</ul>
					<%}else{%>
					<ul class="nav navbar-nav flex-child-menu menu-right">          
						<li><a href="#">Help</a></li>
						<li><a href="UserLogout">Logout</a></li>
						<li class="btn"><a href="UserSettings"> <%out.print((String) session.getAttribute("fname") + " " + (String) session.getAttribute("lname")); %></a></li>
					</ul>
					
					<%} %>
					
				</div>
			<!-- /.navbar-collapse -->
	    </nav>
	    
	    <!-- top search form -->
	    <form action="search" method="get">
		    <div class="top-search">
		    	<select name="type">
					<option value="tv">TV show</option>
					<option value="movie">Movies</option>
					<option value="celeb">Celebrities</option>
				</select>
				<input name="search" type="text" placeholder="Search for a movie, TV Show or celebrity that you are looking for">
		    </div>
	    </form>
	</div>
</header>
<!-- END | Header -->

