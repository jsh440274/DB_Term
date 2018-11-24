<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키 생성</title>
</head>

<%
   String cookieName = "id";
   Cookie cookie = new Cookie(cookieName, "Paik"); // 초기값 id = Paik
   cookie.setMaxAge(365*24*60*60); // 쿠키 유지 (단위 초) 365일
   cookie.setValue("Chung"); // id = guardian 으로 바뀐다.
   response.addCookie(cookie);
%>
 
<body>
	<h2>쿠키를 생성하는 페이지</h2>
	"<%=cookieName %>" 쿠키가 생성되었습니다.<br/>
	<form method="post" action="useCookie.jsp">
		<input type = "submit" value="생성된 쿠키확인">
	</form>

</body>
</html>

