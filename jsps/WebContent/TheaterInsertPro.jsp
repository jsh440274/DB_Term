<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Theater.TheaterDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="theater" class="Theater.TheaterDataBean">
	<jsp:setProperty name="theater" property="*" />
</jsp:useBean>

<jsp:useBean id="seating" class="Seating.SeatingDataBean">
	<jsp:setProperty name="seating" property="*" />
</jsp:useBean>

<%
//int id = Integer.parseInt(request.getParameter("theater_num"));
//String date = request.getParameter("theater_date").toString();
//session.setAttribute("theater_num", id);
//session.setAttribute("theater_date", date);
TheaterDBBean theater_enroll = TheaterDBBean.getInstance();
theater_enroll.insertTheater(theater);
int theater_num = Integer.parseInt(request.getParameter("theater_num"));
theater_enroll.insertSeating(seating, theater, theater_num);
%>

<jsp:getProperty property="theater_num" name="theater" /> 번 상영관이 등록되었습니다.
<form method="post">
	<input type="button" value="상영관등록으로 이동하기"
		onclick="location.href='TheaterInsertForm.jsp'">
</form>

<form method="post">
	<input type="button" value="영화등록으로 이동하기"
		onclick="location.href='MovieEnrollForm.jsp'">
</form>