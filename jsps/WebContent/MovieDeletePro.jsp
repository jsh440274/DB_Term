<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="movie.MovieDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="movie" class="movie.MovieDataBean">
	<jsp:setProperty name="movie" property="*" />
</jsp:useBean>

<%
	String movie_id = request.getParameter("movie_id");
	String movie_title = request.getParameter("movie_title");

	MovieDBBean movie_delete = MovieDBBean.getInstance();
	int check = movie_delete.deleteMovie(movie_id,movie_title);

	if (check == 1) {
%>
<jsp:getProperty property="id" name="movie" />를 삭제했습니다.
<form method="post">
	<input type="button" value="영화등록화면으로 이동하기"
		onclick="location.href='MovieEnrollForm.jsp'">
</form>
<%
	} else if (check == 0) {
%>
<script>
	alert("영화이름이 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("영화아이디가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>