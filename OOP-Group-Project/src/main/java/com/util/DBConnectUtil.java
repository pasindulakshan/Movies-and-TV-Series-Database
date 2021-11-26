package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectUtil extends CommonUtil{
	
	private static String url = properties.getProperty(CommonConstants.URL);
	private static String userName = properties.getProperty(CommonConstants.USERNAME);
	private static String password = properties.getProperty(CommonConstants.PASSWORD);
	private static String driverName = properties.getProperty(CommonConstants.DRIVER_NAME);
	private static Connection con;

	public static Connection getConnection() {
	
		try {
			if (con == null || con.isClosed()) {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, userName, password);
			}
		
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
			System.out.println("Database connection is not success!!!");
		}
		
			return con;
	}
}


