<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); 
		/* out.println(session.getAttribute("id"));
		out.println(session.getAttribute("name")); */
		response.sendRedirect("login.jsp");
	%>
</body>
</html>