package com.service.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Admin;
import com.util.DBConnectUtil;

public class AdminServiceMayumi {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	public static List<Admin> getAdminsTableData() {
		ArrayList<Admin> admins = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT AdminID, email, fname, lname FROM Admin;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int AdminID = rs.getInt(1);
            	String fname = rs.getString(3);
            	String lname = rs.getString(4);
            	String email = rs.getString(2);
            	
            	Admin a = new Admin(AdminID, fname,lname,email);
            	admins.add(a);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return admins;
	}
	
	public static int getAdminCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(AdminID) FROM Admin;";
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
	
	public static Admin getAdminDetails(int AdminID) {
		
	
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        
	 
	        String sql = "SELECT fname,lname,email FROM Admin WHERE AdminID = "+AdminID+";";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        	
	        	String Fname = rs.getString(1);
		        String Lname = rs.getString(2);
		        String Email = rs.getString(3);
	        	
	        	Admin a = new Admin(AdminID,Fname,Lname,Email);
	        	
	        	
	        
	        return a;
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
    
	public static boolean updateAdmin( int AdminID,String fname, String lname, String email) {
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "update admin set fname='"+fname+"',lname='"+lname+"',email='"+email+"'"+ "where AdminID="+AdminID+";";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
    	
    	return isSuccess;
    }
    
	public static boolean updateCurrentAdmin( int AdminID,String fname, String lname, String email) {
	    	
	    	try {
	    		
	    		con = DBConnectUtil.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "update admin set fname='"+fname+"',lname='"+lname+"',email='"+email+"'"+ "where AdminID="+AdminID+";";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (SQLException e) {
				e.printStackTrace();
		        System.out.println("Error: " + e.getMessage());
	    	}
	    	
	    	return isSuccess;
	    }
	
	
public static boolean CheckPassword(String Password, String OPassword,String Email ) {//oldpass
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "select admin set Password = ('"+Password+"') where Email='"+Email+"'";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
    	
    	return isSuccess;
    }
	
	public static boolean ChangePassword(String password, int id ) {
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "update admin set Password = ('"+password+"') where adminID ="+id+";";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
    	
    	return isSuccess;
    }

    
    
	public static void deleteAdmin(int AdminID) {
		
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "DELETE FROM admin WHERE AdminID = "+AdminID+";";
	        stmt.executeUpdate(sql);
	        
		}catch (SQLException e) {
			
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
	}

	public static boolean insertAdmin(String fname, String lname, String email, String password) {
		
		boolean isSuccess = false;
    	
    	try {
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into admin values (default,'"+fname+"','"+lname+"','"+email+"','"+password+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
 	
    	return isSuccess;
	}

	public static boolean emailExits(String email) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();

			String sql = "select * from admin where email='"+email+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
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
	
	public static boolean passwordCheck(String pass) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();

			String sql = "select * from admin where password='"+pass+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
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
	
	
}
