package com.service.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.DBConnectUtil;

public class UserService {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;

	public static List<User> getLatestUsers() {
		ArrayList<User> users = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT userid,fname,lname,email,joined_date FROM User ORDER BY joined_date Desc LIMIT 5;";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
            	int uid = rs.getInt(1);
            	String fname = rs.getString(2);
            	String lname = rs.getString(3);
            	String email = rs.getString(4);
            	String joinDate = rs.getString(5);
           	
            	User m = new User(uid, fname, lname, email, joinDate);
            	users.add(m);
            }
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return users;
	}

	public static List<User> getUsersTableData() {
		ArrayList<User> users = new ArrayList<>();
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT UserID, fname, lname, email, joined_date FROM User;";
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
            	int uid = rs.getInt(1);
            	String fname = rs.getString(2);
            	String lname = rs.getString(3);
            	String email = rs.getString(4);
            	String joinDate = rs.getString(5);
           	
            	User m = new User(uid, fname, lname, email, joinDate);
            	users.add(m);
            }
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return users;
	}
	
	public static int getUserCount() {
		try {
			con = DBConnectUtil.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT count(UserID) FROM User;";
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
	
	public static void deleteUser(int uid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "DELETE FROM User WHERE UserID = "+uid+";";
	        stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
	}
	
	public static User getUserDetails(int uid) {
		try {
			con = DBConnectUtil.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT fname,lname,email FROM User WHERE UserID = "+uid+";";
	        rs = stmt.executeQuery(sql);
	        rs.next();
	        	
	        	String Fname = rs.getString(1);
		        String Lname = rs.getString(2);
		        String Email = rs.getString(3);
	        	
	        	User u = new User(uid,Fname,Lname,Email);
	        return u;
			
		}catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
		}
		return null;
	}
	
	public static boolean userEmailExits(String email) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();

			String sql = "select * from user where email='"+email+"'";
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
	
	public static boolean updateUser( User u) {
    	
    	try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "UPDATE User SET fname='"+u.getFirstName()+"',lname='"+u.getLastName()+"',email='"+u.getEmail()+"' WHERE UserID="+u.getId()+";";
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
	
	public static int getNewUsersMonthly() {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT IFNULL(count(userid),0) FROM User WHERE joined_date >= DATE_SUB(NOW(), INTERVAL 1 MONTH);";
			rs = stmt.executeQuery(sql);
            rs.next();
	        int count = rs.getInt(1);
	        return count;
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return 0;
	}

	public static boolean validateLogin(String email, String pass) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where email='"+email+"' and password='"+pass+"'";
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

	public static User getUserDetails(String email) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where email='"+email+"';";
			rs = stmt.executeQuery(sql);
			rs.next();
			
			int uid = rs.getInt(1);
			String fname = rs.getString(2);
			String lname = rs.getString(3);
			
			User user = new User(uid, fname, lname, email);
			
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
	        System.out.println("Error: " + e.getMessage());
    	}
		return null;
	}

	public static boolean passwordCheck(String oldpassword) {
		try {
			con = DBConnectUtil.getConnection();
			stmt = con.createStatement();

			String sql = "select * from user where password='"+oldpassword+"'";
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

	public static boolean changePassword(String confirmpassword, int userID) {
		try {
    		
    		con = DBConnectUtil.getConnection();
    		stmt = con.createStatement();
    		String sql = "update user set Password = ('"+confirmpassword+"') where userID ="+userID+";";
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


public static boolean userSingup(String firstname, String lastname,String email,String password) {
	
	boolean isSuccess = false;
	
	try {
		con = DBConnectUtil.getConnection();
		stmt = con.createStatement();
	    String sql = "INSERT INTO User VALUES (default,'"+firstname+"','"+lastname+"','"+email+"','"+password+"', curdate());";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
		 System.out.println("Error: " + e.getMessage());
	}
	
	return isSuccess;
   }

}
