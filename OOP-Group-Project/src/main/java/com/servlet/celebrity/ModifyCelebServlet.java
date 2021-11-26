package com.servlet.celebrity;

import com.service.celebrity.CelebrityServiceAnjalee;
import com.util.ImageUtil;
import com.model.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/ModifyCelebs")
public class ModifyCelebServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		Celebrity c = CelebrityServiceAnjalee.getCelebDetails(cid);
		
		request.setAttribute("celebrity", c);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/modifyCelebs.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part cover =request.getPart("form__img-upload");
		String coverName= null;
		if(request.getPart("form__img-upload").getSize() > 0) {
			coverName = ImageUtil.uploadCelebrityCover(cover);	
		}
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String country = request.getParameter("country");
		int height = Integer.parseInt(request.getParameter("height"));
		String description = request.getParameter("description");
		String bio = request.getParameter("bio");
		String profession = request.getParameter("profession");


		boolean result;

		result = CelebrityServiceAnjalee.updateCelebrity(cid, fname, lname, dob, country, height, description, bio, profession, coverName); 

		response.sendRedirect("AdminCelebs?cmodify="+result);
	}

}
