package com.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Admin;
import com.service.admin.AdminServiceMayumi;

@WebServlet("/Admins")
public class AdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			List<Admin> admins = AdminServiceMayumi.getAdminsTableData();
			int acount = AdminServiceMayumi.getAdminCount();
			request.setAttribute("acount", acount);
			request.setAttribute("admins", admins);
			
			if(request.getParameter("adelete") != null) {
				request.setAttribute("adelete", request.getParameter("adelete"));
			}
			if(request.getParameter("amodify") != null) {
				request.setAttribute("amodify", request.getParameter("amodify"));
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/admins.jsp");
			rd.forward(request, response);
		}
		
		
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}