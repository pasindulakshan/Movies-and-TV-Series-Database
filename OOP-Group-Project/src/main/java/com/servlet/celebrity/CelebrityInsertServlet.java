package com.servlet.celebrity;


import java.io.IOException;
import com.model.Celebrity;
import com.service.celebrity.CelebrityServiceAnjalee;
import com.util.ImageUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/AddCelebrities")
public class CelebrityInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			
			//check for get parameters (success msg)
			if(request.getParameter("cinsert") != null) {

				request.setAttribute("cinsert", request.getParameter("cinsert"));
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addCeleb.jsp");
			rd.forward(request, response);
		}
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Upload Cover Photo
		Part cover =request.getPart("form__img-upload");
		String coverName = ImageUtil.uploadCelebrityCover(cover);		
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String country = request.getParameter("country");
		String height = request.getParameter("height");
		int height2 = Integer.parseInt(height); 
		String description = request.getParameter("description");
		String bio = request.getParameter("bio");
		String profession = request.getParameter("profession");
		
		
		Celebrity c = new Celebrity(fname, lname, dob, country, height2, description, bio, profession,coverName);
		
		boolean result; 
		
		result = CelebrityServiceAnjalee.insertCelebrity(c);

		if(result == true) {

			response.sendRedirect("AdminCelebs?cinsert=true");
		    
		} else {
		   
			response.sendRedirect("AdminCelebs?cinsert=false");
	
		}
	}

}
