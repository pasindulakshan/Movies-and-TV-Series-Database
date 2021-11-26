<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%! @SuppressWarnings("unchecked") %>


    
<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="Users" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
				<div id="msgbox-area" class="msgbox-area"></div>
					<div class="main__title">
						<h2>User List</h2>

						<span class="main__title-stat"><%out.print(request.getAttribute("ucount")); %> Total</span>

						<div class="main__title-wrap">
							
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Search Users" id="usearch">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table" id="utable">
							<thead>
								<tr>
									<th>ID</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>E-mail</th>
									<th>Joined Date</th>
								</tr>
							</thead>

							<tbody>
								<% List<User> users = (List<User>)request.getAttribute("users");
								
									for(User u : users){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(u.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(u.getFirstName());%></div>
									</td>
									
									<td>
										<div class="main__table-text"><%out.print(u.getLastName());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(u.getEmail());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(u.getJoinedDate());%></div>
									</td>
								
									<td>
										<div class="main__table-btns">
											<a href="ModifyUser?uid=<%out.print(u.getId());%>" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" onclick="setDeleteID(<%out.print(u.getId());%>)">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
				<!-- end users -->

				
			</div>
		</div>
	</main>
	<!-- end main content -->

	

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">Item delete</h6>

		<p class="modal__text">Are you sure to permanently delete this item?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button" onclick="deleteMovie()">Delete</button>
			<button class="modal__btn modal__btn--dismiss" type="button" onclick="setDeleteID(0)">Dismiss</button>
		</div>
	</div>
	<!-- end modal delete -->

	


<!-- Include Footer -->

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var deleteID = 0;
	function setDeleteID(id){
		deleteID = id;
	}
	function deleteMovie(){
		window.location.href = "DeleteUser?uid="+deleteID;
	}
	
	var $rows = $('#utable tbody tr');
	$('#usearch').keyup(function() {
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});
	
	<%
	if(request.getParameter("udelete") != null){
		String mdelete = request.getParameter("udelete");
		if(mdelete.equals("true")) {
			out.print("msgboxbox.show('User successfully deleted from the database');");
		}
	}
	if(request.getParameter("umodify") != null){
		String mmodify = request.getParameter("umodify");
		if(mmodify.equals("true")) {
			out.print("msgboxbox.show('User successfully modified');");
		}
	}
	%>
	
</script>