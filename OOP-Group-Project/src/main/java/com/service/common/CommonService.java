package com.service.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Item;
import com.util.DBConnectUtil;

public class CommonService {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static int getTotalViews() {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT SUM(views) FROM TVShow;";
			rs = stmt.executeQuery(sql);
			rs.next();
			int count = rs.getInt(1);
			
			sql = "SELECT SUM(views) FROM Movie;";
			rs = stmt.executeQuery(sql);
			rs.next();
			count += rs.getInt(1);
			
			return count;

			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return 0;
	}

	public static int getNewItemsMonthly() {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT IFNULL(count(tid),0) FROM TVShow WHERE added_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
			rs = stmt.executeQuery(sql);
			rs.next();
			int count = rs.getInt(1);
			
			sql = "SELECT IFNULL(count(mid),0) FROM Movie WHERE added_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
			rs = stmt.executeQuery(sql);
			rs.next();
			count += rs.getInt(1);
			
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return 0;
	}

	public static int getTotalDownloads() {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT SUM(downloads) FROM tvshow_episode;";
			rs = stmt.executeQuery(sql);
			rs.next();
			int count = rs.getInt(1);
			
			sql = "SELECT SUM(downloads) FROM Movie;";
			rs = stmt.executeQuery(sql);
			rs.next();
			count += rs.getInt(1);
			
			return count;
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return 0;
	}

	public static List<Item> getLatestItems(int limit) {
		ArrayList<Item> items = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT mid,title,views,added_date, 'Movie' AS Category  FROM Movie UNION SELECT tid,title,views,added_date,'TVShow' AS Category From TVShow ORDER BY added_date Desc LIMIT "+limit+";";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String title = rs.getString(2);
				int views = rs.getInt(3);
				String addDate = rs.getString(4);
				String category = rs.getString(5);
				
				Item i = new Item(id, title, views, addDate, category);
				items.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return items;
	}
	
	public static List<Item> getLatestItems2(int limit) {
		ArrayList<Item> items = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT mid,title,poster, 'Movie' AS Category,(SELECT IFNULL(AVG(rating), 0) FROM movie_rating WHERE mid = m.mid) AS rating,added_date FROM Movie m UNION SELECT tid,title,poster,'TVShow' AS Category,(SELECT IFNULL(AVG(rating), 0) FROM tvshow_rating WHERE tid = t.tid) AS rating,added_date From TVShow t ORDER BY added_date Desc LIMIT "+limit+";";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String title = rs.getString(2);
				String poster = rs.getString(3);
				String category = rs.getString(4);
				double rating = rs.getDouble(5);
				
				Item i = new Item(id, title, poster, rating, category);
				items.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return items;
	}
}
