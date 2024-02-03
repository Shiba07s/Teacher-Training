
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
<title>Edit Training Grade</title>
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
		var slno = getUrlParameter("slno");
		editGrade(slno);

		// Event handler for Save button
		$("#saveButton").click(function() {
			saveGradeData(slno);
		});

		// Event handler for Exit button
		$("#exitButton").click(function() {
			window.location.href = "/TrainingGrade.jsp";
		});
	});
	function editGrade(slno) {
		$.ajax({
			type : "GET", // Assuming you are using PUT method for updates
			url : "/api/getbygradeid/" + slno,
			success : function(data) {
				// Set initial values in the input fields
				$("#gradecode").val(data.slno);
				$("#attendgrade").val(data.attendgrade);
				$("#status").val(data.status);

			},
			error : function(xhr, status, error) {
				console.error("Failed to update training: " + error);
				alert("Failed to update Grade: " + error);
			}
		});

	}
	function saveGradeData(slno) {
		// Get modified data from input fields
		var modifiedUid = $("#groupCode").val();
		var modifiedGrade = $("#attendgrade").val();
		var modifiedStatus = $("#status").val();
		
		// Validate training group
	       if (modifiedGrade.trim() === "") {
	           alert(" Target Grade field can not be empty");
	           return; // Stop further execution if validation fails
	       }

		// Perform AJAX request to update the data
		$.ajax({
			type : "PUT", // Assuming you are using PUT method for updates
			url : "/api/updateTrainingGrade/" + slno,
			data : {
				attendgrade : modifiedGrade
			},
			success : function(response) {
				console.log("Grade updated successfully");
				alert("Grade updated successfully");
				window.location.href = "/TrainingGrade.jsp";

			},
			error : function(xhr, status, error) {
				console.error("Failed to update training: " + error);
				alert("Failed to update Grade: " + error);
			}
		});
	}
</script>


</head>
<body>
	<h1>Edit Training Grade</h1>
	<div>
		<label for="gradecode">TrainingGrade Code:</label> <input type="text"
			id="gradecode" readonly>
	</div>
	<div>
		<label for="attendgrade">Target Grade:</label> <input type="text"
			id="attendgrade">
	</div>
	<div>
		<label for="status">Status:</label> <input type="text" id="status"
			readonly>
	</div>
	<button id="saveButton">Save</button>
	<button id="exitButton">Exit</button>
</body>
</html>
