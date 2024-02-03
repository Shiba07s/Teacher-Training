<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin-top: 20px;
}

div {
	margin: 10px 0;
}

label {
	display: block;
	margin-bottom: 5px;
}

input {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
<meta charset="ISO-8859-1">
<title>Edit Training</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function getUrlParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
		var results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	$(document).ready(function() {
		// Function to get URL parameters by name

		// Get field values from URL parameters
		var statuscode = getUrlParameter("statuscode");
		editStatusCode(statuscode);

		// Set initial values in the input fields
	
		// Event handler for Save button
		$("#saveButton").click(function() {
			// Get modified data from input fields
			saveData(statuscode);

		});

		function editStatusCode(statuscode) {
			
			$.ajax({
				type : "GET", // Assuming you are using PUT method for updates
				url : "/api/getStatusCodeByid/" + statuscode,
				success : function(data) {
					console.log(data);
					$("#statuscode").val(data.statuscode);
					$("#tstatus").val(data.statusname);
					$("#status").val(data.status);


				},
				error : function(xhr, status, error) {
					console.error("Failed to update training: " + error);
					alert("Failed to update status: " + error);
				}
			});

		}

		function saveData(statuscode) {
			var modifiedUid = $("#statuscode").val();
			var modifiedTStatus = $("#tstatus").val();
			var modifiedStatus = $("#status").val();
			
			// Validate training status
            if (modifiedTStatus.trim() === "") {
                alert(" Training Status is required");
                return; // Stop further execution if validation fails
            }

			// Perform AJAX request to update the data
			$.ajax({
				type : "PUT", // Assuming you are using PUT method for updates
				url : "/api/updateTrainingStatus/" + modifiedUid,
				data : {
					statusname : modifiedTStatus
				},
				success : function(response) {
					console.log("Status updated successfully");
					alert("Status updated successfully");
					window.location.href = "/TrainingStatus.jsp";

				},
				error : function(xhr, status, error) {
					console.error("Failed to update training: " + error);
					alert("Failed to update status: " + error);
				}
			});
		}

		// Event handler for Exit button
		$("#exitButton").click(function() {
			window.location.href = "/TrainingStatus.jsp";
		});
	});
</script>

</head>
<body>
	<h1>Edit Training Status</h1>
	<div>
		<label for="statuscode">Status Code:</label> <input type="text"
			id="statuscode" readonly>
	</div>
	<div>
		<label for="tstatus">Training Status:</label> <input type="text"
			id="tstatus">
	</div>
	<div>
		<label for="status">Status:</label> <input type="text" id="status"
			readonly>
	</div>
	<button id="saveButton">Save</button>
	<button id="exitButton">Exit</button>
</body>
</html>