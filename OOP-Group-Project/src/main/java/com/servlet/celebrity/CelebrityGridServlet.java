package com.servlet.celebrity;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Celebrity;
import com.service.celebrity.CelebrityService;
import com.service.celebrity.CelebrityServiceAnjalee;

@WebServlet("/celebrities")
public class CelebrityGridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Celebrity> celebs = CelebrityServiceAnjalee.getCelebrityGridData();
		int celebCount = CelebrityServiceAnjalee.getCelebrityCount();
		List<Celebrity> spotlightCelebs = CelebrityService.getSpotLightCelebs();
		
		request.setAttribute("celebCount", celebCount);
		request.setAttribute("celebs", celebs);
		request.setAttribute("spotlightCelebs", spotlightCelebs);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/celebrityGrid.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
