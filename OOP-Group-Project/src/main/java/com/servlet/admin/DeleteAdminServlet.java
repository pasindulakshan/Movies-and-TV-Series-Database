package com.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.service.admin.AdminServiceMayumi;

@WebServlet("/DeleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int AdminID = Integer.parseInt(request.getParameter("AdminID"));
		AdminServiceMayumi.deleteAdmin(AdminID);

		response.sendRedirect("Admins?adelete=success");
	}

}