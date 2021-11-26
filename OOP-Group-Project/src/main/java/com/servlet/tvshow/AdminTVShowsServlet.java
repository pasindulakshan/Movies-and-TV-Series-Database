package com.servlet.tvshow;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.TVShow;

import com.service.tvshow.TVShowService;

/**
 * Servlet implementation class AdminTVShowsServlet
 */
@WebServlet("/AdminTVShows")
public class AdminTVShowsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get the session
		HttpSession session = request.getSession(false);

		// Check if the admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			// Get the list of TV shows 
			List<TVShow> tvshows = TVShowService.getTVShowsTableData();
			int tvcount = TVShowService.getTVShowCount();

			// Set the list of TV shows in the request
			request.setAttribute("tvcount", tvcount);
			request.setAttribute("tvshows", tvshows);
			
			//check get parameter for succses/error messages
			if(request.getParameter("tdelete") != null) {
				request.setAttribute("tdelete", request.getParameter("tdelete"));
			}
			if(request.getParameter("tmodify") != null) {
				request.setAttribute("tmodify", request.getParameter("tmodify"));
			}
			
			// Forward to the JSP page
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminTVShows.jsp");
			rd.forward(request, response);
		}
		
		
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
