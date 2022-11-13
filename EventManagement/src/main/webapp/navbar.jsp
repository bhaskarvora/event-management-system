<div class="navbar">
	<div class="logo">
		<a href="index.jsp"><center>Event Management</center></a>
	</div>
	<nav>
		<ul id="MenuItems">
			<li><a href="index.jsp" >Home</a></li>
			<%
			if(session.getAttribute("id") != null)
			{
				int adminid=(Integer) session.getAttribute("id");
				if (adminid==1) {
					%>
					<li><a href="addevent.jsp">Add Events</a></li>
					<li><a href="Order.jsp">Show Participants</a></li>
					<%
					}
				
			}
			
			%>
			<!-- <li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li> -->
			<%
			if (session.getAttribute("id") == null && session.getAttribute("name")==null) {
			%>
			<li><a href="signup.jsp">Sign Up</a></li>
			<li><a href="login.jsp">Login</a></li>
			<%
			} else {
			%>
			<li><a href="logout.jsp">Logout</a></li>
			<%
			}
			%>
		</ul>
	</nav>
	<a href="cart.jsp"><img src="resources/img/cart.png" width="30px"
		height="30px"></a> <img src="resources/img/menu.png"
		class="menu-icon" onclick="menutoggle()">
</div>
