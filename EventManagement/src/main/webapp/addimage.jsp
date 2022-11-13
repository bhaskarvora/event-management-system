<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.entities.Event"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

			session = request.getSession();
			int id = (Integer) session.getAttribute("id");

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			String query = "from Event where UserId not in(:id)";
			Query q = s.createQuery(query);
			q.setParameter("id", id);
			List<Event> list = q.list();

			for (Event equp : list) {
		Blob blob = new SerialBlob(equp.getEventimage());
		InputStream is = blob.getBinaryStream();
		Files.copy(is,
		Paths.get("D:/download/EventManagement/src/main/webapp/resources/EventsImages/"+ equp.getId() + "_" + equp.getEventName() + ".jpg"),
		StandardCopyOption.REPLACE_EXISTING);
		out.println("Stored"); 
			}

			tx.commit();
			s.close();
			
			//response.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			out.println("Error");
		}
	%>

</body>
</html>