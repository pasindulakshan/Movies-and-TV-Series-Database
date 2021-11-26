package com.service.celebrity;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.model.Celebrity;
import com.model.Item;
import com.util.DBConnectUtil;

public class CelebrityServiceAnjalee {
	
	private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null; 
    
    //Read data on celebrity list
    public static List<Celebrity> getCelebrityTableData() {
		ArrayList<Celebrity> celebs = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM celebrity;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int cid = rs.getInt(1);
    			String fname = rs.getString(2);
    			String lname = rs.getString(3);
    			String dob = rs.getString(4);
    			String country = rs.getString(5);
    			int height = rs.getInt(6);
    			String description = rs.getString(7);
    			String bio = rs.getString(8);
    			String profession = rs.getString(9);
    			String coverName = rs.getString(10);
            	
            	Celebrity c = new Celebrity(cid, fname,lname,dob, country, height, description, bio, profession, coverName);
            	celebs.add(c);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        
		}
		return celebs;
	}
    
    //Total number of celebrities
    public static int getCelebrityCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(cid) FROM celebrity;";
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
    
    //Insert Celebrity
    public static boolean insertCelebrity(Celebrity c) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into celebrity values (default,'"+c.getFname()+"','"+c.getLname()+"','"+c.getDob()+"','"+c.getCountry()+"','"+c.getHeight()+"','"+c.getDescription()+"','"+c.getBio()+"','"+c.getProfession()+"','"+c.getCoverName()+"')";
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
   
		//Update celebrity
    public static boolean updateCelebrity(int cid, String fname, String lname, String dob, String country, int height, String description, String bio, String profession, String coverName) {
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "update celebrity set fname='"+fname+"',lname='"+lname+"',dob='"+dob+"',country='"+country+"',height='"+height+"',description='"+description+"',bio='"+bio+"',profession='"+profession+"',image='"+coverName+"'" 
    				+ "where cid="+cid+";";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
        }
        
        //Retrieve data
        public static Celebrity getCelebDetails(int Cid) {  
        
        	try {
        		
        		con = DBConnectUtil.getConnection();
        		stmt = con.createStatement();
        		String sql = "select * from Celebrity where cid="+Cid+";";
        		rs = stmt.executeQuery(sql);
        		
        		while(rs.next()) { //outputs true if existing in the database
        			
        			int cid = rs.getInt(1);
        			String fname = rs.getString(2);
        			String lname = rs.getString(3);
        			String dob = rs.getString(4);
        			String country = rs.getString(5);
        			int height = rs.getInt(6);
        			String description = rs.getString(7);
        			String bio = rs.getString(8);
        			String profession = rs.getString(9);
        			String coverName = rs.getString(10);
        			
        			Celebrity c = new Celebrity(cid, fname, lname, dob, country, height, description, bio, profession, coverName);
        			return c;

        		}
        		
        	} catch(SQLException e) {
        		
        		e.printStackTrace();
        	}
        	
        	return null;
        }
        
      //Delete celebrity
      public static boolean deleteCelebrity(int cid) {
        	
        	try {
        		
        		con = DBConnectUtil.getConnection();
        		stmt = con.createStatement();
        		String sql = "delete from celebrity where cid="+cid+";";  
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

      
        //Read data on the celebrity grid
        public static List<Celebrity> getCelebrityGridData() {
  		  ArrayList<Celebrity> celebs = new ArrayList<>();
  		    try {
  		     	con = DBConnectUtil.getConnection();
  	            stmt = con.createStatement();
  	            String sql = "SELECT * FROM celebrity;";
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
        
        
public static Celebrity getCelebSingleDetails(int cid2) {  
        
        	try {
        		
        		con = DBConnectUtil.getConnection();
        		stmt = con.createStatement();
        		String sql = "select * from Celebrity where cid="+cid2+";";
        		rs = stmt.executeQuery(sql);
        		rs.next();
        		
        			String fname = rs.getString(2);
        			String lname = rs.getString(3);
        			String dob = rs.getString(4);
        			String country = rs.getString(5);
        			int height = rs.getInt(6);
        			String description = rs.getString(7);
        			String bio = rs.getString(8);
        			String profession = rs.getString(9);
        			String coverName = rs.getString(10);
        			
        			
        			Celebrity c = new Celebrity(fname, lname, dob, country, height, description, bio, profession, coverName);
        			return c;

        	} catch(SQLException e) {
        		
        		e.printStackTrace();
        	}
        	
        	return null;
        }
   
public static List<Item> getFilmography(int cid2) {
	
	ArrayList<Item> items = new ArrayList<>();
	try {
		
		con = DBConnectUtil.getConnection();
		stmt = con.createStatement();
		
		String sql = "select mid,title,poster,'Movie' as Category, release_date from movie where mid in" +
		      "(select mid from movie_cast where cid="+cid2+") union " + 
		      "select tid,title,poster,'TVShow' as Category, release_date from tvshow where tid in" +
		      "(select tid from tvshow_cast where cid="+cid2+") union " +
		      "select mid,title,poster,'Movie' as Category, release_date from movie where mid in" +
		      "(select mid from movie_director where cid="+cid2+") union " +
		      "select mid,title,poster,'Movie' as Category, release_date from movie where mid in" +
		      "(select mid from movie_writer where cid="+cid2+") union " +
			  "select tid,title,poster,'TVShow' as Category, release_date from tvshow where tid in" +
	          "(select tid from tvshow_director where cid="+cid2+") union " +
	          "select tid,title,poster,'TVShow' as Category, release_date from tvshow where tid in" +
		      "(select tid from tvshow_writer where cid="+cid2+")";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
        	int id = rs.getInt(1);
        	String title = rs.getString(2);
        	String poster = rs.getString(3);
        	String category = rs.getString(4);
        	String release_date = rs.getString(5);
        	
        	Item i = new Item(id, title, poster, category, release_date);
        	items.add(i);
        	
        }

	}catch(SQLException e) {
	   e.printStackTrace();	
	}
	return items;
 }
}
