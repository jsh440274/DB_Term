<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "Theater.TheaterDataBean" %>   
<%@ page import = "Theater.TheaterDBBean" %> 
<%@ page import = "movie.MovieDataBean" %> 
<%@ page import = "movie.MovieDBBean" %> 
<%@ page import = "login.LogonDataBean" %> 
<%@ page import = "login.LogonDBBean" %> 
<%@ page import = "Seating.SeatingDataBean" %> 
<%@ page import = "Seating.SeatingDBBean" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
SeatingDBBean change_seat = SeatingDBBean.getInstance();
String id = session.getAttribute("movie_id").toString();
//System.out.println(id);
String customer_id=session.getAttribute("sessionID").toString();
//System.out.println(customer_id);
String theater_date = session.getAttribute("theater_date").toString();
//System.out.println(theater_date);
int theater_num = ((Integer)(session.getAttribute("theater_num"))).intValue();
//System.out.println(theater_num);
String[] tempsn = request.getParameterValues("seats");
//System.out.println(seating_num);

int[] seating_num = new int[tempsn.length];

for (int i=0; i<tempsn.length; i++){
	seating_num[i] = Integer.parseInt(tempsn[i]);
}
int i=1;
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>Ticket 폼</h2>
	티켓이 발권되었습니다.</br>
	<form method="post" action="TicketPro.jsp">
티켓번호 : <%out.println(i);%> 
티켓가격 : 8000
상영관번호 :<%out.println(theater_num);%>
고객 아이디 :<%out.println(customer_id);%>
상영일짜내용 :<%out.println(theater_date);%>
좌석번호 : <%out.println(seating_num[0]);%>
		<%i++; %>
	</form>
<%
change_seat.update_seat(seating_num[0]);
	%>
</body>
</html>
