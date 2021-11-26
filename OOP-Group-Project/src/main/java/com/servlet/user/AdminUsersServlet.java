package com.servlet.user;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;
import com.service.user.UserService;

/**
 * Servlet implementation class AdminUsers
 */
@WebServlet("/AdminUsers")
public class AdminUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			
			List<User> users = UserService.getUsersTableData();
			int ucount = UserService.getUserCount();
			request.setAttribute("ucount", ucount);
			request.setAttribute("users", users);
			
			if(request.getParameter("udelete") != null) {
				request.setAttribute("udelete", request.getParameter("udelete"));
			}
			if(request.getParameter("umodify") != null) {
				request.setAttribute("umodify", request.getParameter("umodify"));
			}
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminUsers.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
