package com.mitrais.rms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSourceFactory {
	
	public static Connection getConnection() throws SQLException, Exception {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost/rmsdb?useSSL=false";
		String username = "root";
		String userpass = "mitrais2018";
		
		Class.forName(driver);
		Connection conn = null;
		conn = DriverManager.getConnection(url, username, userpass);
		return conn;
	}

}
