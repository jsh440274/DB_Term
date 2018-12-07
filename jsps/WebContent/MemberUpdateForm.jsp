<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*"%>
<%@ page import = "login.LogonDBBean" %>   
<%@ page import = "login.LogonDataBean" %> 
<html>
<head>
<%
String id = session.getAttribute("sessionID").toString();
LogonDBBean logon = LogonDBBean.getInstance();
LogonDataBean logondata = logon.getUserInfo(id);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<h2>회원정보수정</h2>

    <form method="post" action="MemberUpdatePro.jsp">
                  아이디: <input type="text" name="id" value=<%=logondata.getId()%> maxlength="12"><br/>
		패스워드 : <input type="password" name="passwd" value=<%=logondata.getPasswd() %> maxlength="12"><br/>
		이름 : <input type="text" name="name"value=<%=logondata.getName() %> maxlength="10"><br/>
		생일 : <input type="text" name="birthday" value=<%=logondata.getBirthday() %> maxlength="10"><br/>
		주소 : <input type="text" name="address" value=<%=logondata.getAddress() %> maxlength="10"><br/>
		번호 : <input type="text" name="tel" value=<%=logondata.getTel() %> maxlength="10"><br/>
        <input type="submit" value="정보변경">
        <input type="button" value="취소"  onclick="location.href='cookieMain.jsp'">
    </form>

</body>
</html>