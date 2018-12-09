<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="login.LogonDBBean"%>
<% request.setCharacterEncoding("euc-kr");%>
<%
 String customer_id = request.getParameter("customer_id");
 String customer_pw  = request.getParameter("customer_pw");
 
 LogonDBBean logon = LogonDBBean.getInstance();
    int check= logon.userCheck(customer_id,customer_pw);

 if(check==1){
  session.setAttribute("sessionID", customer_id);
  Cookie cookie = new Cookie("id", customer_id);
  cookie.setMaxAge(20*60);
  response.addCookie(cookie);
  response.sendRedirect("cookieMain.jsp");
 }
 
 else if(check==0){%>
 <script>
   alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
 </script>
<% }else{ %>
 <script>
   alert("아이디가 맞지 않습니다..");
   history.go(-1);
 </script>
<%
} 
%>
