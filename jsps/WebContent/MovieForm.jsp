<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="movie.MovieDBBean"%>
<%@ page import="movie.MovieDataBean"%>

<jsp:useBean id="movie" class="movie.MovieDataBean">
	<jsp:setProperty name="movie" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	MovieDBBean movie_update = MovieDBBean.getInstance();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie!!!!!!!</title>

</head>

<body>

	<h1>Movie Choice!</h1>

	<div id="lights">
		<form class="" action="CinemaForm.jsp" method="get">
			<div id="first">
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						conn = movie_update.getConnection();
						pstmt = conn.prepareStatement("SELECT * FROM MOVIE");
						String query = "select movie_title from movie";
						Statement statement = conn.createStatement();
						rs = statement.executeQuery(query);
						while (rs.next()) {
							String movie_name = rs.getString("movie_title");
							out.println("<h2>" + rs.getString("movie_title") + "<h2>");
				%>
				<input type="radio" name="movie">
			</div>
			<%
				}
				} catch (Exception e1) { // TODO Auto-generated catch block
					e1.printStackTrace();
				}
			%>
	</div>
	</br></br><input type="submit" value="영화관 선택 화면으로">
	</form>
	</div>
</body>
</body>
</html>