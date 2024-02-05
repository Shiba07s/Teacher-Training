<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - TTSS</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"/>
    <style>
        /* Remove date format from input */
        input[type="date"]:required:invalid::-webkit-datetime-edit {
            color: transparent;
            font-size: 15px;
        }

        input[type="date"]:focus::-webkit-datetime-edit {
            color: black !important;
            font-size: 15px;
        }

        .custom-card-body {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            height: 200px;
            padding: 80px;
        }

        .containerr {
            position: "fixed";
            top: 140px;
        }

        /* Add some styles for the dashboard layout */
        .dashboard-container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .dashboard-card {
            flex: 1;
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
       
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">TTSS Dashboard</a>
        </div>
        <!-- You can add more navigation items here -->
    </div>
</nav>

<!-- Dashboard Content -->
<div class="dashboard-container">
    <!-- Placeholder Card -->
    <div class="dashboard-card">
        <h4>Card Title</h4>
        <p>Dashboard content goes here...</p>
    </div>
    <!-- You can add more dashboard cards here -->
</div>

</body>
</html>
