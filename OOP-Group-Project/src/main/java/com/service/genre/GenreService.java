package com.service.genre;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Genre;
import com.util.DBConnectUtil;

public class GenreService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static List<Genre> getAllGenres() {
        ArrayList<Genre> genres = new ArrayList<>();
        try {
            con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM Genre;";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int gid = rs.getInt(1);
            	String name = rs.getString(2);
            	
            	Genre gen = new Genre(gid,name);
            	genres.add(gen);
            }
        }catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
        return genres;   
    }
}
