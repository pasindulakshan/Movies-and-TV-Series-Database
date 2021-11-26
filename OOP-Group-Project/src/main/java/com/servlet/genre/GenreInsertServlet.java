package com.servlet.genre;

import com.service.genre.GenreServiceAnjalee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddGenres")
public class GenreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("genre");

		boolean result;

		result = GenreServiceAnjalee.insertGenre(name); 

		if(result == true) {

			response.sendRedirect("AdminGenres?ginsert=true");
		    
		} else {
		   
			response.sendRedirect("AdminGenres?ginsert=false");
		}
	}

}
