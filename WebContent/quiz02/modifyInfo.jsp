<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd="1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		
		String sql = "update members set name=?,addr=?,tel=? where name=\'"+session.getAttribute("user") +"\'" ;
	
		

		
	
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("addr"));
		ps.setString(3, request.getParameter("tel"));
		ps.executeUpdate();
		session.setAttribute("user", request.getParameter("name"));
		%>
		<script type="text/javascript">
		location.href="main.jsp"
		</script>
		
</body>
</html>