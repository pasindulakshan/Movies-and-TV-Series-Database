<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@page import="com.servlet.*"%>
<%@page import="com.util.*"%>
<%! @SuppressWarnings("unchecked") %>    
    
<!-- Include Header -->
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="Celebrities" name="title"/>
</jsp:include>
<!-- Include Sidebar -->
<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>

     <!-- main content -->
	<main class="main">
	<div id="msgbox-area" class="msgbox-area"></div>
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Celebrities</h2>

                        <span class="main__title-stat"><%out.print(request.getAttribute("celebCount")); %> Total</span>

						<div class="main__title-wrap">
                        	<a href="AddCelebrities" class="main__title-link">Add Celebrity</a>
                        	<p>&nbsp; &nbsp; &nbsp;</p>
                        	
                        	
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find celebrity">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- Celebrities -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table">
							<thead>
								<tr>
								    <th>Celebrity ID</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>DOB</th>
									<th>Country</th>
									<th>height</th>
									<th>Profession</th>
									<th>Modify/Delete</th>
								</tr>
							</thead>

							<tbody>
							
							      <%List<Celebrity> celebs = (List<Celebrity>)request.getAttribute("celebs");
								
									for(Celebrity c : celebs) {
								  %>
							
								<tr>
								    <td>
										<div class="main__table-text"><%out.print(c.getCid());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(c.getFname());%></div>
									</td>	
									<td>
										<div class="main__table-text"><%out.print(c.getLname());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(c.getDob());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(c.getCountry());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(c.getHeight());%></div>
									</td>
									<td>
										<div class="main__table-text"><%out.print(c.getProfession());%></div>
									</td>
																
									<td>
										<div class="main__table-btns">
											
											<a href="ModifyCelebs?cid=<%out.print(c.getCid());%>" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" onclick="setDeleteID(<%out.print(c.getCid());%>)">
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

	<!-- celebrity delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">Delete celebrity</h6>

		<p class="modal__text">Are you sure to permanently delete?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button" onclick="deleteCelebrity()">Delete</button>
			<button class="modal__btn modal__btn--dismiss" type="button" onclick="setDeleteID(0)">Dismiss</button>
		</div>
	</div>
	<!-- end celebrity delete -->

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script type="text/javascript">
	var deleteID = 0;
	function setDeleteID(id){
		deleteID = id;
	}
	function deleteCelebrity(){
		window.location.href = "DeleteCelebrity?cid="+deleteID;
	}
	
	<%
	if(request.getParameter("cdelete") != null){
		String mdelete = request.getParameter("cdelete");
		if(mdelete.equals("true")) {
			out.print("msgboxbox.show('Celebrity successfully deleted from the database');");
		}
		if(mdelete.equals("false")) {
			out.print("msgboxbox.show('Celebrity delete failed');");
		}
	}
	if(request.getParameter("cmodify") != null){
		String mdelete = request.getParameter("cmodify");
		if(mdelete.equals("true")) {
			out.print("msgboxbox.show('Celebrity successfully modified');");
		}
		if(mdelete.equals("false")) {
			out.print("msgboxbox.show('Celebrity modify failed');");
		}
	}
	if(request.getParameter("cinsert") != null){
		String add = request.getParameter("cinsert");
		if(add.equals("true")) {
			out.print("msgboxbox.show('Celebrity Successfully Added');");
		}
		if(add.equals("false")) {
			out.print("msgboxbox.show('Celebrity Adding Failed');");
		}
	}
	%>
</script>