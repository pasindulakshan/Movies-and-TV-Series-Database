package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Celebrity;
import com.model.Item;
import com.service.celebrity.CelebrityService;
import com.service.common.CommonService;
import com.service.movie.MovieService;
import com.service.tvshow.TVShowService;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> latestItems = CommonService.getLatestItems2(10);
		List<Item> topRatedMovies = MovieService.getTopRatedMovies();
		List<Item> topRatedTVShows = TVShowService.getTopRatedTVShows();
		List<Celebrity> spotlightCelebs = CelebrityService.getSpotLightCelebs();
		
		request.setAttribute("topRatedMovies", topRatedMovies);
		request.setAttribute("topRatedTVShows", topRatedTVShows);
		request.setAttribute("latestItems", latestItems);
		request.setAttribute("spotlightCelebs", spotlightCelebs);
				
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
