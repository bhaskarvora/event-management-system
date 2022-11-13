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
<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event Management</title>
<link rel="stylesheet" type="text/css" href="resources/css/Style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="resources/css/slider.css">
</head>
<body>
	<%
	if (request.getAttribute("success") != null) {
	%>
	<script type="text/javascript">
		alert(
	<%out.print(request.getAttribute("success"));%>
		);
	</script>
	<%
	}
	%>
	<div class="header">
		<div class="container">
			<%@ include file="navbar.jsp"%>
		</div>
		
		
		
		
		
		
<div>		
	
	<div class="slideshow-container">
	
	<div class="mySlides fade">
	  <img src="https://static.meraevents.com/content/images/banners/new-year-events-061575452078.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
	  <img src="https://freshroots.ca/fresh/uploads/2015/12/fundraiser-header.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
	  <img src="https://www.nofrills-excursions.com/blog/wp-content/uploads/2020/08/best-club-in-mallorca-1280x500.jpg" style="width:100%">
	</div>
	
	</div>
	<br>
	
	<div style="text-align:center">
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	</div>
	
	<script>
	let slideIndex = 0;
	showSlides();
	
	function showSlides() {
	  let i;
	  let slides = document.getElementsByClassName("mySlides");
	  let dots = document.getElementsByClassName("dot");
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 3000); // Change image every 2 seconds
	}
	</script>
</div>





		
		
		
		
	</div>
	</div>
	<div class="small-container">
		<div class="row row-2">
			<h2>All Events</h2>

		</div>

		<div class="row">
			<%
			try {

					/* getServletContext().getRequestDispatcher("/addimage.jsp").include(request,response); */

					session = request.getSession();
					int id = (Integer) session.getAttribute("id");

					/* out.println("id="+id); */

					Session s = FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();

					String query = "from Event";
					Query q = s.createQuery(query);
					List<Event> list = q.list();

					for (Event equp : list) {
						Blob blob = new SerialBlob(equp.getEventimage());
						InputStream is = blob.getBinaryStream();
						Files.copy(is,
						Paths.get(
								"D:/download/EventManagement/src/main/webapp/resources/EventsImages/"
										+ equp.getId() + "_" + equp.getEventName() + ".jpg"),
						StandardCopyOption.REPLACE_EXISTING);
						/* out.println("Stored"); */
					}

					for (Event equp : list) {
						int eqid = equp.getId();
			%>
			<div class="col-4">
				<a href="eventdetails.jsp?id=<%=eqid%>"><img
					src="resources/EventsImages/<%out.print(equp.getId() + "_" + equp.getEventName() + ".jpg");%>"></a>

				<h4>
					<%
					out.println(equp.getEventName());
					%>
				</h4>
				<p>
					Rs
					<%
				out.println(equp.getEventPrice());
				%>
				</p>
			</div>
			<%
			}
			tx.commit();
			s.close();

			} catch (Exception e) {
			e.printStackTrace();
			out.println("Error");
			}
			%>
		</div>




	</div>

	<!---------------------footer--------------------------->
	<%@ include file="footer.jsp"%>
	<!------------js for toggle menu----------->
	<script>
		var MenuItems = document.getElementById('MenuItems');
		MenuItems.style.maxHeight = "0px";

		function menutoggle() {
			if (MenuItems.style.maxHeight == "0px") {
				MenuItems.style.maxHeight = "200px";
			} else {
				MenuItems.style.maxHeight = "0px";
			}
		}
	</script>

</body>
</html>