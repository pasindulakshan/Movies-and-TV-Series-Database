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
 * Servlet implementation class ModifyUser
 */
@WebServlet("/ModifyUser")
public class ModifyUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			int uid= Integer.parseInt(request.getParameter("uid"));
			User u = UserService.getUserDetails(uid);
			
			request.setAttribute("user", u);
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/modifyUsers.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int uid = Integer.parseInt(request.getParameter("uid"));	
		String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		String oldemail = request.getParameter("oldemail");
		
		if(!email.equals(oldemail)) {
			if(UserService.userEmailExits(email)){
				response.sendRedirect("ModifyUser?umodify=emailExits&uid="+uid);
			}
		}
		else {
			boolean isTrue;
			User u = new User(uid,fname, lname, email);
			isTrue = UserService.updateUser(u);
			
			if(isTrue == true) {
				response.sendRedirect("AdminUsers?umodify=true");
			} else {
				response.sendRedirect("ModifyUser?umodify=failed&uid="+uid);
			}
		}
	}

}
