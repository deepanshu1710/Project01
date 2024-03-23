<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String email=request.getParameter("email");
		
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/drcare","root","root");
		String s="insert into subscribe values(?)";
		PreparedStatement p=cn.prepareStatement(s);
		p.setString(1,email);
		
		
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("index.html");
		}
	%>
</body>
</html>