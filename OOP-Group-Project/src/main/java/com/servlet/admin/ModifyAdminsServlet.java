package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Admin;
import com.service.admin.AdminServiceMayumi;

@WebServlet("/ModifyAdmins")
public class ModifyAdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int AdminID= Integer.parseInt(request.getParameter("AdminID"));
		Admin ad = AdminServiceMayumi.getAdminDetails(AdminID);
		
		request.setAttribute("admin", ad);
		
		if(request.getParameter("amodify") != null) {
			request.setAttribute("amodify", request.getParameter("amodify"));
		}
		else {
			
			//check for get parameters (success msg)
			if(request.getParameter("add") != null) {

				request.setAttribute("add", request.getParameter("add"));
			}
			
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/modifyAdmins.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int AdminID = Integer.parseInt(request.getParameter("AdminID"));
		String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		String oldemail = request.getParameter("oldemail");
		
		if(!email.equals(oldemail)) {
			if(AdminServiceMayumi.emailExits(email)){
				response.sendRedirect("ModifyAdmins?amodify=emailExits&AdminID="+AdminID);
			}
		}
		else {
			boolean isTrue;
			
			isTrue = AdminServiceMayumi.updateCurrentAdmin(AdminID,fname, lname, email);
			
			if(isTrue == true) {
				response.sendRedirect("Admins?amodify=true");
			} else {
				response.sendRedirect("ModifyAdmins?amodify=failed&AdminID="+AdminID);
			}
		}
	}
}