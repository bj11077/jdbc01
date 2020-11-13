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
		
		String sql = "select * from members where id=\'"+request.getParameter("id")+"\'" ;
//		String sql = "select * from members where id=\'"+request.getParameter("id")+"\'";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		//값없을때(false)
		if(rs.next() == false){
			System.out.print("아이디존재x");
		%>
		<script type="text/javascript">
		alert("아이디없음")
		location.href="login.jsp"
		</script>
		
		<%
			//이거로하면 login에서처리해서안됨
			//response.sendRedirect("login.jsp");
		}else{
				if(rs.getString("pwd").equals(request.getParameter("pwd"))){
					System.out.print("로그인성공");
					session.setAttribute("user", rs.getString("name"));
					response.sendRedirect("main.jsp");
	
				}else{
					System.out.print("비밀번호 일치x");
					%>
					<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.")
					location.href="login.jsp"
					</script>
					<%
				//	response.sendRedirect("login.jsp");
				}
		}
			
	
		
		%>
		
		
		

</body>
</html>