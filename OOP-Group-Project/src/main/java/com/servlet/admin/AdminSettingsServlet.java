package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Admin;
import com.service.admin.AdminServiceMayumi;

@WebServlet("/AdminSettings")
public class AdminSettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			int AdminID = (Integer) session.getAttribute("adminId");
			Admin ad = AdminServiceMayumi.getAdminDetails(AdminID);
			request.setAttribute("admin", ad);
			
			//check for get parameters (success msg)
			if(request.getParameter("status") != null) {
				request.setAttribute("status", request.getParameter("status"));
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminSettings.jsp");
			rd.forward(request, response);
				
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			int AdminID = (Integer) session.getAttribute("adminId");
			String fname = request.getParameter("fname");
	        String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			
			String sessionEmail = (String) session.getAttribute("email");
			
			if(!email.equals(sessionEmail)) {
				if(AdminServiceMayumi.emailExits(email)){
					response.sendRedirect("AdminSettings?status=emailExits");
				}
			}
			else {
			
			boolean isTrue;
			
				isTrue = AdminServiceMayumi.updateCurrentAdmin(AdminID,fname, lname, email);
				
				if(isTrue == true) {
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("email", email);
					response.sendRedirect("AdminSettings?status=strue");
				} else {
					response.sendRedirect("AdminSettings?status=sfalse");
				}
			}
		}
		
	}
}
