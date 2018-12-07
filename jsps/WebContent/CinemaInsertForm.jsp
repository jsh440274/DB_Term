<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>Cinema등록폼</h2>
	
	<form method="post" action="CinemaInsertPro.jsp">
	   영화관 이름 : <input type="text" name="cinema_name"><br/>
		주소 : <input type="text" name="cinema_address"><br/>
		전화번호(Int) : <input type="text" name="cinema_tel"><br/>
		상영관 수(Int) : <input type="text" name="cinema_count"><br/>
		<input type="submit" value="영화관등록">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>
