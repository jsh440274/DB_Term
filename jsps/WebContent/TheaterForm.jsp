<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Theater.TheaterDataBean"%>
<%@ page import="Theater.TheaterDBBean"%>

<jsp:useBean id="theater" class="Theater.TheaterDataBean">
	<jsp:setProperty name="theater" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	TheaterDBBean theater_show = TheaterDBBean.getInstance();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie!!!!!!!</title>

</head>

<body>

	<h1>Theater Choice!</h1>

	<div id="lights">
		<form class="" action="SeatingForm.jsp" method="get">
			<div id="first">
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						conn = theater_show.getConnection();
						pstmt = conn.prepareStatement("SELECT * FROM theater");
						String query = "select m.movie_title, t.theater_num, t.theater_date from theater t, movie m where m.theater_date=t.theater_date order by m.movie_reservation_rate desc";
						Statement statement = conn.createStatement();
						rs = statement.executeQuery(query);
						while (rs.next()) {
							out.println("<input type=\"radio\" name=\"theater\" value = \""+ rs.getString("theater_num") + ",");
							out.println(rs.getString("theater_date") +","+rs.getString("movie_title")+ "\"><br>");
							out.println("영화제목 : " + rs.getString("movie_title")+" </br> ");
							out.println("상영관 번호  : " + rs.getString("theater_num") + "  </br> ");
							out.println("상영 시작 시간  (YYMMDDhhmm) : " + rs.getString("theater_date") + "</br>");
				%>
			</div>
			<%
				}
				} catch (Exception e1) { // TODO Auto-generated catch block
					e1.printStackTrace();
				}
			%>
	</div>
	</br></br><input type="submit" value="좌석 선택 화면으로">
	</form>
	</div>
</body>
</body>
</html>