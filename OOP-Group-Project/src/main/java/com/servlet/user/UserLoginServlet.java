package com.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;
import com.service.user.UserService;


/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.sendRedirect("home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		boolean isTrue;
		
		isTrue = UserService.validateLogin(email, pass);
	
		if (isTrue == true) {
			HttpSession session = request.getSession();
			User user = UserService.getUserDetails(email);
			int userID = user.getId();
			String fname = user.getFirstName();
			String lname = user.getLastName();
			
			session.setAttribute("user", "user");
			session.setAttribute("userID", userID);
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("email", email);
			
			response.sendRedirect("home?loginstatus=success");
		} else {
			response.sendRedirect("home?loginstatus=wrong");
		}
    }

}
