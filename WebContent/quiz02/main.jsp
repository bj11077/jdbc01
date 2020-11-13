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


<script type="text/javascript">
var abc = '<%=(String)session.getAttribute("user")%>';
function info(){
	
	location.href="showInfo.jsp"
	
}

function va(){
	
	location.href="logout.jsp"
}


function ab(){
	alert(abc+"님")
}


</script>


</head>
<body onload="ab()">

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "jsp", pwd="1234";
Connection con = DriverManager.getConnection(url,id,pwd);
String sql = "select * from members";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 

%>

<table border="1">
<tr>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>주소</td>
	<td>전화번호</td>
</tr>
<% 
while(rs.next()){

	out.print("<tr>");
	out.print("<td>");
	out.print(rs.getString("id"));
	out.print("</td>");
	out.print("<td>");
	out.print(rs.getString("pwd"));
	out.print("</td>");
	out.print("<td>");
	out.print(rs.getString("name"));
	out.print("</td>");
	out.print("<td>");
	out.print(rs.getString("addr"));
	out.print("</td>");
	out.print("<td>");
	out.print(rs.getString("tel"));
	out.print("</td>");
	out.print("</tr>");
}


%>
</table>
<button onclick="va()">로그아웃</button>
<button onclick="info()">계정정보</button>

</body>
</html>