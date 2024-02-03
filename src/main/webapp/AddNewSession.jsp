<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Add Session</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

form {
	max-width: 600px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.form-column {
	float: left;
	width: 45%;
	margin-right: 5%;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #333;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.invalid-feedback {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}

.buttons {
	text-align: center;
	clear: both;
	margin-top: 15px;
}

button {
	width: 120px;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h1 class="text-center">Add New Session</h1>
		<form class="text-left" id="addSessionForm" onsubmit="return submitForm()">
			<div class="form-column">


				<label for="sessionCode">Session Code:</label> <input type="text"
					id="sessionCode" name="sessionCode" pattern="\d{4}-\d{2}"
					title="Please enter a numeric year range (e.g., 2023-24)"
					placeholder="Please enter a session code (e.g., 2023-24)" required>
				<div class="invalid-feedback" id="sessionCodeError"></div>


				<label for="fromDate">From Date:</label> <input type="date"
					id="fromDate" name="fromDate" required>
				<div class="invalid-feedback" id="fromDateError"></div>



				<label for="status">Status:</label> <select id="status"
					name="status" required>
					<option value="" disabled selected>Select Status</option>
					<option value="Current">Current</option>
					<option value="Old">Old</option>
					<option value="Plan">Plan</option>
				</select>
			</div>

			<div class="form-column">
				<label for="sessionName">Session Name :</label> <input type="text"
					id="sessionName" name="sessionName" pattern="\d{4}-\d{4}"
					title="Please enter a numeric year range (e.g., 2023-2024)"
					placeholder="Enter Year Range (e.g., 2023-2024)" required>
				<div class="invalid-feedback" id="sessionNameError"></div>


				<label for="toDate">To Date:</label> <input type="date" id="toDate"
					name="toDate" required>
				<div class="invalid-feedback" id="toDateError"></div>

			</div>

			<div class="buttons">
				<button type="submit" class="btn btn-primary">submit</button>
				<button type="button" class="btn btn-danger" onclick="closeForm()">Cancel</button>
			</div>
		</form>
	</div>

	<script>
		function validateForm() {
			var sessionCode = $("#sessionCode").val();
			var sessionName = $("#sessionName").val();
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var status = $("#status").val();

			if (sessionCode.trim() === "") {
				document.getElementById("sessionCodeError").innerHTML = "Session Code is required";
				return false;
			} else {
				document.getElementById("sessionCodeError").innerHTML = "";
			}

			if (sessionName.trim() === "") {
				document.getElementById("sessionNameError").innerHTML = "Session Name is required";
				return false;
			} else {
				document.getElementById("sessionNameError").innerHTML = "";
			}

			if (fromDate.trim() === "") {
				document.getElementById("fromDateError").innerHTML = "From Date is required";
				return false;
			} else {
				document.getElementById("fromDateError").innerHTML = "";
			}

			if (toDate.trim() === "") {
				document.getElementById("toDateError").innerHTML = "To Date is required";
				return false;
			} else {
				document.getElementById("toDateError").innerHTML = "";
			}

			if (status.trim() === "") {
				alert("Please select a status");
				return false;
			}

			return true;
		}

		function addSessionData() {
			if (validateForm()) {
				// Collect form data and create a JSON object
				var formData = {
					sessionCode : $("#sessionCode").val(),
					sessionName : $("#sessionName").val(),
					fromDate : $("#fromDate").val(),
					toDate : $("#toDate").val(),
					status : $("#status").val()
				};

				// Make a POST request to the api/savedata endpoint
				$.ajax({
					type : "POST",
					url : "/api/session/create",
					contentType : "application/json",
					data : JSON.stringify(formData),
					success : function(response) {
						console.log(response);
						toastr.success("Training data saved successfully");
						window.location.href = "/session_master.jsp";
					},
					error : function(xhr, status, error) {
						console.error("API request error: " + error);
						toastr.error("Failed to save training data");
					}
				});
			}
		}

		$(document).ready(function() {
			$("#fromDate,#toDate").click(function() {
				$(this).datepicker({
					dateFormat : 'dd-mm-yy'
				});
			});
			window.submitForm = function() {
				addSessionData();

				// Prevent the default form submission
				return false;
			}
			window.closeForm = function() {
				// Redirect to session.jsp
				window.location.href = "/session_master.jsp";
			}
		});
	</script>
</body>
</html>
