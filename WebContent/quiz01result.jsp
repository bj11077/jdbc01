<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>인적 사항</h1>
<h2>학번 : <%=request.getParameter("hak") %> </h2>
<h2>이름 : <%=request.getParameter("name") %> </h2>
<h2>국,영,수 : <%=request.getParameter("kor") %>,
	<%=request.getParameter("eng") %>,
	<%=request.getParameter("math") %>
 </h2>
 <a href="quiz01.jsp">뒤로가기</a>
</body>
</html>