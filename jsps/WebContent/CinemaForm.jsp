<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Cinema.CinemaDataBean"%>
<%@ page import="Cinema.CinemaDBBean"%>

<jsp:useBean id="cinema" class="Cinema.CinemaDataBean">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
CinemaDBBean cinema_show = CinemaDBBean.getInstance();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cinema!!!!!!!</title>

</head>

<body>

	<h1>Cinema Choice!</h1>

	<div id="lights">
		<form class="" action="TheaterForm.jsp" method="get">
			<div id="first">
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						conn = cinema_show.getConnection();
						pstmt = conn.prepareStatement("SELECT * FROM cinema");
						String query = "select cinema_name from cinema";
						Statement statement = conn.createStatement();
						rs = statement.executeQuery(query);
						while (rs.next()) {
							String movie_name = rs.getString("cinema_name");
							out.println("<h2>" + rs.getString("cinema_name") + "<h2>");
				%>
				<input type="radio" name="cinema">
			</div>
			<%
				}
				} catch (Exception e1) { // TODO Auto-generated catch block
					e1.printStackTrace();
				}
			%>
	</div>
	<input type="submit" value="상영관 선택 화면으로">
	</form>
	</div>
</body>
</body>
</html>