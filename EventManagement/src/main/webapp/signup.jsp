<!DOCTYPE html>
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
					<div class="form-container">
						<div class="form-btn">
							<span>Register</span>
							<!-- 	<hr id="Indicator"> -->
						</div>
						<form id="RegForm" action="RegistrationServlet" method="post">
							<input name="name" type="text" placeholder="Name" required>
							<input name="email" type="email" placeholder="Email Id" required>
							<input name="phoneno" type="text" placeholder="Phone Number"
								maxlength="10" required> <input name="password"
								type="password" placeholder="Password" required>
							<button name="submit" type="submit" class="btn">
								<a href="">Register</a>
							</button>
						</form>
					</div>
				</div>
			</div>
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
	<!------------js for toggle form----------->
	<!-- 	<script>
		var LoginForm = document.getElementById("LoginForm");
		var RegForm = document.getElementById("RegForm");
		var Indicator = document.getElementById("Indicator");

		function register() {
			RegForm.style.transform = "translateX(0px)";
			LoginForm.style.transform = "translateX(0px)";
			Indicator.style.transform = "translateX(100px)";
		}

		function login() {
			RegForm.style.transform = "translateX(300px)";
			LoginForm.style.transform = "translateX(300px)";
			Indicator.style.transform = "translateX(0px)";
		}
	</script> -->
</body>
</html>