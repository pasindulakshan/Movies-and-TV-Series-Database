package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Item;
import com.service.movie.MovieService;
import com.service.tvshow.TVShowService;
import com.model.User;
import com.service.user.UserService;
import com.service.common.CommonService;
/**
 * Servlet implementation class AdminDashboard
 */
@WebServlet("/AdminDashboard")
public class AdminDashboardSvr extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get Session
		HttpSession session = request.getSession(false);
		
		//Check If admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {

			int views = CommonService.getTotalViews();
			int newItems = CommonService.getNewItemsMonthly();
			int downloads = CommonService.getTotalDownloads();
			int newUsers = UserService.getNewUsersMonthly();
			List<Item> topRatedMovies = MovieService.getTopRatedMovies();
			List<Item> topRatedTVShows = TVShowService.getTopRatedTVShows();
			List<Item> latestItems = CommonService.getLatestItems(5);
			List<User> latestUsers = UserService.getLatestUsers();
			
			request.setAttribute("views", views);
			request.setAttribute("newItems", newItems);
			request.setAttribute("downloads", downloads);
			request.setAttribute("newUsers", newUsers);
			request.setAttribute("topRatedMovies", topRatedMovies);
			request.setAttribute("topRatedTVShows", topRatedTVShows);
			request.setAttribute("latestItems", latestItems);
			request.setAttribute("latestUsers", latestUsers);
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/adminDB.jsp");
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
