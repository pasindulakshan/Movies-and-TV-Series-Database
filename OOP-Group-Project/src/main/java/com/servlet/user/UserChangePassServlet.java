package com.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.user.UserService;

/**
 * Servlet implementation class UserChangePassServlet
 */
@WebServlet("/UserChangePass")
public class UserChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String confirmpassword = request.getParameter("confirmpassword");
		
		if(!newpassword.equals(confirmpassword)) {
	        	response.sendRedirect("UserSettings?status=passwordissmatch");
	    }
		else if(UserService.passwordCheck(oldpassword)) {
			boolean isTrue;
			HttpSession session = request.getSession(false);
			int userID = (Integer) session.getAttribute("userID");
			
			isTrue = UserService.changePassword(confirmpassword, userID);
			
			if(isTrue == true) {		
				response.sendRedirect("UserSettings?status=passwordtrue");
			}
			else {
				response.sendRedirect("UserSettings?status=passwordfalse");
			}
		}
		else {
			response.sendRedirect("UserSettings?status=wrongpassword"); 
		}
		
	}

}
