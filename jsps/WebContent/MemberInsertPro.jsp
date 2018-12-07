<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>
<%@ page import = "login.LogonDBBean" %>    

<%--  <% request.setCharacterEncoding("euc-kr"); --%>   

<jsp:useBean id="member" class="login.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
	//member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertMember(member);
%>

<jsp:getProperty property="id" name="member"/>님 회원가입을 축하합니다.
	<form method="post">
		<input type="button" value="로그인화면으로 이동하기" onclick="location.href='loginForm.jsp'">
	</form>