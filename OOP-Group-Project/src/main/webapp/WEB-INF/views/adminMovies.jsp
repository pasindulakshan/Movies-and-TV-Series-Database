<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>
<!-- include header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="Movies" name="title"/>
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
						<h2>Movies</h2>

						<span class="main__title-stat"><%out.print(request.getAttribute("mcount")); %> Total</span>

						<div class="main__title-wrap">
							<a href="AddMovies" class="main__title-link">Add Movie</a>
                        	<p>&nbsp; &nbsp; &nbsp;</p>
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find movie" id="msearch">
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
						<table class="main__table" id="mtable">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>RATING</th>
									<th>VIEWS</th>
									<th>ADDED DATE</th>
									<th>ADDED BY</th>
									<th>ACTIONS</th>
								</tr>
							</thead>

							<tbody>
								<% List<Movie> movies = (List<Movie>)request.getAttribute("movies");
								
									for(Movie m : movies){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(m.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getTitle());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate"><i class="icon ion-ios-star"></i><%out.print(m.getRating());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getViews());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getAddedDate());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(m.getAddedBy());%></div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="ModifyMovie?mid=<%out.print(m.getId());%>" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" onclick="setDeleteID(<%out.print(m.getId());%>)">
												<i class="icon ion-ios-trash" ></i>
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



<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var deleteID = 0;
	function setDeleteID(id){
		deleteID = id;
	}
	function deleteMovie(){
		window.location.href = "DeleteMovie?mid="+deleteID;
	}
	
	var $rows = $('#mtable tbody tr');
	$('#msearch').keyup(function() {
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});
	
	<%
	if(request.getParameter("mdelete") != null){
		String mdelete = request.getParameter("mdelete");
		if(mdelete.equals("success")) {
			out.print("msgboxbox.show('Movie successfully deleted from the database');");
		}
	}
	if(request.getParameter("mmodify") != null){
		String mmodify = request.getParameter("mmodify");
		if(mmodify.equals("true")) {
			out.print("msgboxbox.show('Movie successfully modified');");
		}
	}
	%>
	
</script>