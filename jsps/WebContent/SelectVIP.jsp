<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import = "java.sql.*" %>
 <%@ page import = "login.LogonDBBean" %>  
 <%@ page import = "login.LogonDataBean" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>VIP 고객명단</h2>
<%
LogonDBBean logon_vip = LogonDBBean.getInstance();
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int count=1;
try{
	conn=logon_vip.getConnection();
	pstmt=conn.prepareStatement("select * from customer where customer_count>0 order by customer_count desc");
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String customer_id = rs.getString("customer_id");
		int customer_count = rs.getInt("customer_count");
		out.println((count++)+"등 :"+customer_id+"님의 영화예매횟수는 "+customer_count+"번 입니다.");
		out.println("</br>");
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>