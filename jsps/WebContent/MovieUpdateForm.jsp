<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*"%>
<%@ page import = "movie.MovieDBBean" %>   
<%@ page import = "movie.MovieDataBean" %> 
<html>
<head>
<%
String id = session.getAttribute("movie_id").toString();
MovieDBBean movie_update = MovieDBBean.getInstance();
MovieDataBean moviedata = movie_update.getUserInfo(id);
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>영화수정하기</h2>
	
	<form method="post" action="MovieUpdatePro.jsp">
	        영화 아이디: <input type="text" name="movie_id" value=<%=moviedata.getMovie_id()%>><br/>
		영화제목 : <input type="text" name="movie_title" value=<%=moviedata.getMovie_title()%>><br/>
		감독 : <input type="text" name="movie_director" value=<%=moviedata.getMovie_director()%>><br/>
		출연 : <input type="text" name="movie_actor" value=<%=moviedata.getMovie_actor()%>><br/>
		등급 : <input type="text" name="movie_rating" value=<%=moviedata.getMovie_rating()%>><br/>
		주요정보 : <input type="text" name="movie_info" value=<%=moviedata.getMovie_info()%>><br/>
		예매율(숫자) : <input type="text" name="movie_reservation_rate" value=<%=moviedata.getMovie_reservation_rate()%>><br/>
		러닝타임(숫자) : <input type="text" name="movie_runtime" value=<%=moviedata.getMovie_runtime()%>><br/>
		상영관번호(숫자) : <input type="text" name="theater_num" value=<%=moviedata.getTheater_num()%>><br/>
		상영일정 : <input type="text" name="theater_date" value=<%=moviedata.getTheater_date()%>><br/>
		<input type="submit" value="영화등록">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>