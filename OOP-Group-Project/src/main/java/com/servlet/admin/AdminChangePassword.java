package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.admin.AdminServiceMayumi;

@WebServlet("/AdminChangePassword")
public class AdminChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String confirmpass = request.getParameter("confirmpass");
		
		if(!newpass.equals(confirmpass)) {
	        	response.sendRedirect("AdminSettings?status=pmissmatch");
	    }
		else if(AdminServiceMayumi.passwordCheck(oldpass)) {
			boolean isTrue;
			HttpSession session = request.getSession(false);
			int AdminID = (Integer) session.getAttribute("adminId");
			
			isTrue = AdminServiceMayumi.ChangePassword(confirmpass, AdminID);
			
			if(isTrue == true) {		
				response.sendRedirect("AdminSettings?status=ptrue");
			}
			else {
				response.sendRedirect("AdminSettings?status=pfalse");
			}
		}
		else {
			response.sendRedirect("AdminSettings?status=wrongpass");
		}
		
	}
}

