<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="movie.MovieDBBean"%>
<%@ page import="movie.MovieDataBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="movie" class="movie.MovieDataBean">
	<jsp:setProperty name="movie" property="*" />
</jsp:useBean>

<%
	//String id = request.getParameter("id");
	String id = (String)session.getAttribute("movie_id"); 
	MovieDBBean movie_update = MovieDBBean.getInstance();
	int check = movie_update.updateMovie(movie, id);
	movie.setMovie_id(id);
	
	if(check ==1) {
%>

<jsp:getProperty property="movie_id" name="movie" />영화정보가 수정되었습니다.
<form method="post">
	<input type="button" value="영화등록화면으로 이동하기"
		onclick="location.href='MovieEnrollForm.jsp'">
</form>
<%
	} else if(check == -1){
%>
<script>
	alert("실패했습니다.");
	history.go(-1);
</script>
<%
	}
%>
