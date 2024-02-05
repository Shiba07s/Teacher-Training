<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your JSP Page</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}


#banner {
	background-color: #f5f5f7;
	color: #101012;
	padding: 0px;
	text-align: center;
	 top: 0;
  width: 100%;
  z-index: 1000;
	  position: fixed;
	 
	  
}


#leftLogo, #rightLogo {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 100px; /* Adjust the width as needed */
}

#leftLogo {
	left: 1px;
}

#rightLogo {
	right: 10px;
}

#leftLogo img, #rightLogo img {
	width: 100%;
	height: auto;
}

#navbar {
	background-color: #f5f5f7;
	padding: 15px;
	width: 200px;
	position: fixed;
	height: 100%;
	box-sizing: border-box;
	top:120px;
}

#navbar a {
	display: block;
	color: #333;
	text-decoration: none;
	padding: 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	background-color: #ddd;
	transition: background-color 0.3s;
}

#navbar a:hover {
	background-color: #bbb;
}

#content {
	margin-left: 200px; /* Adjust based on the width of the navbar */
	padding: 20px;
}

#iframeContainer {
	margin-top: 100px; /* Adjust based on the height of the banner */
}

iframe {
	width: 100%;
	height: 500px;
	/* Set an initial height for the iframe, adjust as needed */
	border: none;
}
</style>
</head>
<body>

	<div id="banner">
		<h1>Teacher Training Support System</h1>
		<h3>Govt Of Andhra Pradesh</h3>
		<div id="leftLogo">
			<img src="./assets/logo.png" alt="Left Logo">
		</div>
		<div id="rightLogo">
			<img src="./assets/loggoo.png" alt="Right Logo">
		</div>
	</div>

	<div id="navbar">
		<a href="dashboard.jsp" target="mainFrame">Dashboard</a> <a
			href="AcademicCalender.jsp" target="mainFrame">Academic Calendar</a>
		<a href="Schedule1.jsp" target="mainFrame">Schedule Training</a> 
		<a href="viewTrainings.jsp" target="mainFrame" >View Trainings</a>
		
	</div>

	<div id="content">
		<div id="iframeContainer">
			<iframe src="dashboard.jsp" name="mainFrame" id="mainFrame"
				style="width: 100%; height: 500px;"></iframe>
		</div>
	</div>

</body>
</html>
