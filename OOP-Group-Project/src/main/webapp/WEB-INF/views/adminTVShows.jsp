<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>
<!-- include header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="TV Shows" name="title"/>
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
						<h2>TV Shows</h2>

						<span class="main__title-stat"><%out.print(request.getAttribute("tvcount")); %> Total</span>

						<div class="main__title-wrap">
							<a href="AddTVShows" class="main__title-link">Add TVShow</a>
                        	<p>&nbsp; &nbsp; &nbsp;</p>
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find TV Show.." id="tvsearch">
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
						<table class="main__table" id="tvtable">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>RATING</th>
									<th>VIEWS</th>
									<th>SEASONS</th>
									<th>EPISODES</th>
									<th>ADDED DATE</th>
									<th>ADDED BY</th>
									<th>ACTIONS</th>
								</tr>
							</thead>

							<tbody>
								<% List<TVShow> tvshows = (List<TVShow>)request.getAttribute("tvshows");
								   for(TVShow t : tvshows){
								%>
								<tr>
									<td>
										<div class="main__table-text"><%out.print(t.getId());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getTitle());%></div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate"><i class="icon ion-ios-star"></i><%out.print(t.getRating());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getViews());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getNoOfSeasons());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getNoOfEpisodes());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getAddedDate());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(t.getAddedBy());%></div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="ModifyTVShow?tid=<%out.print(t.getId());%>" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" onclick="setDeleteID(<%out.print(t.getId());%>)">
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

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var deleteID = 0;
	function setDeleteID(id){
		deleteID = id;
	}
	function deleteMovie(){
		window.location.href = "DeleteTVShow?tid="+deleteID;
	}
	
	var $rows = $('#tvtable tbody tr');
	$('#tvsearch').keyup(function() {
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});
	
	<%
	if(request.getParameter("tdelete") != null){
		String tdelete = request.getParameter("tdelete");
		if(tdelete.equals("success")) {
			out.print("msgboxbox.show('TV Show successfully deleted from the database');");
		}
	}
	if(request.getParameter("tmodify") != null){
		String tmodify = request.getParameter("tmodify");
		if(tmodify.equals("true")) {
			out.print("msgboxbox.show('TV Show successfully modified');");
		}
	}
	%>
</script>