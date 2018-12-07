<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입폼</h2>
	
	<form method="post" action="MemberInsertPro.jsp">
	        아이디: <input type="text" name="id"><br/>
		패스워드 : <input type="password" name="passwd" maxlength="12"><br/>
		이름 : <input type="text" name="name" maxlength="10"><br/>
		생일 : <input type="text" name="birthday" maxlength="10"><br/>
		주소 : <input type="text" name="address" maxlength="10"><br/>
		번호 : <input type="text" name="tel" maxlength="10"><br/>
		<input type="submit" value="회원가입">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>
