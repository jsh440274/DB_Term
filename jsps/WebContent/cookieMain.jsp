<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = "";
	try {
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("id")) {
					id = cookies[i].getValue();
				}
			}
			if (id.equals("")) {
				response.sendRedirect("loginForm.jsp");
			}

			else if (id.equals("admin")) {
%>
<form method="post" action="CinemaInsertForm.jsp">
	<input type="submit" value="cinema ����ϱ�">
</form>

<form method="post" action="SelectVIP.jsp">
	<input type="submit" value="VIP Ȯ���ϱ�">
</form>
<%
	}
		} else {
			response.sendRedirect("loginForm.jsp");
		}
	} catch (Exception e) {
	}
%>


<html>
<head>
<title>��Ű�� ����� ������ ȸ������</title>
</head>
<body>
	<b><%=id%></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="cookieLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
	<form method="post" action="CustomerUpdateForm.jsp">
		<input type="submit" value="��������">
	</form>
	<form method="post" action="CustomerDeleteForm.jsp">
		<input type="submit" value="Ż���û">
	</form>
	<form method="post" action="CinemaForm.jsp">
		<input type="submit" value="��ȭ�����Ϸ�����">
	</form>
</body>
</html>
