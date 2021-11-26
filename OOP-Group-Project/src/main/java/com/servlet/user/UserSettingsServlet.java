package com.servlet.user;

import java.io.IOException;

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
 * Servlet implementation class UserSettingsServlet
 */
@WebServlet("/UserSettings")
public class UserSettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("user") == null) {
			response.sendRedirect("home");
		}
		else {
			int uid = (Integer) session.getAttribute("userID");
			User u = UserService.getUserDetails(uid);
			request.setAttribute("user", u);
			
			String status  = request.getParameter("status");
			
			if(status == null) {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/userprofile.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/userprofile.jsp?status="+status);
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("user") == null) {
			response.sendRedirect("home");
		}
		else {
			int uid = (Integer) session.getAttribute("userID");
			String fname = request.getParameter("fname");
	        String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			
			String sessionEmail = (String) session.getAttribute("email");
			
			if(!email.equals(sessionEmail)) {
				if(UserService.userEmailExits(email)){
					response.sendRedirect("UserSettings?status=emailExits");
				}
			}
			else {
			
			boolean isTrue;
			
				User u = new User(uid,fname, lname, email);
				isTrue = UserService.updateUser(u);
				
				if(isTrue == true) {
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("email", email);
					response.sendRedirect("UserSettings?status=strue");
				} else {
					response.sendRedirect("UserSettings?status=sfalse");
				}
			}
		}
		
	}
}
