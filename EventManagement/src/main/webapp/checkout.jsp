<!DOCTYPE html>
<%@page import="com.entities.Event"%>
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

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/Style.css">
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
	</div>
	<!-----------------account-page------------------>
	<div class="account-page">
		<div class="container">
			<div class="row">
				<div class="col-2">
					<div class="form-container" style="height: auto; width: auto;">
						<div class="form-btn">
							<h2>Complete Your Event</h2>
							<%
							try {
																		session = request.getSession();
																		int id = (Integer) session.getAttribute("id");
																		int total = 0;
																		String eventname="";
																		Session s = FactoryProvider.getFactory().openSession();
																		Transaction tx = s.beginTransaction();	
																		if(session.getAttribute("order") == "cart")
																		{
																			
																			String query = "from AddEvent where UserId=:id";
																			Query q = s.createQuery(query);
																			q.setParameter("id", id);
																			List<AddEvent> list = q.list();
																			
																			out.println("<br><b>Event(s):</b>");
																			for (AddEvent cart : list) {
																				out.println(cart.getEventName()+",");
																		 		eventname+=cart.getEventName()+",";
																				total = total + Integer.parseInt(cart.getEventPrice());
																			}
																			out.println("<br><b>Total Amount Payable:</b> "+total+"rs <br><br>");
																			//out.println(equipmentname);
																			//session.removeAttribute("order");
																		}
																		else
																		{
																			int eqid = Integer.parseInt(request.getParameter("eid"));
																			String query="from Event where Id=:eid";
																			Query q =s.createQuery(query);
																			q.setParameter("eid",eqid);
																			Event event=(Event) q.uniqueResult();
																			if (event != null )
																			{
																				out.println("<br><b>Event(s):</b> "+event.getEventName());
																				eventname=event.getEventName();
																				out.println("<br><b>Total Amount Payable:</b> "+event.getEventPrice()+" Rs<br><br>");
																				total=Integer.parseInt(event.getEventPrice());
																			}
																		}
							%>
						<form id="RegForm" action="OrderServlet" method="post">
							<input name="name" type="text" placeholder="Name" required>
							<input name="email" type="email" placeholder="Email Id" required>
							<input name="phoneno" type="text" placeholder="Phone Number" maxlength="10" required>
							<p>From</p>
							<input type="date" name="from" required>
							<p>To</p>
							<input type="date" name="to" required>
							<textarea name="address" placeholder="Enter address" rows="5"
								required></textarea>
							<p>Select Payment Mode</p>
							<select name="PaymentMode" required>
								<option selected disabled>Select Payment Mode</option>
								<option value="COD">Cash on Delivery</option>
								<option value="Net Banking">Net Banking</option>
								<option value="Card">Debit/Credit card</option>
								<option value="UPI">UPI Payment</option>
							</select>
							<input type="hidden" name="events" value="<% out.println(eventname); %>" >
							<input type="hidden" name="total" value=<% out.println(total); %> >
							<button name="submit" type="submit" class="btn">
								<a href="orderconfirmation.jsp">Enroll in event</a>
							</button>
						</form>
						<%		tx.commit();
								s.close();
							}
							 catch (Exception e) {
								e.printStackTrace();
								out.println("Error");
							}
						%>
					</div>
						</div>
				</div>
			</div>
		</div>
	</div>

	<!---------------------footer--------------------------->
	<%@ include file="footer.jsp"%>
	<!------------js for toggle menu----------->
	<!-- 	<script>
		var MenuItems = document.getElementById('MenuItems');
		MenuItems.style.maxHeight = "0px";

		function menutoggle() {
			if (MenuItems.style.maxHeight == "0px") {
				MenuItems.style.maxHeight = "200px";
			} else {
				MenuItems.style.maxHeight = "0px";
			}
		}
</script> -->
</body>
</html>