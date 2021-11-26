package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.service.admin.AdminServiceMayumi;


@WebServlet("/AddAdmins")
public class AddAdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//check for get parameters (success msg)
			if(request.getParameter("status") != null) {
				request.setAttribute("status", request.getParameter("status"));
			}
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addAdmins.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Cpassword = request.getParameter("Cpassword");
        
        if(!password.equals(Cpassword)) {
        	response.sendRedirect("AddAdmins?status=pmissmatch");
        }
        else if(AdminServiceMayumi.emailExits(email)){
			response.sendRedirect("AddAdmins?status=emailExits");
		}
        else {
		
			boolean isTrue;
			
			isTrue = AdminServiceMayumi.insertAdmin(fname, lname, email,password);
			
			if(isTrue == true) {
				response.sendRedirect("AddAdmins?status=true");
			} else {
				response.sendRedirect("AddAdmins?status=false");
			}
		
        }
	}

}

