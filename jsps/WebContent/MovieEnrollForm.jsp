<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>영화등록하기</h2>
	
	<form method="post" action="MovieEnrollPro.jsp">
	        영화 아이디: <input type="text" name="movie_id"><br/>
		영화제목 : <input type="text" name="movie_title"><br/>
		감독 : <input type="text" name="movie_director"><br/>
		출연 : <input type="text" name="movie_actor" ><br/>
		등급 : <input type="text" name="movie_rating" ><br/>
		주요정보 : <input type="text" name="movie_info" ><br/>
		러닝타임(숫자) : <input type="text" name="movie_runtime"><br/>
		상영관번호(숫자) : <input type="text" name="theater_num"><br/>
		상영일정 : <input type="text" name="theater_date"><br/>
		<input type="submit" value="영화등록">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>