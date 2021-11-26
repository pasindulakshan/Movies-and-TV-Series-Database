package com.servlet.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Movie;

import com.service.movie.MovieService;

/**
 * Servlet implementation class AdminMoviesServlet
 */
@WebServlet("/AdminMovies")
public class AdminMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			//get movies and movie count from database
			List<Movie> movies = MovieService.getMoviesTableData();
			int mcount = MovieService.getMovieCount();

			//set attributes
			request.setAttribute("mcount", mcount);
			request.setAttribute("movies", movies);
			
			//heck for get parameter (return messages)
			if(request.getParameter("mdelete") != null) {
				request.setAttribute("mdelete", request.getParameter("mdelete"));
			}
			if(request.getParameter("mmodify") != null) {
				request.setAttribute("mmodify", request.getParameter("mmodify"));
			}
			
			//forward to jsp
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminMovies.jsp");
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
