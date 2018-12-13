<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="movie.MovieDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="movie" class="movie.MovieDataBean">
	<jsp:setProperty name="movie" property="*" />
</jsp:useBean>

<%
	String id = request.getParameter("movie_id").toString();
	session.setAttribute("movie_id", id);
	String movie_title = request.getParameter("movie_title");
	MovieDBBean movie_enroll = MovieDBBean.getInstance();
	movie_enroll.insertMovie(movie);
%>
영화제목은 <%out.println(movie_title); %>입니다.
상영관 번호는<jsp:getProperty property="theater_num" name="movie" />번 입니다.
<form method="post">
	<input type="button" value="영화등록으로 이동하기"
		onclick="location.href='MovieEnrollForm.jsp'">
</form>

<form method="post">
	<input type="button" value="영화수정으로 이동하기"
		onclick="location.href='MovieUpdateForm.jsp'">
</form>

<form method="post">
	<input type="button" value="영화삭제로 이동하기"
		onclick="location.href='MovieDeleteForm.jsp'">
</form>

<form method="post" action="cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>