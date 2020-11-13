<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
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
<script type="text/javascript">
function val(value){
	
	

	
	
}


</script>

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd="1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		
		String sql = "select * from student";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		String[] sq = new String[5];
	%>
	<table border="1">
	<tr>
	<td>학번</td>
	<td>이름</td>
	<td>국어</td>
	<td>영어</td>
	<td>수학</td>
	
	</tr>
	<%
	while(rs.next()){
		
		
		sq[0] = rs.getString("이름");
		sq[1] =rs.getString("학번");
		sq[2] = rs.getString("국어");
		sq[3] = rs.getString("영어");
		sq[4] = rs.getString("수학");
		
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getString("학번"));
		out.print("</td>");
		out.print("<td>");
		%>
		<a href="http://localhost:8085/jdbc01/quiz01result.jsp?name=<%=sq[0]%>
		&hak=<%=sq[1]%>&kor=<%=sq[2]%>&eng=<%=sq[3]%>&math=<%=sq[4]%>">
		<% 
		out.print(rs.getString("이름"));
		%>
		</a>
		<% 
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("국어"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("영어"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("수학"));
		out.print("</td>");
		out.print("</tr>");
	}
	%>
	</table>

	
</body>
</html>