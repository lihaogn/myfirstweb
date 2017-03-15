<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%!
	public static final String USER = "root";
	public static final String PASSWORD = "Lihaogn@163.com";
	public static final String URL = "jdbc:mysql://localhost:3306/myfirstweb";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public boolean flag = false;//表示登陆没成功%>
<%
	String username = "";
	String pwd = "";
	request.setCharacterEncoding("utf-8");

	username = request.getParameter("username");
	pwd = request.getParameter("pwd");

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(URL, USER, PASSWORD);
	//conn1=DriverManager.getConnection(URL);
	String sql = "select username,password from userData where username=? and password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, username);
	pstmt.setString(2, pwd);
	rs = pstmt.executeQuery();
	while (rs.next()) {
		flag = true;
		out.println("username" + rs.getString("username") + "pwd"
				+ rs.getString("password"));
	}

	conn.close();
	if (flag == true) {
		response.sendRedirect("homepage.html");
	} else {
		response.sendRedirect("index.html");
	}

	/* if ("lihao".equals(username) && "123456".equals(pwd)) {
		response.sendRedirect("homepage.html");
	} else {
		response.sendRedirect("index.html");
	}
	 */
%>