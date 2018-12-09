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

    <form method="post" action="CustomerUpdatePro.jsp">
                  아이디: <input type="text" name="customer_id" value=<%=logondata.getCustomer_id()%> ><br/>
		패스워드 : <input type="password" name="customer_pw" value=<%=logondata.getCustomer_pw() %>><br/>
		이름 : <input type="text" name="customer_name"value=<%=logondata.getCustomer_name() %> ><br/>
		생일(INT) : <input type="text" name="customer_birth" value=<%=logondata.getCustomer_birth() %>><br/>
		번호(INT) : <input type="text" name="customer_tel" value=<%=logondata.getCustomer_tel() %>><br/>
        <input type="submit" value="정보변경">
        <input type="button" value="취소"  onclick="location.href='cookieMain.jsp'">
    </form>
</body>
</html>