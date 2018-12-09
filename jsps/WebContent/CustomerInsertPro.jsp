<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>
<%@ page import = "login.LogonDBBean" %>    

<%--  <% request.setCharacterEncoding("euc-kr"); --%>   

<jsp:useBean id="customer" class="login.LogonDataBean">
	<jsp:setProperty name="customer" property="*"/>
</jsp:useBean>

<%
	//member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertMember(customer);
%>

<jsp:getProperty property="customer_id" name="customer"/>님 회원가입을 축하합니다.
	<form method="post">
		<input type="button" value="로그인화면으로 이동하기" onclick="location.href='loginForm.jsp'">
	</form>