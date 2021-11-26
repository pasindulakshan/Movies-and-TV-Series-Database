package com.servlet.genre;
import com.service.genre.GenreServiceAnjalee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteGenre")
public class DeleteGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gid = Integer.parseInt(request.getParameter("gid"));

		boolean isTrue;
		
		isTrue = GenreServiceAnjalee.deleteGenre(gid);
		
		if (isTrue == true) {
			response.sendRedirect("AdminGenres?gdelete=true");
		}
		else {
			
			response.sendRedirect("AdminGenres?gdelete=false");

		}
	}

}
