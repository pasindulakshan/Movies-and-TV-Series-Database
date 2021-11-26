package com.servlet.genre;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Genre;
import com.service.genre.GenreServiceAnjalee;

@WebServlet("/AdminGenres")
public class GenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	
		 HttpSession session = request.getSession(false);
		 	if(session == null || session.getAttribute("adminUser") == null) {
				response.sendRedirect("AdminLogin");
			}
			else {
				List<Genre> g = GenreServiceAnjalee.getGenreTableData();
				int gCount = GenreServiceAnjalee.getGenreCount();
				request.setAttribute("gCount", gCount);
				request.setAttribute("genres", g);
				
				if(request.getParameter("gdelete") != null) {
					request.setAttribute("gdelete", request.getParameter("gdelete"));
				}
				if(request.getParameter("ginsert") != null) {
					request.setAttribute("ginsert", request.getParameter("ginsert"));
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminGenres.jsp");
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
