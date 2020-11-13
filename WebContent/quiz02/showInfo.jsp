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
function vv(){

	//alert("dddd")
	//location.href="chkDel.jsp";
	location.href="chkDel.jsp"
	
}

</script>


	<%
		
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp", pwd="1234";
	Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select * from members where name=\'"+session.getAttribute("user") +"\'" ;
//		String sql = "select * from members where id=\'"+request.getParameter("id")+"\'";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if(rs.next()){}
			
		%>
<h1>회원 정보 수정 및 삭제</h1>
<form action="modifyInfo.jsp">
아이디:<input type="text" name="id" value="<%=rs.getString("id")  %>" readonly><br>
비밀번호:<input type="text" name="pwd" value="<%=rs.getString("pwd")  %>" readonly><br>
이름:<input type="text" name="name" value="<%=rs.getString("name") %>"><br>
주소:<input type="text" name="addr" value="<%=rs.getString("addr") %>"><br>
전화전호:<input type="text" name="tel" value="<%=rs.getString("tel") %>"><br>
<input type="submit" value="수정"> <input type="button" onclick="vv()" value="삭제">
</form>


</body>
</html>