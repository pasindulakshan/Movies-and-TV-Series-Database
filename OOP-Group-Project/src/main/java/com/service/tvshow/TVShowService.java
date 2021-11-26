package com.service.tvshow;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Cast;
import com.model.Celebrity;
import com.model.Episode;
import com.model.Genre;
import com.model.Item;
import com.model.TVShow;
import com.util.DBConnectUtil;

public class TVShowService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static Statement stmt2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	public static boolean addNewTVShow(TVShow m, int adminID) {
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
	    	
	    	
	        String sql = "INSERT INTO TVShow (title, release_date, runtime, description, poster, added_by, added_date, views, country, trailer) VALUES ('"+title+"', '"+rdate+"','"+runtime+"','"+description+"','"+cover+"', "+adminID+", CURDATE(),0, '"+country+"', '"+trailer+"');";
	        stmt.executeUpdate(sql);
	
	        //get mid of last inserted movie
	        sql = "SELECT tid FROM TVShow WHERE title = '"+title+"' AND poster = '"+cover+"';";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        int tid = rs.getInt(1);
	        
	        //add genres to movie
	        for(int g : m.getGenres()) {
	        	sql = "INSERT INTO TVShow_Genre (tid, gid) VALUES ("+tid+","+g+");";
	        	stmt.executeUpdate(sql);
	        }
	        
	        //add directors to movie
	        for(int c : m.getDirectors()) {
	        	sql = "INSERT INTO TVShow_Director (tid, cid) VALUES ("+tid+","+c+");";
	        	stmt.executeUpdate(sql);
	        }
	        
	        //add writers to movie
	        for(int c : m.getWriters()) {
	        	sql = "INSERT INTO TVShow_Writer (tid, cid) VALUES ("+tid+","+c+");";
	        	stmt.executeUpdate(sql);
	        }
	
	        //add gallery to movie_image
	        for(String img : m.getGallery()) {
	        	sql = "INSERT INTO TVShow_Image (tid, image) VALUES ("+tid+",'"+img+"');";
	        	stmt.executeUpdate(sql);
	        }
	
	        int[] actors = m.getActors();
	        String[] roles = m.getRoles();
	
	        int count = 0;
	        //add actors and roles to movie cast
	        for(int i = 0; i < actors.length; i++) {
	        	sql = "INSERT INTO TVShow_Cast (tid, cid, role) VALUES ("+tid+","+actors[i]+",'"+roles[i]+"');";
	        	stmt.executeUpdate(sql);
	        }
	        
	        List<Episode> episodes = m.getEpisodes();
	        for(Episode e :episodes) {
	        	int snumber = e.getSnumber();
	        	int enumber = e.getEnumber();
	        	String airdate = e.getAirdate();
	        	String etitle = e.getEtitle();
	        	String tdlink = e.getTdlink();
	        	sql = "INSERT INTO TVShow_Episode(tid, season_number, episode_number, title, release_date, download_link, downloads, views) "
	        			+ "values ("+tid+", "+snumber+", "+enumber+", '"+etitle+"', '"+airdate+"', '"+tdlink+"', 0, 0);";
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

	

	public static List<TVShow> getTVShowsTableData() {
		ArrayList<TVShow> tvshows = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT tid, title, added_by, added_date, views FROM TVShow;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int tid = rs.getInt(1);
            	String title = rs.getString(2);
            	String aid = rs.getString(3);
            	String added_date = rs.getString(4);
            	int views = rs.getInt(5);
            	
            	stmt2 = con.createStatement();
            	
            	sql = "SELECT fname, lname FROM Admin Where adminid = "+aid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	String adminName = rs2.getString(1) + " " + rs2.getString(2); 
            	
            	sql = "SELECT IFNULL(AVG(rating), 0) FROM tvshow_rating WHERE tid = "+tid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	double rating = rs2.getDouble(1);
            	
            	sql = "SELECT count(distinct(season_number)) from tvshow_episode where tid = "+tid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	int noOfSeasons = rs2.getInt(1);
            	
            	sql = "SELECT count(episode_number) from tvshow_episode where tid = "+tid+";";
            	rs2 = stmt2.executeQuery(sql);
            	rs2.next();
            	int noOfEpisodes = rs2.getInt(1);
           	
            	TVShow m = new TVShow(tid, title, rating, views, added_date, adminName, noOfSeasons, noOfEpisodes);
            	tvshows.add(m);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return tvshows;
	}
	
	public static void deleteTVShow(int tid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "DELETE FROM TVShow WHERE tid = "+tid+";";
	        stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		
	}
	
	public static TVShow getTVShowDetails(int tid) {
		try {
			
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        
	        String sql = "SELECT * FROM TVShow WHERE tid = "+tid+";";
	        ResultSet rs = stmt.executeQuery(sql);
	        rs.next();
	        
	        String title = rs.getString(2);
	    	String rdate = rs.getString(3);
	    	String runtime = rs.getString(4);
	    	String description= rs.getString(5);
			String cover = rs.getString(6);
	    	String country = rs.getString(10);
	    	String trailer = rs.getString(11);
	    	
			ArrayList<Celebrity> directors = new ArrayList<>();
	        ArrayList<Celebrity> writers = new ArrayList<>();
	        ArrayList<Genre> genres = new ArrayList<>();
	        ArrayList<Cast> casts = new ArrayList<>();
	        
	        sql = "SELECT m.cid,m.role,c.fname,c.lname FROM tvshow_cast AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
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
	        
	        sql = "SELECT m.gid, g.name FROM tvshow_genre AS m LEFT JOIN genre AS g ON m.gid = g.gid WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int gid = rs.getInt(1);
	        	String gname = rs.getString(2);
	        	
	        	Genre g = new Genre(gid, gname);
	        	genres.add(g);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname FROM tvshow_director AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname);
	        	
	        	directors.add(celeb);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname FROM tvshow_writer AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname);
	        	
	        	writers.add(celeb);
	        }

			//get episodes
			sql = "SELECT season_number, episode_number, title, release_date, download_link FROM tvshow_episode WHERE tid = "+tid+";";
			rs = stmt.executeQuery(sql);
			List<Episode> episodes = new ArrayList<Episode>();
			while (rs.next()) {
				int snumber= rs.getInt(1);
				int enumber = rs.getInt(2);
				String etitle = rs.getString(3);
				String erdate= rs.getString(4);
				String tdlink = rs.getString(5);
				Episode e = new Episode(snumber, enumber,erdate, etitle, tdlink);
				episodes.add(e);
			}
			
			
			TVShow m = new TVShow(title, description, rdate, runtime, country, genres, directors, writers, casts, trailer, cover, episodes);
			return m;

		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
	
	public static TVShow getTVShowSingleDetails(int tid) {
		try {
			
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        
	        String sql = "SELECT * FROM TVShow WHERE tid = "+tid+";";
	        ResultSet rs = stmt.executeQuery(sql);
	        rs.next();
	        
	        String title = rs.getString(2);
	    	String rdate = rs.getString(3);
	    	String runtime = rs.getString(4);
	    	String description= rs.getString(5);
			String cover = rs.getString(6);
	    	String country = rs.getString(10);
	    	String trailer = rs.getString(11);
	    	
			ArrayList<Celebrity> directors = new ArrayList<>();
	        ArrayList<Celebrity> writers = new ArrayList<>();
	        ArrayList<Genre> genres = new ArrayList<>();
	        ArrayList<Cast> casts = new ArrayList<>();
	        
	        sql = "SELECT m.cid,m.role,c.fname,c.lname,c.image FROM tvshow_cast AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
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
	        
	        sql = "SELECT m.gid, g.name FROM tvshow_genre AS m LEFT JOIN genre AS g ON m.gid = g.gid WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int gid = rs.getInt(1);
	        	String gname = rs.getString(2);
	        	
	        	Genre g = new Genre(gid, gname);
	        	genres.add(g);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname,c.image FROM tvshow_director AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	String image = rs.getString(4);

	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname,image);
	        	
	        	directors.add(celeb);
	        }
	        
	        sql = "SELECT m.cid,c.fname,c.lname,c.image FROM tvshow_writer AS m LEFT JOIN celebrity AS c ON m.cid = c.cid "
	        		+ "WHERE m.tid = "+tid+";";
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	        	int cid = rs.getInt(1);
	        	String fname = rs.getString(2);
	        	String lname = rs.getString(3);
	        	String image = rs.getString(4);

	        	
	        	Celebrity celeb = new Celebrity(cid, fname, lname,image);
	        	
	        	writers.add(celeb);
	        }

			//get episodes
			sql = "SELECT season_number, episode_number, title, release_date, download_link FROM tvshow_episode WHERE tid = "+tid+";";
			rs = stmt.executeQuery(sql);
			List<Episode> episodes = new ArrayList<Episode>();
			while (rs.next()) {
				int snumber= rs.getInt(1);
				int enumber = rs.getInt(2);
				String etitle = rs.getString(3);
				String erdate= rs.getString(4);
				String tdlink = rs.getString(5);
				Episode e = new Episode(snumber, enumber,erdate, etitle, tdlink);
				episodes.add(e);
			}
			
			sql = "SELECT IFNULL(AVG(rating), 0) FROM tvshow_rating WHERE tid = "+tid+";";
        	rs = stmt.executeQuery(sql);
        	rs.next();
        	double rating = rs.getDouble(1);
			
			TVShow m = new TVShow(title, description, rdate, runtime, country, genres, directors, writers, casts, trailer, cover, episodes, rating);
			return m;

		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
	

	public static boolean modifyTVShow(TVShow t){
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        
	        int tid = t.getId();
	        String title = t.getTitle();
	    	String description= t.getDescription();
	    	String rdate = t.getRdate();
	    	String runtime = t.getRuntime();
	    	String country = t.getCountry();
	    	String trailer = t.getTrailer();
			String cover = t.getCover();
	    	
	    	//Movie table update statement
			String sql = "UPDATE TVShow SET title = '"+title+"', description = '"+description+"', release_date = '"+rdate+"', runtime = '"+runtime+"', country = '"+country+"', trailer = '"+trailer+"' WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);

	    	//Update cover
			if(cover != null){
				sql = "UPDATE TVShow SET poster = '"+cover+"' WHERE tid = "+tid+";";
				stmt.executeUpdate(sql);
			}

			//Remove existing casts
			sql = "DELETE FROM TVShow_cast WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);
			
			//Add new casts
			int[] actors = t.getActors();
		    String[] roles = t.getRoles();

            for(int i = 0; i < actors.length; i++) {
            	sql = "INSERT INTO TVShow_Cast (tid, cid, role) VALUES ("+tid+","+actors[i]+",'"+roles[i]+"');";
            	stmt.executeUpdate(sql);
            }
			
			//Remove existing genres
			sql = "DELETE FROM TVShow_genre WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);
			
			//Add new genres
			for(int g : t.getGenres()){
				sql = "INSERT INTO TVShow_genre (tid, gid) VALUES ("+tid+", "+g+");";
				stmt.executeUpdate(sql);
			}
			
			//Remove existing directors
			sql = "DELETE FROM TVShow_director WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);
			
			//Add new directors
			for(int c : t.getDirectors()){
				sql = "INSERT INTO TVShow_director (tid, cid) VALUES ("+tid+", "+c+");";
				stmt.executeUpdate(sql);
			}
			
			//Remove existing writers
			sql = "DELETE FROM TVShow_writer WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);
			
			//Add new writers
			for(int c : t.getWriters()){
				sql = "INSERT INTO TVShow_writer (tid, cid) VALUES ("+tid+", "+c+");";
				stmt.executeUpdate(sql);
			}

	    	//Add Gallery images
			List<String> gallery = t.getGallery();
			if(gallery.size() > 0){
				for(String img : t.getGallery()){
					sql = "INSERT INTO TVShow_image (tid, image) VALUES ("+tid+", '"+img+"');";
					stmt.executeUpdate(sql);
				}
			}
			
			//Remove existing episodes
			sql = "DELETE FROM TVShow_Episode WHERE tid = "+tid+";";
			stmt.executeUpdate(sql);
			
			List<Episode> episodes = t.getEpisodes();
			for(Episode e :episodes) {
	        	int snumber = e.getSnumber();
	        	int enumber = e.getEnumber();
	        	String airdate = e.getAirdate();
	        	String etitle = e.getEtitle();
	        	String tdlink = e.getTdlink();
	        	sql = "INSERT INTO TVShow_Episode(tid, season_number, episode_number, title, release_date, download_link, downloads, views) "
	        			+ "values ("+tid+", "+snumber+", "+enumber+", '"+etitle+"', '"+airdate+"', '"+tdlink+"', 0, 0);";
	        	stmt.executeUpdate(sql);
		    }
		        

			return true;
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return false;
	}
	
	public static int getTVShowCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(tid) FROM TVShow;";
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
	
	public static List<Item> getTopRatedTVShows() {
		List<Item> tvshows = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT tid, avg(rating) FROM TVShow_Rating GROUP BY tid ORDER BY avg(rating) DESC LIMIT 5;";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int tid = rs.getInt(1);
				double rating = rs.getDouble(2);
				
				sql = "SELECT title,views,poster FROM Tvshow WHERE tid = "+tid+";";
				stmt2 = con.createStatement();
				rs2 = stmt2.executeQuery(sql);
				rs2.next();
				
				String title = rs2.getString(1);
				int views = rs2.getInt(2);
				String poster = rs2.getString(3);
				
				Item m = new Item(tid, title, views, rating, poster);
				tvshows.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return tvshows;
	}
	
	public static List<TVShow> getTvShowGridData() {
		ArrayList<TVShow> tvshows = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT tid, title, poster FROM tvshow;";
			rs = stmt.executeQuery(sql);
	
			while (rs.next()) {
			int tid = rs.getInt(1);
			String title = rs.getString(2);
			String cover = rs.getString(3);
	
			stmt2 = con.createStatement();
	
			sql = "SELECT IFNULL(AVG(rating), 0) FROM tvshow_rating WHERE tid = "+tid+";";
			rs2 = stmt2.executeQuery(sql);
			rs2.next();
			double rating = rs2.getDouble(1);
	
			TVShow ts = new TVShow(tid, title, cover,rating);
			tvshows.add(ts);
		}

		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error: " + e.getMessage());
		}
		return tvshows;
	}

	
	public static int getTvShowCountGrid() {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT count(tid) FROM tvshow;";
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
