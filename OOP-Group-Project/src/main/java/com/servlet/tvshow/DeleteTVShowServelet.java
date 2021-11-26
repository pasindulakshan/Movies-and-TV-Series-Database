package com.servlet.tvshow;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.tvshow.TVShowService;

/**
 * Servlet implementation class DeleteTVShowServelet
 */
@WebServlet("/DeleteTVShow")
public class DeleteTVShowServelet extends HttpServlet {
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
			int tid = Integer.parseInt(request.getParameter("tid"));
			TVShowService.deleteTVShow(tid);
	
			response.sendRedirect("AdminTVShows?tdelete=success");
		}
		
	}

}
