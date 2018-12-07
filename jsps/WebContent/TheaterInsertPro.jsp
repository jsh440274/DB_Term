<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Theater.TheaterDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="theater" class="Theater.TheaterDataBean">
	<jsp:setProperty name="theater" property="*" />
</jsp:useBean>

<%
int id = Integer.parseInt(request.getParameter("theater_num"));
session.setAttribute("theater_num", id);
TheaterDBBean theater_enroll = TheaterDBBean.getInstance();
theater_enroll.insertTheater(theater);
%>

<jsp:getProperty property="theater_num" name="theater" /> 번 상영관이 등록되었습니다.
<form method="post">
	<input type="button" value="상영관등록화면으로 이동하기"
		onclick="location.href='TheaterInsertForm.jsp'">
</form>