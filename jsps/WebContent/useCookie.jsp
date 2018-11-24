<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹 브라우저에 저장된 쿠키를 가져오는 예제</title>
</head>
<body>
<h2>웹 브라우저에 저장된 쿠키를 가져오는 예제</h2>

<%
 Cookie[] cook = request.getCookies();

 if( cook != null ){
  for(int i=0; i<cook.length;++i){
   if(cook[i].getName().equals("id")){
%>

  쿠키의 이름은 "<%=cook[i].getName()%>" 이고 
  쿠키의 값 "<%=cook[i].getValue()%>" 입니다.

<%
   }
  }
 }
%>
</body>
</html>