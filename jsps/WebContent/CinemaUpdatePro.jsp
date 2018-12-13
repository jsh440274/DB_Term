<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import = "Cinema.CinemaDataBean" %>   
<%@ page import = "Cinema.CinemaDBBean" %> 

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="cinema" class="Cinema.CinemaDataBean">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>

<%
	String id= (String)session.getAttribute("cinema_name"); 
	CinemaDBBean cinemadata = CinemaDBBean.getInstance();
	int check = cinemadata.updateCinema(cinema, id);
	cinema.setCinema_name(id);
	
	if(check ==1) {
%>

<jsp:getProperty property="cinema_name" name="cinema" />의 상영관정보가 수정되었습니다.
<form method="post">
	<input type="button" value="cinema 업데이트화면으로 이동하기"
		onclick="location.href='CinemaUpdateForm.jsp'">
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
