package com.service.movie;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Cast;
import com.model.Celebrity;
import com.model.Genre;
import com.model.Item;
import com.model.Movie;
import com.util.DBConnectUtil;

public class MovieService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static Statement stmt2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	public static boolean addNewMovie(Movie m, int adminID) {
		try {
            con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            
            String title = m.getTitle();
        	String description= m.getDescription();
        	String rdate = m.getRdate();
        	String runtime = m.getRuntime();
        	String country = m.getCountry();
        	String trailer = m.getTrailer();
        	String cover = m.getCover();
        	String mdlink = m.getMdlink();
			
            String sql = "INSERT INTO Movie (title, release_date, runtime, description, poster, download_link, added_by, added_date, views, downloads, country, trailer) VALUES ('"+title+"', '"+rdate+"','"+runtime+"','"+description+"','"+cover+"','"+mdlink+"', "+adminID+", CURDATE(),0,0, '"+country+"', '"+trailer+"');";
            stmt.executeUpdate(sql);

            //get mid of last inserted movie
            sql = "SELECT mid FROM Movie WHERE title = '"+title+"' AND poster = '"+cover+"';";
            rs = stmt.executeQuery(sql);
            rs.next();
            int mid = rs.getInt(1);
            
            //add genres to movie
            for(int g : m.getGenres()) {
            	sql = "INSERT INTO Movie_Genre (mid, gid) VALUES ("+mid+","+g+");";
            	stmt.executeUpdate(sql);
            }
            
            //add directors to movie
            for(int c : m.getDirectors()) {
            	sql = "INSERT INTO Movie_Director (mid, cid) VALUES ("+mid+","+c+");";
            	stmt.executeUpdate(sql);
            }
            
            //add writers to movie
            for(int c : m.getWriters()) {
            	sql = "INSERT INTO Movie_Writer (mid, cid) VALUES ("+mid+","+c+");";
            	stmt.executeUpdate(sql);
            }

            //add gallery to movie_image
            for(String img : m.getGallery()) {
            	sql = "INSERT INTO Movie_Image (mid, image) VALUES ("+mid+",'"+img+"');";
            	stmt.executeUpdate(sql);
            }

	        int[] actors = m.getActors();
	        String[] roles = m.getRoles();

	        int count = 0;
            //add actors and roles to movie cast
            for(int i = 0; i < actors.length; i++) {
            	sql = "INSERT INTO Movie_Cast (mid, cid, role) VALUES ("+mid+","+actors[i]+",'"+roles[i]+"');";
            	count = stmt.executeUpdate(sql);
            }
            
            if(count > 0) {
            	return true;
            }
            else {
            	return false;
            }
            
        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
		return false;
    }
	
	public static List<Movie> getMoviesTableData() {
		ArrayList<Movie> movies = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT mid, title, added_by, added_date, views FROM Movie;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int mid = rs.getInt(1);
            	String title = rs.getString(2);
            	String aid = rs.getString(3);
            	String added_date = rs.getString(4);
            	int views = rs.getInt(5);
            	
            	stmt2 = con.createStatement();
            	
            	sql = "SELECT fname, lname FROM Admin Where adminid = "+aid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	String adminName = rs2.getString(1) + " " + rs2.getString(2); 
            	
            	sql = "SELECT IFNULL(AVG(rating), 0) FROM movie_rating WHERE mid = "+mid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	double rating = rs2.getDouble(1);
           	
            	Movie m = new Movie(mid, title, rating, views, added_date, adminName);
            	movies.add(m);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return movies;
	}

	public static void deleteMovie(int mid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "DELETE FROM Movie WHERE mid = "+mid+";";
	        stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
	}

	public static Movie getMovieDetails(int mid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM Movie WHERE mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        
	        String title = rs.getString(2);
	        String rdate = rs.getString(3);
	        String runtime = rs.getString(4);
	        String description = rs.getString(5);
	        String cover = rs.getString(6);
	        String mdlink = rs.getString(7);
	        String country = rs.getString(12);
	        String trailer = rs.getString(13);
	      
	        ArrayList<Celebrity> directors = new ArrayList<>();
	        ArrayList<Celebrity> writers = new ArrayList<>();
	        ArrayList<Genre> genres = new ArrayList<>();
	        ArrayList<Cast> casts = new ArrayList<>();
	        
	        sql = "SELECT m.cid,m.role,c.fname,c.lname FROM movie_cast AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String role = rs.getString(2);
	        	String fname = rs.getString(3);
	        	String lname = rs.getString(4);
	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname);
	        	Cast cast = new Cast(celeb, role);
	        	
	        	casts.add(cast);
	        }
	        
	        sql = "SELECT m.gid, g.name FROM movie_genre AS m LEFT JOIN genre AS g ON m.gid = g.gid WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int gid = rs.getInt(1);
	        	String gname = rs.getString(2);
	        	
	        	Genre g = new Genre(gid, gname);
	        	genres.add(g);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname FROM movie_director AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname);
	        	
	        	directors.add(celeb);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname FROM movie_writer AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname);
	        	
	        	writers.add(celeb);
	        }
	        
	        Movie movie = new Movie( title, description, rdate, runtime, country, genres,
	    			directors, writers, casts, trailer, mdlink,
	    			cover);
	        return movie;
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
	
	public static Movie getMovieSingleDetails(int mid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM Movie WHERE mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        
	        String title = rs.getString(2);
	        String rdate = rs.getString(3);
	        String runtime = rs.getString(4);
	        String description = rs.getString(5);
	        String cover = rs.getString(6);
	        String mdlink = rs.getString(7);
	        String country = rs.getString(12);
	        String trailer = rs.getString(13);
	      
	        ArrayList<Celebrity> directors = new ArrayList<>();
	        ArrayList<Celebrity> writers = new ArrayList<>();
	        ArrayList<Genre> genres = new ArrayList<>();
	        ArrayList<Cast> casts = new ArrayList<>();
	        
	        sql = "SELECT m.cid,m.role,c.fname,c.lname,c.image FROM movie_cast AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String role = rs.getString(2);
	        	String fname = rs.getString(3);
	        	String lname = rs.getString(4);
	        	String image = rs.getString(5);

	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname,image);
	        	Cast cast = new Cast(celeb, role);
	        	
	        	casts.add(cast);
	        }
	        
	        sql = "SELECT m.gid, g.name FROM movie_genre AS m LEFT JOIN genre AS g ON m.gid = g.gid WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int gid = rs.getInt(1);
	        	String gname = rs.getString(2);
	        	
	        	Genre g = new Genre(gid, gname);
	        	genres.add(g);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname,c.image FROM movie_director AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	String image = rs.getString(4);

	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname,image);
	        	
	        	directors.add(celeb);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname,c.image FROM movie_writer AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.mid = "+mid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	String image = rs.getString(4);

	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname,image);
	        	
	        	writers.add(celeb);
	        }
	        
	        sql = "SELECT IFNULL(AVG(rating), 0) FROM movie_rating WHERE mid = "+mid+";";
        	rs = stmt.executeQuery(sql);
        	rs.next();
        	double rating = rs.getDouble(1);
	        
	        Movie movie = new Movie( title, description, rdate, runtime, country, genres,
	    			directors, writers, casts, trailer, mdlink, cover, rating);
	        return movie;
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
	

	public static boolean modifyMovie(Movie m) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        
	        int mid = m.getId();
	        String title = m.getTitle();
	    	String description= m.getDescription();
	    	String rdate = m.getRdate();
	    	String runtime = m.getRuntime();
	    	String country = m.getCountry();
	    	String trailer = m.getTrailer();
			String mdlink = m.getMdlink();
			String cover = m.getCover();
	    	
	    	//Movie table update statement
			String sql = "UPDATE Movie SET title = '"+title+"', description = '"+description+"', release_date = '"+rdate+"', runtime = '"+runtime+"', country = '"+country+"', trailer = '"+trailer+"', download_link = '"+mdlink+"' WHERE mid = "+mid+";";
			stmt.executeUpdate(sql);

	    	//Update cover
			if(cover != null){
				sql = "UPDATE Movie SET poster = '"+cover+"' WHERE mid = "+mid+";";
				stmt.executeUpdate(sql);
			}

			//Remove existing casts
			sql = "DELETE FROM movie_cast WHERE mid = "+mid+";";
			stmt.executeUpdate(sql);
			
			//Add new casts
			int[] actors = m.getActors();
		    String[] roles = m.getRoles();

            for(int i = 0; i < actors.length; i++) {
            	sql = "INSERT INTO Movie_Cast (mid, cid, role) VALUES ("+mid+","+actors[i]+",'"+roles[i]+"');";
            	stmt.executeUpdate(sql);
            }
			
			//Remove existing genres
			sql = "DELETE FROM movie_genre WHERE mid = "+mid+";";
			stmt.executeUpdate(sql);
			
			//Add new genres
			for(int g : m.getGenres()){
				sql = "INSERT INTO movie_genre (mid, gid) VALUES ("+mid+", "+g+");";
				stmt.executeUpdate(sql);
			}
			
			//Remove existing directors
			sql = "DELETE FROM movie_director WHERE mid = "+mid+";";
			stmt.executeUpdate(sql);
			
			//Add new directors
			for(int c : m.getDirectors()){
				sql = "INSERT INTO movie_director (mid, cid) VALUES ("+mid+", "+c+");";
				stmt.executeUpdate(sql);
			}
			
			//Remove existing writers
			sql = "DELETE FROM movie_writer WHERE mid = "+mid+";";
			stmt.executeUpdate(sql);
			
			//Add new writers
			for(int c : m.getWriters()){
				sql = "INSERT INTO movie_writer (mid, cid) VALUES ("+mid+", "+c+");";
				stmt.executeUpdate(sql);
			}

	    	//Add Gallery images
			List<String> gallery = m.getGallery();
			if(gallery.size() > 0){
				for(String img : m.getGallery()){
					sql = "INSERT INTO movie_image (mid, image) VALUES ("+mid+", '"+img+"');";
					stmt.executeUpdate(sql);
				}
			}

			return true;
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return false;
	}
	
	public static int getMovieCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(mid) FROM Movie;";
            rs = stmt.executeQuery(sql);
            rs.next();
	        int count = rs.getInt(1);
	        return count;
		}
		catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return 0;
	}
	
	public static List<Item> getTopRatedMovies() {
		List<Item> movies = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT mid, avg(rating) FROM Movie_Rating GROUP BY mid ORDER BY avg(rating) DESC LIMIT 5;";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int mid = rs.getInt(1);
				double rating = rs.getDouble(2);
				
				sql = "SELECT title,views,poster FROM Movie WHERE mid = "+mid+";";
				stmt2 = con.createStatement();
				rs2 = stmt2.executeQuery(sql);
				rs2.next();
				
				String title = rs2.getString(1);
				int views = rs2.getInt(2);
				String poster = rs2.getString(3);
				
				Item m = new Item(mid, title, views, rating, poster);
				movies.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return movies;
	}
	
	public static List<Movie> getMovieGridData() {
		ArrayList<Movie> movies = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT mid, title, poster FROM Movie;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int mid = rs.getInt(1);
            	String title = rs.getString(2);
            	String poster = rs.getString(3);
            	
            	stmt2 = con.createStatement();
            	
            	sql = "SELECT IFNULL(AVG(rating), 0) FROM movie_rating WHERE mid = "+mid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	double rating = rs2.getDouble(1);
           	
            	Movie m = new Movie(mid, title, poster,rating);
            	movies.add(m);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return movies;
	}
	
	public static int getMovieCountGrid() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(mid) FROM movie;";
            rs = stmt.executeQuery(sql);
            rs.next();
	        int count = rs.getInt(1);
	        return count;
		}
		catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return 0;
	}
	
}
