<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="movie.MovieDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="movie" class="movie.MovieDataBean">
	<jsp:setProperty name="movie" property="*" />
</jsp:useBean>

<%
	String id = request.getParameter("movie_id");
	session.setAttribute("movie_id", id);
	MovieDBBean movie_enroll = MovieDBBean.getInstance();
	movie_enroll.insertMovie(movie);
%>

<jsp:getProperty property="movie_id" name="movie" />의 영화가 등록되었습니다.
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