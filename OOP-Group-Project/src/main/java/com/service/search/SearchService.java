package com.service.search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Celebrity;
import com.model.Movie;
import com.model.TVShow;
import com.util.DBConnectUtil;

public class SearchService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static Statement stmt2 = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	public static ArrayList<TVShow> searchTVShows(String search) {
		ArrayList<TVShow> tvshows = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT tid, title, poster FROM tvshow WHERE title LIKE '%" + search + "%';";
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
	public static ArrayList<Movie> searchMovies(String search) {
		ArrayList<Movie> movies = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT mid, title, poster FROM Movie WHERE title LIKE '%" + search + "%';";
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
	public static ArrayList<Celebrity> searchCelebs(String search) {
		ArrayList<Celebrity> celebs = new ArrayList<>();
		    try {
		     	con = DBConnectUtil.getConnection();
	            stmt = con.createStatement();
	            String sql = "SELECT * FROM celebrity WHERE (fname LIKE '%" + search + "%' OR lname LIKE '%" + search + "%');";
            rs = stmt.executeQuery(sql);
          
            while (rs.next()) {
            	int cid = rs.getInt(1);
  		    	String fname = rs.getString(2);
  		    	String lname = rs.getString(3);
  			    String country = rs.getString(5);
  			    String profession = rs.getString(9);
  			    String coverName = rs.getString(10);
          	
          	    Celebrity c = new Celebrity(cid, fname,lname, country, profession, coverName);
          	    celebs.add(c);
            }
			
		    }catch (SQLException e) {
			   e.printStackTrace();
	        
		    }
		    return celebs;
	}

}
