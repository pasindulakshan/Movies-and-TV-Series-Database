<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select2.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ionicons.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/icon/favicon.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon.png">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>Admin Login</title>

</head>
<body>
	<div class="sign section--bg" data-bg="<%=request.getContextPath()%>/images/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="sign__content">
						<!-- authorization form -->
						<form action="AdminLogin" class="sign__form" method="post">
							<a href="#" class="sign__logo">
								<img src="images/logo1.png" alt="">
							</a>

							<div class="sign__group">
								<input type="text" class="sign__input" placeholder="Email" name="email">
							</div>

							<div class="sign__group">
								<input type="password" class="sign__input" placeholder="Password" name="pass">
							</div>
							<button class="sign__btn" type="submit">Sign in</button>
						</form>
						<!-- end authorization form -->
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp"></jsp:include>