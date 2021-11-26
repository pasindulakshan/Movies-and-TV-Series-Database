package com.servlet.movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Movie;
import com.service.movie.MovieService;

/**
 * Servlet implementation class ModifyMovieServlet
 */
@WebServlet("/movie")
public class MovieSingleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mid = Integer.parseInt(request.getParameter("mid"));
		Movie m = MovieService.getMovieSingleDetails(mid);
		
		request.setAttribute("movie", m);
		request.setAttribute("mid", mid);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/movieSingle.jsp");
		rd.forward(request, response);
	}

}
