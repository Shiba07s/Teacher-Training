<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>menu</title>

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
<body onload="loadExcel()">
    <h2 align="center">Teacher Training Support System</h2>
    <h2 align="center">Govt. OF AndhraPradesh</h2>

    <ul class="horizontal-nav">
        <li><a href=""></a></li>
        <li><a href="schedule">Schedule Training</a></li>
        <li><a href="view">View Scheduled Trainings</a></li>
    </ul>

    <ul class="vertical-nav">
        <li><a href="academic">Academic Calendar</a></li>
        <li><a href="schedule">Schedule Training</a></li>
        <li><a href="view">View Scheduled Trainings</a></li>
    </ul>

    <!-- Middle component to display Excel content -->
    <div id="excelContent"></div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.full.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        function loadExcel() {
            
</body>
</html>
