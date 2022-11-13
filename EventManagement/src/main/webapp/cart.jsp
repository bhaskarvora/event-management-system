<!DOCTYPE html>
<%@page import="com.entities.AddEvent"%>
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
	margin: 30px 0;
	border-radius: 30px;
	transition: background 0.5s;
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
	<!------------------Cart items details------------>
	<div class="small-container cart-page">
		<table>
			<tr>
				<th style="background:navy;">Event</th>
				<!-- <th>Quantity</th> -->
				<th style="background:navy;">Price</th>
			</tr>
			<%
			try {

					/* getServletContext().getRequestDispatcher("/addimage.jsp").include(request,response); */

					session = request.getSession();
					int id = (Integer) session.getAttribute("id");
					int total = 0;
					Session s = FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();

					String query = "from AddEvent where UserId=:id";
					Query q = s.createQuery(query);
					q.setParameter("id", id);
					List<AddEvent> list = q.list();

					for (AddEvent cart : list) {
			%>
			<tr>
				<td>
					<div class="cart-info">
						<img
							src="resources/EventsImages/<%out.print(cart.getEventImage());%>">
						<div>
							<p>
								<%
								out.println(cart.getEventName());
								session.setAttribute("cartid",cart.getId());
								%>
							</p>
							<!-- <small>Price:1050₹</small> <br>-->
							<a href="DeleteFromCart">Remove</a>
						</div>
					</div>
				</td>
				<!-- <td><input type="number" value="1"></td> -->
				<td><i class="fa fa-rupee"></i> <%
				 out.println(cart.getEventPrice());
				 total = total + Integer.parseInt(cart.getEventPrice());
				 %></td>

			</tr>
			<%
			}
			%>
		</table>


		<div class="total-price">
			<table>
				<tr>
					<td>Grand Total</td>
					<td><i class="fa fa-rupee"></i> <% out.println(total); %></td>
				</tr>
				<tr>
					<td><a href="index.jsp" class="btn">Continue Shopping</a></td>
					<% session.setAttribute("order", "cart"); %>
					<td><a href="checkout.jsp" class="btn3">Book Now</a></td>
				</tr>
			</table>
		</div>
	</div>
	<% 
	tx.commit();
	s.close();

	} catch (Exception e) {
	e.printStackTrace();
	out.println("Error");
	}
	
	%>

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