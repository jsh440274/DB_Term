<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*"%>
<%@ page import = "Theater.TheaterDataBean" %>   
<%@ page import = "Theater.TheaterDBBean" %> 
<html>
<head>
<%
int num =((Integer)(session.getAttribute("theater_num"))).intValue();
TheaterDBBean theater_update = TheaterDBBean.getInstance();
TheaterDataBean theaterdata = theater_update.getUserInfo(num);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Theater 업데이트</title>
</head>
<body>

<h2>Theater 업데이트</h2>

    <form method="post" action="TheaterUpdatePro.jsp">
		   상영관 번호 : <input type="text" name="theater_num" value=<%=theaterdata.getTheater_num()%>><br/>
		상영일정 : <input type="text" name="theater_date" value=<%=theaterdata.getTheater_date()%>><br/>
		좌석수 : <input type="text" name="theater_seating_capacity" value=<%=theaterdata.getTheater_seating_capacity()%>><br/>
		영화관 이름 : <input type="text" name="cinema_name" value=<%=theaterdata.getCinema_name()%>><br/>
        <input type="submit" value="정보변경">
        <input type="button" value="취소"  onclick="location.href='cookieMain.jsp'">
    </form>

</body>
</html>