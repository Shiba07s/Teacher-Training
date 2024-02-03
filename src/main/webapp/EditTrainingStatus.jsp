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
<meta charset="ISO-8859-1">
<title>Edit Training</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

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

		window.submitForm = function() {
			// Prevent the default form submission
			saveData(statuscode);
			return false;
		};

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
	<div class="container" align="center">
		<h1>Edit Training Status</h1>
		<form class="text-left" id="addGradeForm"
			onsubmit="return submitForm()">
			<div class="form-row">
				<div class="col">
					<div class="form-group row">
						<label for="statuscode" class="col-sm-4 col-form-label">Status
							Code:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="statuscode" readonly>
						</div>
					</div>
					<div class="form-group row d-none">
						<!-- Hide this field -->
						<label for="status" class="col-sm-4 col-form-label">Status:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="status" readonly>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group row">
						<label for="tstatus" class="col-sm-4 col-form-label">Training
							Status:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="tstatus" required>
						</div>
					</div>
					<div class="form-group row">
						<div class="offset-sm-2 col-sm-8 text-center">
							<!-- Center the buttons -->
							<button type="submit" class="btn btn-primary" id="saveButton">Update</button>
							&nbsp;
							<button type="button" class="btn btn-danger" id="exitButton">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>
</body>
</html>