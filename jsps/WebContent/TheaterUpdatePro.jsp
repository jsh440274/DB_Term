<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="Theater.TheaterDataBean"%>
<%@ page import="Theater.TheaterDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="theater" class="Theater.TheaterDataBean">
	<jsp:setProperty name="theater" property="*" />
</jsp:useBean>

<%
	//String id = request.getParameter("id");
	//int id= Integer.parseInt((String)session.getAttribute("theater_num"));
	int id = ((Integer)(session.getAttribute("theater_num"))).intValue();
	TheaterDBBean theateradata = TheaterDBBean.getInstance();
	int check = theateradata.updateTheater(theater, id);
	theater.setTheater_num(id);
	
	if(check ==1) {
%>

<jsp:getProperty property="theater_num" name="theater" />의 상영관정보가
수정되었습니다.
<form method="post">
	<input type="button" value="theater 업데이트화면으로 이동하기"
		onclick="location.href='TheaterUpdateForm.jsp'">
</form>
<%
	} else if(check == -1){
%>
<script>
	alert("실패했습니다.");
	history.go(-1);
</script>
<%
	}
%>
