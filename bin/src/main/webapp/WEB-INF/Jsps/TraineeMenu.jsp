<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>menu</title>
<head>
    
    <style>
        ul.horizontal-nav {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        ul.horizontal-nav li {
            float: left;
        }

        ul.horizontal-nav li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        ul.horizontal-nav li a:hover {
            background-color: #444;
        }

        ul.vertical-nav {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f2f2f2;
        }

        ul.vertical-nav li {
            padding: 8px;
        }

        ul.vertical-nav li a {
            display: block;
            color: #333;
            text-decoration: none;
        }

        ul.vertical-nav li a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
   <h2 align="center">Teacher Training Support System</h2>
    <h2 align="center">Govt. OF AndhraPradesh</h2>
    
    
    <ul class="horizontal-nav">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="services.jsp">Services</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>

    <ul class="vertical-nav">
        <li><a href="apply">Apply For New Trainings</a></li>
        <li><a href="view">My Trainings</a></li>
        <li><a href="services.jsp">Services</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</body>
</html>