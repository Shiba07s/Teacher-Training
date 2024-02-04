<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css">
	<title>Government Of Andhra Pradesh</title>
	<style>
		* {
			padding: 0;
			margin: 0;
		}

		body {
			background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
		}

		.banner {
			background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
			display: flex;
			justify-content: space-around;
			align-items: center;
			width: 100%;
			font-size: 1.8rem;
		}

		.container {
			height: 3rem;
			background: linear-gradient(#e66465, #9198e5);
			display: flex;
			justify-content: flex-end;
			align-items: center;
		}

		.container2 {
			font-size: 1.7rem;
			margin-right: 9rem;
		}
	</style>
</head>

<body>
	<div>
		<div class="banner">
			<div>
				<img src="./assets/logo1Transparent.png" alt="Second logo">
			</div>
			<diV>
				<p>Teacher Training Support System <br>Government Of Andhra Pradesh</p>
			</diV>
			<div>
				<img src="./assets/logo2Tranparenet.png" alt="First Logo">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="container2">
			<p><a href="/authentication.jsp">Login</a></p>
			<!-- <p><a href="/TTSS03/authentication.html">Login</a></p>-->
		</div>
	</div>
	<div class="container3">
		<img src="./assets/pic1.png" alt="train" width="1534" />
	</div>
	<div>
	</div>
</body>

</html>