package com.servlet.tvshow;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.TVShow;
import com.service.tvshow.TVShowService;

/**
 * Servlet implementation class ModifyTVShowServlet
 */
@WebServlet("/tvshow")
public class TvShowsSingleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tid = Integer.parseInt(request.getParameter("tid"));
		TVShow t = TVShowService.getTVShowSingleDetails(tid);;
		
		request.setAttribute("tvshow", t);
		request.setAttribute("tid", tid);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/tvshowsingle.jsp");
		rd.forward(request, response);
	}
}
