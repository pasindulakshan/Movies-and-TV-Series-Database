<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>    
    
<!-- Include Header -->
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
					<div class="main__title">
						<h2>Genres</h2>

                        <span class="main__title-stat"><%out.print(request.getAttribute("gCount")); %> Total</span>

						<div class="main__title-wrap">
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find genre">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->
				
				
				<div class="col-12 col-xl-12">
					<form action="AddGenres" class="form"  method="post">
					<div class="row">
						<div class="col-12">
						        <label class="profile__label" for="bio">Genre name</label>
								<input type="text" name="genre" class="form__input" placeholder="Add Genre" required>
								<button type="submit" class="form__btn">Add Genre</button>
						</div>
					</div>
					</form>
				</div>
				
				<!-- dashbox -->
			<div class="col-12 col-xl-6">
				<div class="dashbox">
					<div class="dashbox__title">
						<h3><i class="icon ion-ios-apps"></i> Genres</h3>
					</div>
					<div class="dashbox__table-wrap">
						<table class="main__table main__table--dash">
							<thead>
								<tr>
								    <th class="col-xl-4">Genre ID</th>
									<th class="col-xl-4">Genre</th>
									<th class="col-xl-1">Delete</th>
								</tr>
							</thead>

							<tbody>
							
							   <% List<Genre> genres = (List<Genre>)request.getAttribute("genres");
								
									for(Genre g : genres){
								%>
							
								<tr>
								    <td>
										<div class="main__table-text"><%out.print(g.getGid());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(g.getName());%></div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" onclick="setDeleteID(<%out.print(g.getGid());%>)">
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
			</div>
			<!-- end dashbox -->


			</div>
		</div>
	</main>
	<!-- end main content -->

	<!-- genre delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">Delete genre</h6>

		<p class="modal__text">Are you sure to permanently delete?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button" onclick="deleteGenre()">Delete</button>
			<button class="modal__btn modal__btn--dismiss" type="button" onclick="setDeleteID(0)">Dismiss</button>
		</div>
	</div>
	<!-- end genre delete -->

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var deleteID = 0;
	function setDeleteID(id){
		deleteID = id;
	}
	function deleteGenre(){
		window.location.href = "DeleteGenre?gid="+deleteID;
	}
</script>