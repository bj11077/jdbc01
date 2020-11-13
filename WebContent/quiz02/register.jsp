<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function vv(){
	var abc = document.getElementById("p1")
	var pw1 = document.getElementById("pw1")
	var pw2 = document.getElementById("pw2")
	if(pw1 != pw2){
	abc.innerHTML = "불일치"
	}else{
		abc.innerHTML = "일치"
	}
}
</script>

</head>
<body>
<form action="chkRegister.jsp">
<input type="text" placeholder="아이디" name="id"><br>
<input type="text" placeholder="비밀번호" name="pwd" id="pw1"><br>
<input type="text" placeholder="비밀번호 확인" name="pwdc" id="pw2" onfocusout="vv()"><p id="p1">D</p><br>
<input type="text" placeholder="이름" name="name" ><br>
<input type="text" placeholder="주소" name="addr"><br>
<input type="text" placeholder="전화번호" name="tel"><br>
<input type="submit" value="회원가입">


</form>
</body>
</html>