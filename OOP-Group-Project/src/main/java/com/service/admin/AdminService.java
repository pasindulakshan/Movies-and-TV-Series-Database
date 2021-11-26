package com.service.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Admin;
import com.util.DBConnectUtil;

public class AdminService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;
	
	
	public static boolean validateLogin(String email, String pass) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "select * from Admin where email='"+email+"' and password='"+pass+"'";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		
		return isSuccess;
	}

	public static Admin getAdminDetails(String email) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "select * from Admin where email='"+email+"';";
			rs = stmt.executeQuery(sql);
			rs.next();
			
			int adminId = rs.getInt(1);
			String fname = rs.getString(2);
			String lname = rs.getString(3);
			
			Admin admin = new Admin(adminId, fname, lname, email);
			
			return admin;
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return null;
	}

}
