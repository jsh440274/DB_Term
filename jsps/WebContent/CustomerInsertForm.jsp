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
	
	<form method="post" action="CustomerInsertPro.jsp">
	        아이디: <input type="text" name="customer_id"><br/>
		패스워드 : <input type="password" name="customer_pw"><br/>
		이름 : <input type="text" name="customer_name"><br/>
		생일(INT) : <input type="text" name="customer_birth"><br/>
		번호(INT) : <input type="text" name="customer_tel"><br/>
		<input type="submit" value="회원가입">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>
