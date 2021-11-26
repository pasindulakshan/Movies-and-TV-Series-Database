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
 * Servlet implementation class ModifyTVShowServlet
 */
@MultipartConfig
@WebServlet("/ModifyTVShow")
public class ModifyTVShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			//get the tv show id from the request
			int tid = Integer.parseInt(request.getParameter("tid"));
	
			//get the tv show from the database
			TVShow t = TVShowService.getTVShowDetails(tid);
	
			//get the list of all the genres and celebrities
			List<Genre> genres = GenreService.getAllGenres();
			List<Celebrity> directors = CelebrityService.getAllNames("Director");
			List<Celebrity> writers = CelebrityService.getAllNames("Writer");
			List<Celebrity> actors = CelebrityService.getAllNames("Actor");
			
			//set all the attributes
			request.setAttribute("tvshow", t);
			request.setAttribute("genres", genres);
			request.setAttribute("directors", directors);
			request.setAttribute("writers", writers);
			request.setAttribute("actors", actors);
			request.setAttribute("tid", tid);
			
			//forward to the jsp page
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/modifyTVShows.jsp");
			rd.forward(request, response);
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//upload the image
		Part cover =request.getPart("form__img-upload");
		String coverName= null;
		if(request.getPart("form__img-upload").getSize() > 0) {
			coverName = ImageUtil.uploadTVShowCover(cover);
		}
		
		//upload gallery images
		List<Part> fileParts = request.getParts().stream().filter(part -> "gallery".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
		List<String> partNames = new ArrayList<>();
		if(request.getPart("gallery").getSize() > 0) {
			partNames = ImageUtil.uploadTVShowImages(fileParts);
		}
		
		//get other parameters
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String rdate = request.getParameter("rdate");
		String runtime = request.getParameter("runtime");
		String country = request.getParameter("country");
		String[] etitle = request.getParameterValues("etitle");
		String[] eairdate = request.getParameterValues("eairdate");
		String[] edlink = request.getParameterValues("edlink");
		
		//get genes and celebrities from the request and convert to int
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
		
		String[] roles = request.getParameterValues("roles");
		String trailer = request.getParameter("trailer");
		
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
		int tid = Integer.parseInt(request.getParameter("tid"));
		t.setID(tid);
		
		//update the tv show in the database
		boolean status = TVShowService.modifyTVShow(t);
		
		//redirect to the tv shows page with the status
		response.sendRedirect("AdminTVShows?tmodify="+status);
	}

}
