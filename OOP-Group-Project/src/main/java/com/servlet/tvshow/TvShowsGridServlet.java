package com.servlet.tvshow;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Item;
import com.model.TVShow;
import com.service.tvshow.TVShowService;


@WebServlet("/tvshows")
public class TvShowsGridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<TVShow> tvshows = TVShowService.getTvShowGridData();
		int tsCount = TVShowService.getTvShowCountGrid();
		List<Item> topRatedTVShows = TVShowService.getTopRatedTVShows();
		
		request.setAttribute("tsCount", tsCount);
		request.setAttribute("tvshows", tvshows);
		request.setAttribute("topRatedTVShows", topRatedTVShows);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/tvshowsGrid.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doGet(request, response);
	}

}
