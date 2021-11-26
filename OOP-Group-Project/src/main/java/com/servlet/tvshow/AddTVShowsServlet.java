package com.servlet.tvshow;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.model.Celebrity;
import com.model.Episode;
import com.model.Genre;
import com.model.TVShow;
import com.service.celebrity.CelebrityService;
import com.service.genre.GenreService;
import com.service.tvshow.TVShowService;
import com.util.ImageUtil;

/**
 * Servlet implementation class AddTVShowsServelet
 */
@MultipartConfig
@WebServlet("/AddTVShows")
public class AddTVShowsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			//get all genres and celebrities from database
			List<Genre> genres = GenreService.getAllGenres();
			List<Celebrity> directors = CelebrityService.getAllNames("Director");
			List<Celebrity> writers = CelebrityService.getAllNames("Writer");
			List<Celebrity> actors = CelebrityService.getAllNames("Actor");;
			
			//check get request (success or failure)
			if(request.getParameter("add") != null) {
				request.setAttribute("add", request.getParameter("add"));
			}
			
			//set attributes
			request.setAttribute("genres", genres);
			request.setAttribute("directors", directors);
			request.setAttribute("writers", writers);
			request.setAttribute("actors", actors);

			//forward to jsp
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addTVShow.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Upload Cover Photo
		Part cover =request.getPart("form__img-upload");
		String coverName = ImageUtil.uploadTVShowCover(cover);
		
		///upload gallery
		List<Part> fileParts = request.getParts().stream().filter(part -> "gallery".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
		List<String> partNames = ImageUtil.uploadTVShowImages(fileParts);
		
		//get other parameters
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String rdate = request.getParameter("rdate");
		String runtime = request.getParameter("runtime");
		String country = request.getParameter("country");
		String[] etitle = request.getParameterValues("etitle");
		String[] eairdate = request.getParameterValues("eairdate");
		String[] edlink = request.getParameterValues("edlink");
		String[] roles = request.getParameterValues("roles");
		String trailer = request.getParameter("trailer");
		
		//get genre and celebrity ids and convert to integeres
		String[] genres = request.getParameterValues("genres");
		int[] genresInt = new int[genres.length];
		for(int i = 0;i < genres.length;i++)
		{
			genresInt[i] = Integer.parseInt(genres[i]);
		}
		
		String[] directors = request.getParameterValues("directors");
		int[] directorsInt = new int[directors.length];
		for(int i = 0;i < directors.length;i++)
		{
			directorsInt[i] = Integer.parseInt(directors[i]);
		}
		
		String[] writers = request.getParameterValues("writers");
		int[] writersInt = new int[writers.length];
		for(int i = 0;i < writers.length;i++)
		{
			writersInt[i] = Integer.parseInt(writers[i]);
		}
		
		String[] actors = request.getParameterValues("actors");
		int[] actorsInt = new int[actors.length];
		for(int i = 0;i < actors.length;i++)
		{
			actorsInt[i] = Integer.parseInt(actors[i]);
		}
		
		String[] snumber = request.getParameterValues("snumber");
		int[] snumberInt = new int[snumber.length];
		for(int i = 0;i < snumber.length;i++)
		{
			snumberInt[i] = Integer.parseInt(snumber[i]);
		}
		
		String[] enumber = request.getParameterValues("enumber");
		int[] enumberInt = new int[enumber.length];
		for(int i = 0;i < enumber.length;i++)
		{
			enumberInt[i] = Integer.parseInt(enumber[i]);
		}

		
		//Create Episode Objects
		List<Episode> e = new ArrayList<>();
		int k = enumberInt.length;
		for(int i = 0; i < k; i++) {
			Episode epi = new Episode(snumberInt[i], enumberInt[i], eairdate[i], etitle[i], edlink[i]);
			e.add(epi);
		}
		
		
		//Create TVShow Object
		TVShow t = new TVShow(title, description, rdate, runtime, country, genresInt, directorsInt, writersInt, actorsInt, roles, trailer, coverName, partNames, e);
		
		//get admin id from session
		HttpSession session = request.getSession(false);
		int adminid = (Integer) session.getAttribute("adminId");

		//add TVShow to database
		boolean status = TVShowService.addNewTVShow(t, adminid);
		
		//redirect to addTVShow page with success or failure message
		response.sendRedirect("AddTVShows?add="+status);
	}

}
