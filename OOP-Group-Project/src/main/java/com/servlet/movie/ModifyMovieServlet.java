package com.servlet.movie;

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
import com.model.Genre;
import com.model.Movie;
import com.service.celebrity.CelebrityService;
import com.service.genre.GenreService;
import com.service.movie.MovieService;
import com.util.ImageUtil;

/**
 * Servlet implementation class ModifyMovieServlet
 */
@MultipartConfig
@WebServlet("/ModifyMovie")
public class ModifyMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			//get movie id from request
			int mid = Integer.parseInt(request.getParameter("mid"));
	
			//get movie from database
			Movie m = MovieService.getMovieDetails(mid);
	
			//get all genres
			List<Genre> genres = GenreService.getAllGenres();
	
			//get all celebrities
			List<Celebrity> directors = CelebrityService.getAllNames("Director");
			List<Celebrity> writers = CelebrityService.getAllNames("Writer");
			List<Celebrity> actors = CelebrityService.getAllNames("Actor");
			
			//set attributes
			request.setAttribute("movie", m);
			request.setAttribute("genres", genres);
			request.setAttribute("directors", directors);
			request.setAttribute("writers", writers);
			request.setAttribute("actors", actors);
			request.setAttribute("mid", mid);
			
			//forward to jsp
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/modifyMovies.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//upload cover image
		Part cover =request.getPart("form__img-upload");
		String coverName= null;
		if(request.getPart("form__img-upload").getSize() > 0) {
			coverName = ImageUtil.uploadMovieCover(cover);
		}
		
		//upload gallery images
		List<Part> fileParts = request.getParts().stream().filter(part -> "gallery".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
		List<String> partNames = new ArrayList<>();
		if(request.getPart("gallery").getSize() > 0) {
			partNames = ImageUtil.uploadMovieImages(fileParts);
		}
		
		//get other parameters
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String rdate = request.getParameter("rdate");
		String runtime = request.getParameter("runtime");
		String country = request.getParameter("country");
		String[] roles = request.getParameterValues("roles");
		String trailer = request.getParameter("trailer");
		String mdlink = request.getParameter("mdlink");
		
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
		//create movie object
		Movie m = new Movie(title, description, rdate, runtime, country, genresInt, directorsInt, writersInt, actorsInt, roles, trailer, mdlink, coverName, partNames);
		
		int mid = Integer.parseInt(request.getParameter("mid"));
		m.setID(mid);
		
		//update movie
		boolean status = MovieService.modifyMovie(m);

		//redirect to admin movies page with status message
		response.sendRedirect("AdminMovies?mmodify="+status);
	}

}
