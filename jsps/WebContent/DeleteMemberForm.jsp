<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<h2>회원탈퇴</h2>

    <form name="DeleteMemberForm.jsp" method="post" action="DeleteMemberPro.jsp">
    	아이디 : <input type="text" name="id" maxlength="!2"><br/>
                  패스워드 : <input type="password" name="passwd" maxlength="12"><br/>
        <input type="button" value="취소" onclick="location.href='cookieMain.jsp'">
        <input type="submit" value="탈퇴" /> 
    </form>

</body>
</html>