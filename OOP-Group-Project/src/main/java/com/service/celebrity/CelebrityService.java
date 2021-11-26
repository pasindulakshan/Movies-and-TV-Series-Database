package com.service.celebrity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Celebrity;
import com.util.DBConnectUtil;

public class CelebrityService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static List<Celebrity> getAllNames(String Profession) {
        ArrayList<Celebrity> names = new ArrayList<>();
        try {
            con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT cid,fname,lname FROM Celebrity WHERE profession = '"+Profession+"';";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int cid = rs.getInt(1);
            	String fname = rs.getString(2);
            	String lname = rs.getString(3);
            	
            	Celebrity celeb = new Celebrity(cid, fname, lname);
            	names.add(celeb);
            }
        }catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
        return names;   
    }

	public static List<Celebrity> getSpotLightCelebs() {
		ArrayList<Celebrity> celebs = new ArrayList<>();
		    try {
		     	con = DBConnectUtil.getConnection();
	            stmt = con.createStatement();
	            String sql = "SELECT * FROM celebrity LIMIT 5;";
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
