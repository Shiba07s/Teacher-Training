<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Apply Trainings Soon</title>
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
    <script>
        $(document).ready(function() {
            $.ajax({
                type: "GET",
                url: "api/scheduledTrainings", 
                dataType: "json",
                success: function(data) {
                    displayTrainingData(data);
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });

        function displayTrainingData(data) {
            var trainings = data; 
            var table = document.getElementById("trainingTable");

            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = table.insertRow(i + 1);
                
                row.insertCell(0).innerHTML = training.ref_planner_id;
                row.insertCell(1).innerHTML = training.venue_id;
                row.insertCell(2).innerHTML = training.tmode;
                row.insertCell(3).innerHTML = training.tmode;
                row.insertCell(4).innerHTML = training.tmonth;
                row.insertCell(5).innerHTML = training.tyear;
                row.insertCell(6).innerHTML = training.tname;
                row.insertCell(7).innerHTML = training.tmodule;
                row.insertCell(8).innerHTML = training.tdescription;

                var actionCell = row.insertCell(9);
                var applyNowButton = document.createElement("a");
                applyNowButton.setAttribute("href", "TraineeApply.jsp");
                applyNowButton.textContent = "Apply Now";

                actionCell.appendChild(applyNowButton);
            }
        }
    </script>
</head>
<body>
    <h2>Apply Trainings Soon</h2>
    <table border="1" id="trainingTable">
        <tr>
            <th>Training Ref Id</th>
            <th>Venue</th>
            <th>Training Type</th>
            <th>Training Mode</th>
            <th>Training Month</th>
            <th>Training Year</th>
            <th>Training Name</th>
            <th>Module</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </table>
</body>
</html>
