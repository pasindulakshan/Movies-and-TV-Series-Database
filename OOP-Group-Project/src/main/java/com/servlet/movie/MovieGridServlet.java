package com.servlet.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Item;
import com.model.Movie;
import com.service.movie.MovieService;

/**
 * Servlet implementation class MovieGridServlet
 */
@WebServlet("/movies")
public class MovieGridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Movie> movies = MovieService.getMovieGridData();
		int mcount = MovieService.getMovieCountGrid();
		List<Item> topRatedMovies = MovieService.getTopRatedMovies();
		
		request.setAttribute("mcount", mcount);
		request.setAttribute("movies", movies);
		request.setAttribute("topRatedMovies", topRatedMovies);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/movieGrid.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
