<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>Theater 등록폼</h2>
	
	<form method="post" action="TheaterInsertPro.jsp">
	   상영관 번호(INT) : <input type="text" name="theater_num"><br/>
		상영일정 : <input type="text" name="theater_date"><br/>
		좌석수(INT) : <input type="text" name="theater_seating_capacity"><br/>
		영화관 이름 : <input type="text" name="cinema_name"><br/>
		<input type="submit" value="상영관등록">
		<input type="reset" value="다시입력">
	</form>

</body>
</html>
