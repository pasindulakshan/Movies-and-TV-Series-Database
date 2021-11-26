package com.servlet.movie;

import java.io.IOException;
import java.util.List;

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
import com.service.movie.MovieService;
import com.util.ImageUtil;

import java.util.stream.Collectors;

import com.service.genre.GenreService;
import com.service.celebrity.CelebrityService;

/**
 * Servlet implementation class AddMoviesServelet
 */
@MultipartConfig
@WebServlet("/AddMovies")
public class AddMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get session
		HttpSession session = request.getSession(false);

		//check if admin is logged in or not
		if(session == null || session.getAttribute("adminUser") == null) {
			response.sendRedirect("AdminLogin");
		}
		else {
			//get all genres
			List<Genre> genres = GenreService.getAllGenres();

			//get all celebrities
			List<Celebrity> directors = CelebrityService.getAllNames("Director");
			List<Celebrity> writers = CelebrityService.getAllNames("Writer");
			List<Celebrity> actors = CelebrityService.getAllNames("Actor");
			
			//check for get parameters (success msg)
			if(request.getParameter("add") != null) {

				request.setAttribute("add", request.getParameter("add"));
			}
			
			//set attributes
			request.setAttribute("genres", genres);
			request.setAttribute("directors", directors);
			request.setAttribute("writers", writers);
			request.setAttribute("actors", actors);

			//forward to jsp
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addMovie.jsp");
			rd.forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Upload Cover Photo
		Part cover = request.getPart("form__img-upload");
		String coverName = ImageUtil.uploadMovieCover(cover);
		
		///upload gallery
		List<Part> fileParts = request.getParts().stream().filter(part -> "gallery".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList());
		List<String> partNames = ImageUtil.uploadMovieImages(fileParts);
		
		//get other parameters
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String rdate = request.getParameter("rdate");
		String runtime = request.getParameter("runtime");
		String country = request.getParameter("country");
		String[] roles = request.getParameterValues("roles");
		String trailer = request.getParameter("trailer");
		String mdlink = request.getParameter("mdlink");
		
		//get genres and celebrity ids and convert to integers
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
		
		//get admin id from session
		HttpSession session = request.getSession(false);
		int adminid = (Integer) session.getAttribute("adminId");
		
		//add movie to database
		boolean status = MovieService.addNewMovie(m, adminid);
		
		//redirect to add movie page with status message
		response.sendRedirect("AddMovies?add="+status);
		
	}

}
