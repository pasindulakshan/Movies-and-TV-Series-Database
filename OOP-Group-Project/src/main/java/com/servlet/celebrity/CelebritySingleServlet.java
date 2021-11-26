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
import com.model.Item;
import com.service.celebrity.CelebrityServiceAnjalee;

@WebServlet("/celebrity")
public class CelebritySingleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		Celebrity c = CelebrityServiceAnjalee.getCelebSingleDetails(cid);
		List<Item> items = CelebrityServiceAnjalee.getFilmography(cid);
		
		request.setAttribute("celebrity", c);
		request.setAttribute("items", items);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/celebritySingle.jsp");
		rd.forward(request, response);
	}

}
