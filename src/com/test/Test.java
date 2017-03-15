package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {
	
	private static final String URL = "jdbc:mysql://localhost:3306/mytest";
	private static final String USER = "root";
	private static final String PASSWORD = "root";
	private static Connection conn=null;
	
	static {
		try {
			// 1.加载驱动程序
			Class.forName("com.mysql.jdbc.Driver");
			// 2.获取数据裤连接
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getconConnection(){
		
		return conn;
	}
	public void close() throws SQLException{
		if(conn!=null){
			conn.close();
		}
	}

	public static void main(String[] args) {
		Connection c1=getconConnection();
		if(c1!=null){
			System.out.println("open success");
		}
		else {
			System.out.println("open fail");
		}
	}
}
