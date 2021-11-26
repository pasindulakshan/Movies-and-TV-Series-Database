package com.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.user.UserService;
/**
 * Servlet implementation class UserSingupServlet
 */
@WebServlet("/UserSingup")
public class UserSingupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String Firstname = request.getParameter("firstName");
		String Lastname = request.getParameter("lastName");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		
		if(!password.equals(repassword)) {
        	response.sendRedirect("home?signup=passwordissmatch");
		}
		else if(UserService.userEmailExits(email)){
			response.sendRedirect("home?signup=emailExits");
		}
		else {
			boolean isTrue;
			
			isTrue = UserService.userSingup(Firstname,Lastname,email,password);
			
			if(isTrue == true) {
				response.sendRedirect("home?signup=success");
			} else {
				response.sendRedirect("home?signup=unsuccess");
			}
			
		}
	}
}
