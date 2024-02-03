<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Dashboard</title>
 
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
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
            margin-top: 20px;
        }
 
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
 
        th {
            background-color: #007bff;
            color: #fff;
        }
 
        tr:nth-child(even) {
            background-color: #f2f2f2;
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
                row.insertCell(3).innerHTML = training.tmodule;
                row.insertCell(4).innerHTML = training.tmonth;
                row.insertCell(5).innerHTML = training.tyear;
                row.insertCell(6).innerHTML = training.tname;
                row.insertCell(7).innerHTML = training.tdescription;
                row.insertCell(8).innerHTML = training.tgrade;
                row.insertCell(9).innerHTML = training.tagency;
                row.insertCell(10).innerHTML = training.location;
                row.insertCell(11).innerHTML = training.coordinatorname;
                row.insertCell(12).innerHTML = training.coordinator_email;
                row.insertCell(13).innerHTML = training.coordinator_mobile;
                row.insertCell(14).innerHTML = training.tstate;
                row.insertCell(15).innerHTML = training.tdistrict;
                row.insertCell(16).innerHTML = training.tmandal;
                row.insertCell(17).innerHTML = training.apply_start_dt;
                row.insertCell(18).innerHTML = training.apply_end_dt;
                row.insertCell(19).innerHTML = training.training_start_dt;
                row.insertCell(20).innerHTML = training.training_end_dt;
            }
        }
    </script>
</head>
 
<body>
    <h2>View Dashboard</h2>
 
    <table border="1" id="trainingTable">
        <tr>
           <th>Training Ref Id</th>
            <th>Venue</th>
            <th>Training Mode</th>
            <th>Module</th>
            <th>Training Month</th>
            <th>Training Year</th>
            <th>Training Name</th>
            <th>Description</th>
            <th>Grade</th>
            <th>Agency</th>
            <th>Map Location</th>
            <th>Coordinator Name</th>
            <th>  Email</th>
            <th> Mobile</th>
            <th> State</th>
            <th> District</th>
            <th> Mandal</th>
            <th>Application Start Date</th>
            <th>Application End Date</th>
            <th>Training Start Date</th>
            <th>Training End Date</th>
        </tr>
    </table>
</body>
</html>