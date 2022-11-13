<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Orders"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
	session = request.getSession();
	int id = (Integer) session.getAttribute("id");

	/* out.println("id="+id); */

	Session s = FactoryProvider.getFactory().openSession();
	Transaction tx = s.beginTransaction();

	String query = "from Orders";
	Query q = s.createQuery(query);
	List<Orders> list = q.list();

	for (Orders order : list) {
		
		out.println("<br>"+order.getName());
		out.println("<br>"+order.getEmail());
		out.println("<br>"+order.getPhone());
		out.println("<br>"+order.getAmountPaid());
		out.println("<br>"+order.getPaymentMethod());
		out.println("<br>"+order.getFromDate());
		out.println("<br>"+order.getToDate());
		out.println("<br>");

		

	}
	%>
</body>
</html>