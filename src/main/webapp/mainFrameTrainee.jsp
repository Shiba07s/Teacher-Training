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

#logoutButton {
            position: absolute;
            top: 80%;
            transform: translateY(-50%);
            right: 20px;
            cursor: pointer;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
            background-color: blue;
            padding: 10px;
            transition: background-color 0.3s;
        }

        #logoutButton:hover {
            background-color: #bbb;
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
		        <button id="logoutButton" onclick="logout()">Logout</button>
		
	</div>

	<div id="navbar">
<!-- 		<a href="/Tdashboard.jsp" target="mainFrame">Dashboard</a>  -->
			<a href="/ApplyTraining.jsp" target="mainFrame">Apply Trainings</a>
		<a href="/MyTraining.jsp" target="mainFrame">My Trainings</a> 
		
	</div>

	<div id="content">
		<div id="iframeContainer">
			<iframe src="/ApplyTraining.jsp" name="mainFrame" id="mainFrame" style="width: 100%; height: 400px;"></iframe>
		</div>
	</div>
	<script>
 function logout() {
	    // Perform session logout logic
	    <%-- Assuming session is available in your JSP environment --%>
	    <% session.invalidate(); %>

	    // Clear browser history and redirect
	    window.location.href = "/index.jsp";
	    window.location.replace("/index.jsp"); // For some browsers

	    // Additional history manipulation
	    if (window.history && window.history.pushState) {
	        // Use replaceState to clear the existing history
	        window.history.replaceState(null, null, "/index.jsp");

	        // Add a dummy entry to the history to replace current entry
	        window.history.pushState(null, null, "/index.jsp");

	        // Prevent users from navigating back to the previous state
	        window.onpopstate = function (event) {
	            window.history.go(1);
	        };
	    }
	}


	</script>

</body>
</html>
