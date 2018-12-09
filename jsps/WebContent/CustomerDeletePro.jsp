<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="login.LogonDBBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="customer" class="login.LogonDataBean">
	<jsp:setProperty name="customer" property="*" />
</jsp:useBean>

<%
	String id = request.getParameter("customer_id");
	String passwd = request.getParameter("customer_pw");

	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.deleteMember(id, passwd);
	session.removeAttribute(id);
	if (check == 1) {
%>
<jsp:getProperty property="customer_id" name="customer" />님이 탈퇴를 하였습니다.
<form method="post">
	<input type="button" value="로그인화면으로 이동하기"
		onclick="location.href='loginForm.jsp'">
</form>
<%
	} else if (check == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 존재하지 않습니다.");
	history.go(-1);
</script>
<%
	}
%>



