<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Cinema.CinemaDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="cinema" class="Cinema.CinemaDataBean">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>

<%
	String cinema_name = request.getParameter("cinema_name");

	CinemaDBBean cinema_delete = CinemaDBBean.getInstance();
	int check = cinema_delete.deleteCinema(cinema_name);

	if (check == 1) {
%>
<jsp:getProperty property="cinema_name" name="cinema" />이 삭제되었습니다.
<form method="post">
	<input type="button" value="영화관등록화면으로 이동하기"
		onclick="location.href='CinemaInsertForm.jsp'">
</form>
<%
	} else if (check == 0) {
%>
<script>
	alert("이름이 맞지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>



