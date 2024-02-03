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
    $(document).ready(function () {
        // Retrieve the stored data from sessionStorage
        $.ajax({
            type: "GET",
            url: "/api/scheduledTrainings",
            dataType: "json",
            success: function (data) {
                // Display training data in the table
                displayTrainingData(data);
            },
            error: function (xhr, status, error) {
                console.error("API request error: " + error);
                // Handle the error here, e.g., display an error message to the user
            }
        });

        function displayTrainingData(data) {
            var table = $("#trainingTable tbody");

            // Clear existing rows
            table.empty();

            for (var i = 0; i < data.length; i++) {
                var training = data[i];
                var row = $("<tr></tr>");
                row.append("<td class='serial-column'>" + (i + 1) + "</td>");
                // Populate the row with data from the 'training' object
                row.append("<td>" + training.ref_planner_id + "</td>");
                row.append("<td>" + training.tname + "</td>");
                row.append("<td>" + training.venue_id + "</td>");
                row.append("<td>" + training.venue_name+','+"</br>"+training.vaddress+ "</td>");
                row.append("<td>" + training.tmode + "</td>");
                row.append("<td>" + training.tmonth + "</td>");
                row.append("<td>" + training.tyear + "</td>");
                row.append("<td>" + training.training_start_dt + "  to  " + training.training_end_dt + "</td>");
                row.append("<td>" + training.tmodule + "</td>");
                row.append("<td>" + training.tdescription + "</td>");
                row.append("<td style='display: none;'>" + training.tstarttime + "</td>");
                row.append("<td style='display: none;'>" + training.tendtime + "</td>");
                row.append("<td style='display: none;'>" + training.coordinatorname + "</td>");
                row.append("<td style='display: none;'>" + training.coordinatoremailid + "</td>");
                row.append("<td style='display: none;'>" + training.coordinatormobileno + "</td>");
                row.append("<td style='display: none;'>" + training.maplocation + "</td>");
                row.append("<td style='display: none;'>" + training.tagency + "</td>");
                row.append("<td style='display: none;'>" + training.resourcetype + "</td>");

                var actionCell = $("<td></td>");
                var applyNowButton = $("<a></a>")
                    .attr("href", "javascript:void(0);")  // Set href to prevent default navigation
                    .click(createClickHandler(training.ref_planner_id,training.venue_id,training.tname,training.venue_name,training.vaddress,training.tmode,training.tmonth,
                    		training.tyear,training.training_start_dt,training.training_end_dt,training.tmodule,training.tdescription,
                    		training.tstarttime,training.tendtime,training.coordinatorname,
                    		training.coordinatoremailid,training.coordinatormobileno,training.maplocation,training.tagency,training.resourcetype))
                    .text("Apply Nomination");

                actionCell.append(applyNowButton);
                row.append(actionCell);

                table.append(row);
            }
        }

        function createClickHandler(refPlannerId, venueId, tname,venue_name,vaddress, tmode,tmonth, tyear, training_start_dt,training_end_dt, tmodule, tdescription,
        		tstarttime,tendtime,coordinatorname,coordinatoremailid,coordinatormobileno,maplocation,tagency,resourcetype) {
            return function () {
                redirectToApplyPage(refPlannerId, venueId, tname,venue_name,vaddress, tmode,tmonth, tyear, training_start_dt,training_end_dt, tmodule, tdescription,
                		tstarttime,tendtime,coordinatorname,coordinatoremailid,coordinatormobileno,maplocation,tagency,resourcetype);
            };
        }

    
        function redirectToApplyPage(refPlannerId, venueId, tname,venue_name,vaddress, tmode,tmonth, tyear, training_start_dt,training_end_dt, tmodule, tdescription,
        		tstarttime,tendtime,coordinatorname,coordinatoremailid,coordinatormobileno,maplocation,tagency,resourcetype) {
            // Construct the URL with parameters
           var applyPageUrl = '/NominatedForm.jsp' +
    '?ref_planner_id=' + encodeURIComponent(refPlannerId) +
    '&venue_id=' + encodeURIComponent(venueId) +
    '&tname=' + encodeURIComponent(tname) +
    '&venue_name=' + encodeURIComponent(venue_name) +
    '&vaddress=' + encodeURIComponent(vaddress) +
    '&tmode=' + encodeURIComponent(tmode) +
    '&tmonth=' + encodeURIComponent(tmonth) +
    '&tyear=' + encodeURIComponent(tyear) +
    '&training_start_dt=' + encodeURIComponent(training_start_dt) +
    '&training_end_dt=' + encodeURIComponent(training_end_dt) +
    '&tmodule=' + encodeURIComponent(tmodule) +
    '&tdescription=' + encodeURIComponent(tdescription) +
    '&tstarttime=' + encodeURIComponent(tstarttime) +
    '&tendtime=' + encodeURIComponent(tendtime) +
    '&coordinatorname=' + encodeURIComponent(coordinatorname) +
    '&coordinatoremailid=' + encodeURIComponent(coordinatoremailid) +
    '&coordinatormobileno=' + encodeURIComponent(coordinatormobileno) +
    '&tagency=' + encodeURIComponent(tagency) +
    '&resourcetype=' + encodeURIComponent(resourcetype) +
    '&maplocation=' + encodeURIComponent(maplocation);

            console.log(applyPageUrl);

            // Redirect to the apply page
            window.location.href = applyPageUrl;
        }



    });
</script>

</head>
<body>
    <h2>Nominate Teachers For Trainings </h2>
    <table border="1" id="trainingTable">
        <thead>
            <tr>
            
                <th>Sl N0</th>
                <th>Training Ref Id</th>
                <th>Training Name</th>
                <th>Venue Id</th>
                <th>Venue  </th>
                <th>Training Mode</th>
                <th>Training Month</th>
                <th>Training Year</th>
                <th>Training Start to end Date</th>
                <th>Module</th>
                <th>Description</th>
                <th>Nominated Trainings</th>
            </tr>
        </thead>
        <tbody>
            <!-- Data will be populated dynamically here -->
        </tbody>
    </table>
</body>
</html>