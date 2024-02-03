<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Training Details</title>
 <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column; /* Align children in a column */
            align-items: center; /* Center align children horizontally */
        }

        h2 {
            width: 100%;
            text-align: center;
            color: #007bff;
        }

        /* Style for the container */
        .training-details {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
            max-width: 800px; /* Set a max-width for better readability on larger screens */
        }

        /* Style for each row */
        .row {
            display: flex;
            flex-wrap: wrap;
            width: 100%;
            margin-bottom: 16px;
        }

        /* Style for each column */
        .column {
            flex: 1;
            margin-bottom: 16px;
            padding: 0 8px; /* Add some horizontal spacing between columns */
        }

        input {
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        strong {
            font-weight: bold;
        }

        button {
            width: 20%;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
         .btn-danger {
            width: 20%;
            background-color: #dc3545;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: -75%;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<h2>Edit Training Details</h2>

<!-- Container for training details -->
<div id="trainingDetails" class="training-details">
    <div class="row">
        <div class="column">
            <strong>SL:</strong> <input type="text" id="slField" disabled><br>
        </div>
        <div class="column">
            <strong>Budgeted Year:</strong> <input type="text" id="budgetedyearField"><br>
        </div>
      
      <div class="column">
            <strong>Training Name:</strong> <input type="text" id="trainingnameField" disabled><br>
        </div>
        <div class="column">
            <strong>TCC Name:</strong> <input type="text" id="tcnameField" disabled><br>
        </div>
        </div>
        <div class="row">
        <div class="column">
            <strong>Estimated Budget:</strong> <input type="text" id="estimatedbudgetField" disabled><br>
        </div>
        <div class="column">
            <strong>Sanctioned Budget:</strong> <input type="text" id="sanctionedbudgetField"><br>
        </div>
        <div class="column">
            <strong>Trainer Role:</strong> <input type="text" id="traineeroleField"><br>
        </div>
        <div class="column">
            <strong>Frequency:</strong> <input type="text" id="frequencyField"><br>
        </div>
        </div>
        <div class="row">
        <div class="column">
            <strong>Unit:</strong> <input type="text" id="unitField"><br>
        </div>
        <div class="column">
            <strong>Amount:</strong> <input type="text" id="amountField"><br>
        </div>
    </div>
     <div class="row">
        <div class="column">
    <button onclick="updateTrainingDetails()">Update</button>
    </div>
     <div class="column">
    <button type="button" class="btn btn-danger" onclick="deleteBudget()">Cancel</button>
    </div>
</div>


<script>
function deleteBudget() {
	window.location.href="/viewBudgetScreen.jsp";
	
}
var slno; 
    $(document).ready(function () {
        // Function to extract the slno from the URL
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        // Get the slno from the URL
         slno = getParameterByName('slno');

        // Check if slno is present
        if (slno) {
            // Make an AJAX GET request
            $.ajax({
                type: "GET",
                url: "/api/mapping/search/data?mid=" + slno,  // Replace with your actual API endpoint
                dataType: "json",
                success: function (data) {
                    // Populate the input fields with data
                    $('#slField').val(data[0].sl);
                    $('#budgetedyearField').val(data[0].budgetedyear);
                    $('#trainingnameField').val(data[0].trainingname);
                    $('#tcnameField').val(data[0].tcname);
                    $('#estimatedbudgetField').val(data[0].estimatedbudget);
                    $('#sanctionedbudgetField').val(data[0].sanctionedbudget);
                    $('#traineeroleField').val(data[0].traineerole);
                    $('#frequencyField').val(data[0].frequency);
                    $('#unitField').val(data[0].unit);
                    $('#amountField').val(data[0].amount);

                    // Handle the response data as needed
                    console.log(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                    // Handle the error here, e.g., display an error message to the user
                }
            });
        } else {
            console.error('slno parameter not found in the URL.');
            // Handle the case where slno parameter is not present
        }
    });

    // Function to update training details
    function updateTrainingDetails() {
        // Retrieve updated values from input fields
        var updatedData = {
            sl: $('#slField').val(),
            budgetedyear: $('#budgetedyearField').val(),
            trainingname: $('#trainingnameField').val(),
            tcname: $('#tcnameField').val(),
            estimatedbudget: $('#estimatedbudgetField').val(),
            sanctionedbudget: $('#sanctionedbudgetField').val(),
            traineerole: $('#traineeroleField').val(),
            frequency: $('#frequencyField').val(),
            unit: $('#unitField').val(),
            amount: $('#amountField').val()
        };
        
        // Make an AJAX POST request to update the data
        $.ajax({
            type: "PUT",
            url: "/api/mapping/updatebyid/"+slno,  // Replace with your actual API endpoint
            contentType: "application/json",
            data: JSON.stringify(updatedData),
            success: function (response) {
                console.log("Update successful:", response);
                alert("Training details updated successfully!");
                window.href.location="/viewBudgetScreen.jsp";
            },
            error: function (xhr, status, error) {
                console.error("Update failed:", error);
                alert("Error updating training details. Please try again.");
            }
        });
    }
</script>

</body>
</html>
