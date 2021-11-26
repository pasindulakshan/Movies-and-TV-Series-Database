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
	<link rel="icon" type="image/png" href="icon/favicon.png" sizes="32x32">
	
	<title>404 Not Found</title>

</head>
<body>

	<!-- page 404 -->
	<div class="page-404 section--bg" data-bg="<%=request.getContextPath()%>/images/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page-404__wrap">
						<div class="page-404__content">
							<h1 class="page-404__title">404</h1>
							<p class="page-404__text">The page you are looking for not available!</p>
							<a href="<%=request.getContextPath()%>/" class="page-404__btn">Go to Home Page</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end page 404 -->
	
	
<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>