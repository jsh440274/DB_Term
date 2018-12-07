<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*"%>
<%@ page import = "Cinema.CinemaDataBean" %>   
<%@ page import = "Cinema.CinemaDBBean" %> 
<html>
<head>
<%
String id = session.getAttribute("cinema_name").toString();
CinemaDBBean cinema_update = CinemaDBBean.getInstance();
CinemaDataBean cinemadata = cinema_update.getUserInfo(id);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cinema 업데이트</title>
</head>
<body>

<h2>Cinema 업데이트</h2>

    <form method="post" action="CinemaUpdatePro.jsp">
		영화관 이름 : <input type="text" name="cinema_name" value=<%=cinemadata.getCinema_name()%>><br/>
		주소 : <input type="text" name="cinema_address" value=<%=cinemadata.getCinema_address()%>><br/>
		전화번호(Int) : <input type="text" name="cinema_tel" value=<%=cinemadata.getCinema_tel()%>><br/>
		상영관 수(Int) : <input type="text" name="cinema_count" value=<%=cinemadata.getCinema_count()%>><br/>
        <input type="submit" value="정보변경">
        <input type="button" value="취소"  onclick="location.href='cookieMain.jsp'">
    </form>

</body>
</html>