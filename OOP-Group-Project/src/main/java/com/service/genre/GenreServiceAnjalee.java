package com.service.genre;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Genre;
import com.util.DBConnectUtil;

public class GenreServiceAnjalee {
	private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null; 
    
    //Read data on Genre list
    public static List<Genre> getGenreTableData() {
		ArrayList<Genre> genres = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT gid, name FROM genre;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int gid = rs.getInt(1);
    			String name = rs.getString(2);
            	
            	Genre g = new Genre(gid, name);
            	genres.add(g);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        
		}
		return genres;
	}
    
    //Total number of genres
    public static int getGenreCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(gid) FROM genre;";
            rs = stmt.executeQuery(sql);
            rs.next();
	        int count = rs.getInt(1);
	        return count;
		}
		catch (SQLException e) {
			e.printStackTrace();
	    
		}
		return 0;
	}
    
  //Insert Genre
    public static boolean insertGenre(String name) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into genre values (default,'"+name+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
    //Delete Genre
    public static boolean deleteGenre(int gid) {
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from genre where gid="+gid+";";  
    		int r = stmt.executeUpdate(sql);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
}
