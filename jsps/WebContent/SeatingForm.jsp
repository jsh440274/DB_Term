<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Seating.SeatingDataBean"%>
<%@ page import="Theater.TheaterDBBean"%>

<jsp:useBean id="seating" class="Seating.SeatingDataBean">
	<jsp:setProperty name="seating" property="*" />
</jsp:useBean>

<jsp:useBean id="theater" class="Theater.TheaterDataBean">
	<jsp:setProperty name="theater" property="*" />
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String radioValue=request.getParameter("theater");
String tempnum = radioValue.split(",")[0];
int theater_num = Integer.parseInt(tempnum);
TheaterDBBean seating_show = TheaterDBBean.getInstance();
String theater_date = radioValue.split(",")[1];
session.setAttribute("theater_date", theater_date);
session.setAttribute("theater_num", theater_num);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie!!!!!!!</title>

</head>

<body>

	<h1>Seat Choice!</h1>

	<div id="lights">
		<form class="" action="TicketForm.jsp" method="get">
			<div id="first">
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						conn = seating_show.getConnection();
						pstmt = conn.prepareStatement("SELECT * FROM seating");
						String query = "select seating_num, seating_reserved from seating";
						Statement statement = conn.createStatement();
						rs = statement.executeQuery(query);
						while (rs.next()) {
							int seating_reserved = rs.getInt("seating_reserved");
							int seating_num = rs.getInt("seating_num");
							out.println(rs.getInt("seating_num"));
							if (seating_reserved == 1) {
								out.println("<input type=\"checkbox\" disabled name = \"seats\"value=\""
										+ rs.getInt("seating_num") + "\" >   ");
							} else {
								out.println("<input type=\"checkbox\" name = \"seats\"value=\"" + rs.getInt("seating_num")
										+ "\" >  ");
							}
				%>
			</div>
			<%
				}
				} catch (Exception e1) { // TODO Auto-generated catch block
					e1.printStackTrace();
				}
			%>
		
	</div>
	</br></br>
	<input type="submit" value="티켓출력 화면으로">
	</form>
	</div>
</body>
</body>
</html>