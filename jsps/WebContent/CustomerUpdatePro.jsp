<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="login.LogonDBBean"%>
<%@ page import="login.LogonDataBean"%>

<%--  <% request.setCharacterEncoding("euc-kr"); --%>

<jsp:useBean id="customer" class="login.LogonDataBean">
	<jsp:setProperty name="customer" property="*" />
</jsp:useBean>

<%
	String id = (String) session.getAttribute("sessionID");
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.updateCustomer(customer, id);
	//customer.setCustomer_id(id);

	if (check == 1) {
%>

<jsp:getProperty property="customer_id" name="customer" />님 회원정보가 수정되었습니다.
<form method="post">
	<input type="button" value="로그인화면으로 이동하기"
		onclick="location.href='loginForm.jsp'">
</form>
<%
	} else if (check == -1) {
%>
<script>
	alert("실패했습니다.");
	history.go(-1);
</script>
<%
	}
%>
