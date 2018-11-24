<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*"%>
<%@ page import = "login.LogonDBBean" %>   
<%@ page import = "login.LogonDataBean" %> 
<html>
<head>
<%
LogonDBBean logon = LogonDBBean.getInstance();
LogonDataBean logondata = logon.getUserInfo(request.getParameter("id"));
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<h2>회원정보수정</h2>

    <form name="ModifyForm.jsp" method="post" action="ModifyPro.jsp">
		패스워드 : <input type="password" name="passwd" maxlength="12"><br/>
		이름 : <input type="text" name="name" maxlength="10"><br/>
		생일 : <input type="text" name="birthday" maxlength="10"><br/>
		주소 : <input type="text" name="address" maxlength="10"><br/>
		번호 : <input type="text" name="tel" maxlength="10"><br/>
        <input type="submit" value="정보변경">
        <input type="button" value="취소"  onclick="location.href='cookieMain.jsp'">
    </form>

</body>
</html>