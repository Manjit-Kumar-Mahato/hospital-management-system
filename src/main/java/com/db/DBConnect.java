package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBConnect {
	
	private static final String url = "jdbc:mysql://localhost:3306/hospital_system";
    private static final String username = "root";
    private static final String password = "M@njit19";
    private static Connection conn;
    
    public static Connection getConn() {
		
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
			
			System.out.println("Data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return conn;
	}

}
