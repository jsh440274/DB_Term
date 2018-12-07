<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Cinema.CinemaDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="cinema" class="Cinema.CinemaDataBean">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>

<%
String id = request.getParameter("cinema_name");
session.setAttribute("cinema_name", id);
CinemaDBBean cinema_enroll = CinemaDBBean.getInstance();
cinema_enroll.insertCinema(cinema);
%>

<jsp:getProperty property="cinema_name" name="cinema" /> 영화관이 등록되었습니다.
<form method="post">
	<input type="button" value="영화관등록화면으로 이동하기"
		onclick="location.href='CinemaInsertForm.jsp'">
</form>