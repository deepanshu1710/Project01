<%@page import="java.sql.*"%>
<%@page import="beans.Student"%>
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
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String course=request.getParameter("course");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		Student s=new Student();
		s.setId(Integer.parseInt(id));
		s.setName(name);
		s.setCourse(course);
		s.setEmail(email);
		s.setAddress(address);
		
		session.setAttribute("stu",s);
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3307/cgc","root","root");
		String st="insert into student values(?,?,?,?,?)";
		PreparedStatement p=cn.prepareStatement(st);
		
		p.setString(1,id);
		p.setString(2,name);
		p.setString(3,course);
		p.setString(4,email);
		p.setString(5,address);
		
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("b.jsp");
		}
		
		
	%>
	
</body>
</html>