<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<h2>상영관삭제</h2>

    <form name="CinemaDeleteForm.jsp" method="post" action="CinemaDeletePro.jsp">
    	상영관이름 : <input type="text" name="cinema_name"><br/>
        <input type="button" value="취소" onclick="location.href='CinemaInsertForm.jsp'">
        <input type="submit" value="삭제" /> 
    </form>

</body>
</html>