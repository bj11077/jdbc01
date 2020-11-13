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
		
		String sql = "select * from members where id=\'"+request.getParameter("id") +"\'" ;

		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		
		
		if(rs.next()==false){
			
		}else{
				%>
			<script type="text/javascript">
			alert("이미 존재하는 아이디입니다.")
			location.href="register.jsp"
			</script>
				<% 
			}
		
	
		%>


<%
System.out.print(request.getParameter("id"));
System.out.print(request.getParameter("pwd").isEmpty());
System.out.print(request.getParameter("pwdc"));
if(request.getParameter("id").isEmpty()){
	
	%>
	<script type="text/javascript">
	alert("아이디는 필수 입력 사항입니다.")
	location.href="register.jsp"
	</script>
	<% 
}
if(request.getParameter("pwd").isEmpty()){
	%>
	<script type="text/javascript">
	alert("비밀번호는 필수 입력 사항입니다.")
	location.href="register.jsp"
	</script>
	<% 
	
}else{
	if(request.getParameter("pwdc").isEmpty()){
		%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		location.href="register.jsp"
		</script>
		<% 
	}
	
	if(request.getParameter("pwd").equals(request.getParameter("pwdc")) ){
		String sql2 = "insert into members values(?,?,?,?,?) ";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setString(1	, request.getParameter("id"));
		ps2.setString(2	, request.getParameter("pwd"));
		if(request.getParameter("name").isEmpty()){
			ps2.setString(3	, "???");
		}else{
			ps2.setString(3	, request.getParameter("name"));
		}
		
		if(request.getParameter("addr").isEmpty()){
			ps2.setString(4	, "???");
		}else{
			ps2.setString(4	, request.getParameter("addr"));
		}
		if(request.getParameter("tel").isEmpty()){
			ps2.setString(5	, "???");
		}else{
			ps2.setString(5	, request.getParameter("tel"));
		}
		
		ps2.executeUpdate();
		
		
		%>
		<script type="text/javascript">
		alert("회원가입을 축하합니다.")
		location.href="main.jsp"
		</script>
		<% 
	}else{
		%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		location.href="register.jsp"
		</script>
		<% 
	}
	
}



%>
</body>
</html>