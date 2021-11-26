package com.servlet.celebrity;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Celebrity;
import com.service.celebrity.CelebrityServiceAnjalee;


@WebServlet("/AdminCelebs")
public class CelebrityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			List<Celebrity> celebs = CelebrityServiceAnjalee.getCelebrityTableData();
			int celebCount = CelebrityServiceAnjalee.getCelebrityCount();
			request.setAttribute("celebCount", celebCount);
			request.setAttribute("celebs", celebs);
			
			if(request.getParameter("cdelete") != null) {
				request.setAttribute("cdelete", request.getParameter("cdelete"));
			}
			if(request.getParameter("cmodify") != null) {
				request.setAttribute("cmodify", request.getParameter("cmodify"));
			}
			if(request.getParameter("cinsert") != null) {
				request.setAttribute("cinsert", request.getParameter("cinsert"));
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminCelebs.jsp");
			rd.forward(request, response);
		}
    }
		
		
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
