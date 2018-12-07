<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="login.LogonDBBean"%>
<%@ page import="login.LogonDataBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="member" class="login.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	//String id = request.getParameter("id");
	String id = (String)session.getAttribute("sessionID"); 
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.updateMember(member, id);
	member.setId(id);
	
	if(check ==1) {
%>

<jsp:getProperty property="id" name="member" />님 회원정보가 수정되었습니다.
<form method="post">
	<input type="button" value="로그인화면으로 이동하기"
		onclick="location.href='loginForm.jsp'">
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
