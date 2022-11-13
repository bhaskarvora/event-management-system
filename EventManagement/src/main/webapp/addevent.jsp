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
</head>
<body>

	<div class="container">

		<%@ include file="navbar.jsp"%>
	</div>
	<div class="account-page">
		<div class="container">
			<div class="row">
				<div class="col-1">
					<h1 style="color:white;">Add Event</h1>
					<form id="RegForm" class="equipmentform" action="EventServlet"
						method="post" enctype="multipart/form-data">
						<p>Event Name</p>
						<input name="name" type="text" placeholder="Event Name"
							required>
						<p>Event Price</p>
						<input name="rentprice" type="text" placeholder="Event Price"
							required>
						<p>Event Description</p>
						<textarea rows="10" cols="10" name="description"
							placeholder="Event Description" required></textarea>
						<p>Event Image</p>
						<input type="file" name="image" placeholder="Equipment image"
							required>
						<button name="submit" type="submit" class="btn2">
							<a href="">Add</a>

						</button>
					</form>
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

</body>
</html>