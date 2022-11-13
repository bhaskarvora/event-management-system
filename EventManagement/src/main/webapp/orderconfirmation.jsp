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
h4{
	font-size:20px;
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
	<br>
	<div class="small-container">
		<div class="row">
			<div class="col-1" style="text-align:center">
				<h1 style="color:navy;margin-bottom:10px">Thank You for booking!</h1>
				<h2 style="color:green;margin-bottom:-10px">Your Ticket Booked Successfully!!</h2><br>
				<h3 style="background-color:navy; padding:10px 10px;border-radius:4px;color:white ">Event  : <% out.println(request.getAttribute("events")); %> </h3>
				
				<br>
				<h4>Your Name :	<% out.println(request.getAttribute("name")); %></h4>
				<h4>Your E-mail : <% out.println(request.getAttribute("email")); %></h4>
				<h4>Your Phone : <% out.println(request.getAttribute("phone")); %></h4>
				<h4>From : <% out.println(request.getAttribute("from")); %> </h4>
				<h4>To : <% out.println(request.getAttribute("to")); %></h4>
				<h4>Total Amount Paid : <% out.println(request.getAttribute("amountpaid")); %></h4>
				<h4>Payment Mode : <% out.println(request.getAttribute("mode")); %></h4>
				
			</div>
		</div>
	</div>
	<br><br><br>

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