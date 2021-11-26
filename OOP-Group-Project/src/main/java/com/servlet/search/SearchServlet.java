package com.servlet.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Celebrity;
import com.model.Item;
import com.model.Movie;
import com.model.TVShow;
import com.service.celebrity.CelebrityService;
import com.service.movie.MovieService;
import com.service.search.SearchService;
import com.service.tvshow.TVShowService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		
		if(type.equals("tv")) {
			
			ArrayList<TVShow> tvshows = SearchService.searchTVShows(search);
			List<Item> topRatedTVShows = TVShowService.getTopRatedTVShows();
			
			request.setAttribute("topRatedTVShows", topRatedTVShows);
			request.setAttribute("tvshows", tvshows);
			request.setAttribute("result", search);
			request.getRequestDispatcher("/WEB-INF/views/tvsearch.jsp").forward(request, response);
		}
		else if(type.equals("movie")){
			
			ArrayList<Movie> movies = SearchService.searchMovies(search);
			List<Item> topRatedMovies = MovieService.getTopRatedMovies();
			
			request.setAttribute("topRatedMovies", topRatedMovies);
			request.setAttribute("movies", movies);
			request.setAttribute("result", search);
			request.getRequestDispatcher("/WEB-INF/views/moviesearch.jsp").forward(request, response);
		}
		else if(type.equals("celeb")){
			
			ArrayList<Celebrity> celebs = SearchService.searchCelebs(search);
			List<Celebrity> spotlightCelebs = CelebrityService.getSpotLightCelebs();
			
			request.setAttribute("spotlightCelebs", spotlightCelebs);
			request.setAttribute("celebs", celebs);
			request.setAttribute("result", search);
			request.getRequestDispatcher("/WEB-INF/views/celebsearch.jsp").forward(request, response);
		}
	}

}
