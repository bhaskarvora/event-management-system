<!DOCTYPE html>
<%@page import="com.entities.Event"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event Management</title>
<style>
.btn3 {
	display: inline-block;
	background-color: #17a2b8;
	color: #fff;
	padding: 8px 30px;
	border: none;
	margin: 30px 20px;
	border-radius: 30px;
	transition: background 0.5s;
}

.btn3 a {
	color: white;
}

.btn3:hover {
	background-color: #563434;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/css/Style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
	</div>


	<!--------------------------Single Product Details------------------->

	<div class="small-container single-product">

		<%
		if (request.getAttribute("message") != null) {
		%>
		<div class="error" style="margin: 20px; background-color: #ffb3b3; text-align: center; border: 1px solid #ffb3b3; border-radius: 10px; color: #cc0000; padding: 5px">
			<%
			out.print(request.getAttribute("message"));
			%>
		</div>
		<%
		}
				else if(request.getAttribute("success") != null)
				{
		%>
		<div class="error" style="margin: 20px; background-color:#c2f0c2; text-align: center; border: 1px solid #c2f0c2; border-radius: 10px; color:green; padding: 5px">
			<%
			out.print(request.getAttribute("success"));
			%>
		</div>
		<%
		}
		%>
		<div class="row">
			<%
			try {

					session = request.getSession();
					int id = (Integer) session.getAttribute("id");
					//				out.println(email+password);

					Session s = FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();
					String eqid = request.getParameter("id");
					int eventid = Integer.parseInt(eqid);
					/* out.println("str id="+eqid);
					out.println("iny id="+equipmentid); */
					String query = "from Event where Id=(:id)";
					Query q = s.createQuery(query);
					q.setParameter("id", eventid);
					List<Event> list = q.list();
					for (Event event : list) {
			%>
			<div class="col-2">
				<img
					src="resources/EventsImages/<%out.print(event.getId() + "_" + event.getEventName() + ".jpg");%>"
					width="100%" id="ProductImg">
			</div>

			<div class="col-2">
				<p>
					<a href="index.jsp"></a> 
				</p>
				<h1 style="text-transform: capitalize;">
					<%
					out.println(event.getEventName());
					%>
				</h1>
				<h3>
					<!-- <i class="fa fa-indent"></i> -->
					Event Details
				</h3>
				<p>
					<%
					out.println(event.getEventDescription());
					%>
				</p>
				<br>
				<h3>Event Price</h3>
				<p>
					Rs
					<%
				out.println(event.getEventPrice());
				%>
				</p>

				<%
				String img = event.getId() + "_" + event.getEventName() + ".jpg";
				session.setAttribute("eventid",eventid);
				session.setAttribute("eventimg", img);
				session.setAttribute("eventname", event.getEventName());
				session.setAttribute("eventprice", event.getEventPrice());
				%>

				<a href="CartServlet" class="btn">Add to Cart</a> <a
					href="checkout.jsp?eid=<%out.println(eventid);%>" class="btn3">Book Now</a>
			</div>
			<%
			}
			session.removeAttribute("order");
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
		
		setTimeout((function()
		{
			if($('.error').is(':visible'))
				$('.error').fadeOut(300);
		},100);
	</script>
	<!-------------js for Product Gallery------------------->
	<script>
		/* 		var ProductImg = document.getElementById("ProductImg");
		 var SmallImg = document.getElementsByClassName("small-img");

		 SmallImg[0].onclick = function() {
		 ProductImg.src = SmallImg[0].src;
		 }
		 SmallImg[1].onclick = function() {
		 ProductImg.src = SmallImg[1].src;
		 }
		 SmallImg[2].onclick = function() {
		 ProductImg.src = SmallImg[2].src;
		 }
		 SmallImg[3].onclick = function() {
		 ProductImg.src = SmallImg[3].src;
		 } */
	</script>
</body>
</html>