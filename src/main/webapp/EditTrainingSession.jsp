<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Session</title>
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
	justify-content: center;
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
	border: none;
	cursor: pointer;
}

button {
	width: 120px;
	padding: 10px;
	border: none;
	cursor: pointer background-color: #4caf50;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h1>Edit Session</h1>
		<form class="text-left" id="addSessionForm"
			onsubmit="return submitForm()">
			<div class="form-row">
				<div class="form-column">

					<label for="id">Session UID:</label> <input type="text" id="id"
						readonly> <label for="sessionName">Session Name:</label> <input
						type="text" id="sessionName" name="sessionName"
						pattern="\d{4}-\d{4}"
						title="Please enter a numeric year range (e.g., 2023-2024)"
						placeholder="Enter Year Range (e.g., 2023-2024)" required>
					<div class="invalid-feedback " style="color: red"
						id="sessionNameError"></div>

					<label for="status">Status:</label> <input type="text" id="status"
						readonly>


				</div>
				<div class="form-column">
					<label for="sessionCode">Session Code:</label> <input type="text"
						id="sessionCode" name="sessionCode" readonly> <label
						for="fromDate">From Date:</label> <input type="date" required id="fromDate">
					<label for="toDate">To Date:</label> <input type="date" required id="toDate">
				</div>

				<div class="buttons">
					<button type="submit" class="btn btn-primary">Submit</button>
				
					<button type="button" class="btn btn-danger" id="exitButton">Cancel</button>
				</div>
			</div>
		</form>
	</div>




	<script>
		$(document).ready(function() {

			var id = getUrlParameter("id");
			editSession(id);

			window.submitForm = function() {
				addEditData();

				// Prevent the default form submission
				return false;
			}
			$("#exitButton").click(function() {
				window.location.href = "/session_master.jsp";
			});

		});
		function getUrlParameter(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
			var results = regex.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}

		function editSession(id) {

			$.ajax({
				type : "GET", // Assuming you are using PUT method for updates
				url : "/api/session/getbysessionid/" + id,
				contentType : "application/json",
				success : function(data) {

					$("#id").val(data.id);
					$("#sessionCode").val(data.sessionCode);
					$("#sessionName").val(data.sessionName);
					$("#fromDate").val(data.fromDate);
					$("#toDate").val(data.toDate);
					$("#status").val(data.status);

				},
				error : function(xhr, status, error) {
					console
							.error("Failed to update training session: "
									+ error);
					alert("Failed to update Training session: " + error);
				}
			});

		}

		// Perform AJAX request to update the data
		function addEditData() {
			var id = $("#id").val();
			var sessionCode = $("#sessionCode").val();
			var sessionName = $("#sessionName").val();
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var status = $("#status").val();

			var modifiedData = {
				sessionCode : sessionCode,
				sessionName : sessionName,
				fromDate : fromDate,
				toDate : toDate,
				status : status
			};

			$.ajax({
				type : "PUT", // Assuming you are using PUT method for updates
				url : "/api/session/updateSession/" + id,
				contentType : "application/json",
				data : JSON.stringify(modifiedData),
				success : function(response) {
					console.log("Training session updated successfully");
					alert("Training session updated successfully");
					window.location.href = "/session_master.jsp";

				},
				error : function(xhr, status, error) {
					console
							.error("Failed to update training session: "
									+ error);
					alert("Failed to update Training session: " + error);
				}
			});
		}

		// Event handler for Exit button
	</script>

</body>
</html>