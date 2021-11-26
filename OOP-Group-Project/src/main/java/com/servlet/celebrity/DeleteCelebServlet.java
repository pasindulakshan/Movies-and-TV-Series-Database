package com.servlet.celebrity;

import com.service.celebrity.CelebrityServiceAnjalee;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet("/DeleteCelebrity")
public class DeleteCelebServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cid"));

		boolean isTrue;
		
		isTrue = CelebrityServiceAnjalee.deleteCelebrity(cid);
		
		if (isTrue == true) {
			response.sendRedirect("AdminCelebs?cdelete=true");
		}
		else {
			
			response.sendRedirect("AdminCelebs?cdelete=false");

		}
	}
}
