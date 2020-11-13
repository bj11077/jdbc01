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
String sql3= "delete from members where name=?";
System.out.print((String)session.getAttribute("user"));
PreparedStatement ps3 = con.prepareStatement(sql3);
ps3.setString(1,(String)session.getAttribute("user") );
ps3.executeUpdate();	
%>
<script type="text/javascript">

location.href="logout.jsp"
</script>	


</body>
</html>