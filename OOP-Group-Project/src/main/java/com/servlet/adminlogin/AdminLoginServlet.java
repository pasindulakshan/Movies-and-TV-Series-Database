package com.servlet.adminlogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.admin.AdminService;
import com.model.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("adminUser") == "admin") {
			response.sendRedirect("AdminDashboard");
		}
		else {
			String status  = request.getParameter("status");
			if(status == null) {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminLogin.jsp");
				rd.forward(request, response);
			}
			else if(status.equals("wrong")) {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminLogin.jsp?status=wrong");
				rd.forward(request, response);
			}
		}
	}
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		boolean isTrue;
		
		isTrue = AdminService.validateLogin(email, pass);
	
		if (isTrue == true) {
			HttpSession session = request.getSession();
			Admin admin = AdminService.getAdminDetails(email);
			int adminId = admin.getAdminId();
			String fname = admin.getFName();
			String lname = admin.getLName();
			
			session.setAttribute("adminUser", "admin");
			session.setAttribute("adminId", adminId);
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("email", email);
			
			response.sendRedirect("AdminDashboard");
		} else {
			response.sendRedirect("AdminLogin?status=wrong");
		}
	}

}
