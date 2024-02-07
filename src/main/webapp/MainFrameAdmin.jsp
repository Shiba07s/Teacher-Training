<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="cache-control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your JSP Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Add some basic styling for better presentation */
ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
 
li {
	position: relative;
}
 
ul ul {
    display: none;
    position: absolute;
    top: 0;
    left: 185px;
    width: 200px;
    z-index: 4;
    background: #ffff;
}
 
li:hover>ul {
	display: block;
}
 
/*a {
	text-decoration: none;
	padding: 8px 16px;
	display: block;
	background-color: #f4f4f4;
	color: #333;
	width: 150px;
}*/
</style>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}
 
#banner {
    color: #101012;
    padding: 2px 14px;
    text-align: center;
    top: 0;
    width: 100%;
    z-index: 1000;
    position: fixed;
    box-sizing: border-box;
    background-image:  linear-gradient(to right, #32355a , #8baeff);
}
#leftLogo {
	float: left;
}
#rightLogo {
    display: inline-block;
    margin-left: 10px;
    margin-top: 0;
    float: right;
/*      background: #fff;  */
    padding: 11px 8px;
    width: 200px;
    margin-right: -122px;
}
 
#rightLogo {
	right: 10px;
}
 
#leftLogo img, #rightLogo img {
	width: 29%;
	height: 10%;
}
 
#navbar {
    padding: 15px;
    width: 235px;
    position: fixed;
    height: 100%;
    box-sizing: border-box;
    top: 100px;
    left: 0;
    padding-left: 0;
    padding-right: 0;
    padding-top: 0;
    background-image: linear-gradient(to bottom, #232546 , #8baeff);
}
 
 
 
#navbar a {
    width: 100%;
    display: block;
    padding: 12px;
    box-sizing: border-box;
    text-decoration: none;
    font-size: 16px;
    color: #fff;
    border-bottom: 1px solid #d9d9d9;
}
 
#navbar a:hover {
     background-color: #ffffff;
    color: #5e73af;
}
#navbar ul ul li a{
	color: #5e73af;
}
#navbar ul ul li a:hover{
	background: #5e73af;
	color: #fff !important;
}
 
iframe {
	    width: 100%;
    min-height: 100vh;
    border: none;
}
 
#logoutButton {
    float: right;
    background: #738fd5;
    border: none;
    color: #fff;
    font-weight: bold;
    padding: 12px 27px;
    font-size: 17px;
    margin-top: 17px;
    cursor: pointer;
    position: absolute;
    right: 0;
    top: 73%;
    width: 100%;
    background: #fbfbfb5c;
}
#logoutButton:hover {
    color: #738fd5;
    background-color: #fff !important;
    box-shadow: 0px 0px 5px -4px #000;
}
 
#logoutButton:hover {
	background-color: #bbb;
}
.middle-box {
    display: inline-block;
}
.middle-box h1 {
    font-size: 25px;
    color: #fff;
    font-weight: bold;
    margin: 0;
}
.middle-box h1 span {
    display: block;
    font-size: 18px;
    color: #fff;
    font-weight: 500;
}
div#leftLogo img {
    width: 180px;
    margin-top: 20px;
}
div#banner img {
    float: left;
}
.middle-box {
    display: inline-block;
    vertical-align: top;
    padding: 12px 22px;
    margin-top: 10px;
}
.main-content {
    float: left;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
    padding-left: 245px;
    padding-top: 100px;
}
div#content {
    padding: 5px 0 0 0;
}
button.card-link {
    margin-bottom: 29px;
}
.left-box{
	position: relative;
	height: 100vh;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsencrypt/2.3.1/jsencrypt.min.js" integrity="sha512-zDvrqenA0eFJZCxBsryzUZcvihvNlEXbteMv62yRxdhR4s7K1aaz+LjsRyfk6M+YJLyAJEuuquIAI8I8GgLC8A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  
 
</head>
<body>
 
	<div class="header" id="banner">
		<div id="leftLogo">
			<img src="./assets/ap3.png" alt="Left Logo">
		</div>
		<div class="middle-box">
		<h1>Teacher Training Support System <span>Govt Of Andhra Pradesh</span></h1>
		</div>
		<div id="rightLogo">
			<img src="./assets/logo2Tranparenet.png" alt="Right Logo">
		</div>
 
	</div>
<div class="main-content">
	<div id="navbar">
		<div class="left-box">
		<ul>
			<li><a href="${pageContext.request.contextPath}/dashboard.jsp"
				target="mainFrame">Dashboard</a></li>
			<li><a
				href="${pageContext.request.contextPath}/MasterSetupScreen.jsp"
				target="mainFrame">Master Setup</a></li>
			<li><a
				href="${pageContext.request.contextPath}/AcademicCalender.jsp"
				target="mainFrame">Training Calendar Setup</a></li>
			<li><a href="#">Budget </a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/BudgetMasterSetupScreen.jsp"
						target="mainFrame"> Budget Master Setup </a></li>
					
					<li><a
						href="${pageContext.request.contextPath}/viewBudgetScreen.jsp"
						target="mainFrame"> Budget Mapping</a></li>
						<li><a
						href="${pageContext.request.contextPath}/budget_mapping_utilisation.jsp"
						target="mainFrame">Budgeting</a></li>
				</ul></li>
 
			<li><a href="${pageContext.request.contextPath}/Schedule1.jsp"
				target="mainFrame">Schedule Training</a></li>
			<li><a
				href="${pageContext.request.contextPath}/viewTrainings.jsp"
				target="mainFrame">View Trainings</a></li>
<!-- 			<li><a -->
<%-- 				href="${pageContext.request.contextPath}/Budgetvenuetraining.jsp" --%>
<!-- 				target="mainFrame">Budget List</a></li> -->
			<li><a
				href="${pageContext.request.contextPath}/viewMappingTrainings.jsp"
				target="mainFrame">Master Mapping</a></li>
			<li><a onclick="encryptWithRSA(publicKey, keys)">
        Go To Training Delivery
    </a></li>
 
 
		</ul>
		<br>
		<br>
<!-- 		<button onclick="encryptWithRSA(publicKey, keys)"> -->
<!--         Go To Training Delivery -->
<!--     </button> -->
		
		<button id="logoutButton" onclick="logout()"><i class="fa fa-lock" aria-hidden="true"></i> Logout</button>
	</div>
	</div>
 
 
	<div id="content">
		<div id="iframeContainer">
			<iframe src="${pageContext.request.contextPath}/dashboard.jsp"
				name="mainFrame" id="mainFrame" style="width: 100%; height: 500px;"></iframe>
		</div>
	</div>
</div>
	<script>
		$(document).ready(function() {
			$('#navbar a').click(function() {
				// Remove active class from all links
				$('#navbar a').removeClass('active');
 
				// Add active class to clicked link
				$(this).addClass('active');
			});
		});
 
		function logout() {
			// Perform session logout logic
	<%-- Assuming session is available in your JSP environment --%>
		
	<%session.invalidate();%>
		// Clear browser history and redirect
			window.location.href = "${pageContext.request.contextPath}/index.jsp";
			window.location
					.replace("${pageContext.request.contextPath}/index.jsp"); // For some browsers
 
			// Additional history manipulation
			if (window.history && window.history.pushState) {
				// Use replaceState to clear the existing history
				window.history.replaceState(null, null,
						"${pageContext.request.contextPath}/index.jsp");
 
				// Add a dummy entry to the history to replace current entry
				window.history.pushState(null, null,
						" ${pageContext.request.contextPath}/index.jsp");
 
				// Prevent users from navigating back to the previous state
				window.onpopstate = function(event) {
					window.history.go(1);
				};
			}
		}
	</script>
	
	<script>
    var storedUsername = sessionStorage.getItem('username');
    var storedPassword = sessionStorage.getItem('password');
 
    console.log('Username retrieved from session storage:', storedUsername);
    console.log('Password retrieved from session storage:', storedPassword);
 
    var keys = "username="+storedUsername +"&password="+ storedPassword;
 
    var publicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2M8cxQWdcubHqzShPN7htyrezyQ+eeuWC1Ltkd5cHxxGX2uYt9lv83pHE6LjOfOL9n3/bIu0TzjX6Lq+fTwN0BkXFWarAJ49Mr8FAfTkadMAsAY9XLEgAXKvZ87Uq5JtjhFT7SJh7ZPJuifUszl4C/CxZrSyJ9LRBaWNhdvxKNhEY66QXHNhBSFxZ8vjSY+VMV5ISKlQY4BIxAJVDTVTwoqszzV3zdgmtG3HDD1fxqkJzm5DQI/1oKci6jtBBm8bP7/K08z2t1U0xDtoF3ZI4BFWmMmGbY/PeiDhoToY3c+ym067NFsm8BTGVF6hY5tpWd0GNr8CFbe0fdl9Z3C5cQIDAQAB';
 
    function encryptWithRSA(publicKey, plaintext) {
        var encrypt = new JSEncrypt();
        encrypt.setPublicKey(publicKey);
 
       var  encrypted = encrypt.encrypt(plaintext);
 
        console.log('Encrypted Data:', encrypted);
        var base="https://stl.lnpreprod.in/account/static?key="+encrypted;
        console.log(base);
       // return encrypted;
        window.location.href=base;
    }
 
    //encryptWithRSA(publicKey, keys);
  //  var encrypted;
   
 
</script>
 
</body>
</html>