<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

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

.hidden {
	display: none;
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
<title>Edit Venue</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
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
	$(document).ready(function() {
		// Get field values from URL parameters
		editVendor();

		window.saveForm = function() {
			updateVendor();
			return false;
		}

	});
	// Function to get URL parameters by name
	function getUrlParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
		var results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	function editVendor() {
		var venueId = getUrlParameter('sl');
		if (venueId) {
			$
					.ajax({
						type : "GET",
						url : "/api/vender/getbyid/" + venueId, // Replace with your actual endpoint
						dataType : "json",
						success : function(data) {
							console.log(data);
							// Populate form fields with the retrieved data
							// Assuming 'data' is the JSON object containing your values
							$("#sl").val(data.sl);
							$("#vendorcode").val(data.vendorcode);
							$("#vendor").val(data.vendor);
							$("#name").val(data.name);
							$("#address").val(data.address);
							$("#contractperson").val(data.contractperson);
							$("#emailid").val(data.emailid);
							$("#contactno").val(data.contactno);

							// Display the form for editing
							$('#myForm').show();
						},
						error : function(xhr, status, error) {
							console.error('Error fetching venue data:',
									xhr.responseText);
							alert('Error fetching venue data. Please check the console for details.');
						}
					});
		} else {
			alert('ID not provided in the URL.');
		}
	}

	function closeForm() {
		window.location.href = "/VendorMaster.jsp";
	}
	function updateVendor() {
		if (validateForm()) {
			var modifiedUid = getUrlParameter('sl');
			var modifiedData = {
				vendorcode : $("#vendorcode").val(),
				vendor : $("#vendor").val(),
				name : $("#name").val(),
				address : $("#address").val(),
				contractperson : $("#contractperson").val(),
				emailid : $("#emailid").val(),
				contactno : $("#contactno").val(),

			};

			// Perform AJAX request to update the data
			$.ajax({
				type : "PUT",
				url : "/api/vender/updatebyid/" + modifiedUid,
				contentType : "application/json",
				data : JSON.stringify(modifiedData),
				success : function(response) {
					console.log("vendor updated successfully");
					alert("vendor updated successfully");
					window.location.href = "/VenueSetUp.jsp";
				},
				error : function(xhr, status, error) {
					console.error("Failed to update vendor: " + error);
					alert("Failed to update vendor: " + error);
				}
			});
		} else {
			return;
		}
	}
	function validateForm() {
		var requiredFields = [ "vendorcode", "name", "contractperson",
				"contactno", "vendor", "address", "emailid" ];

		var emailInput = document.getElementById("emailid");
		var email = emailInput.value;
		var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		if (!emailPattern.test(email)) {
			alert("Please enter a valid email address.");
			return false;
		}
		// Check each required field
		for (var i = 0; i < requiredFields.length; i++) {
			var field = requiredFields[i];
			var value = $("#" + field).val();

			if (value === null || value === "") {
				alert("Please fill in all required fields.");
				return false; // Exit the function if any field is empty
			}
		}

		// Return true if all required fields are filled
		return true;
	}
</script>

</head>
<body>
	<div class="container" align="center">
		<h1>Add Vendor</h1>
		<form id="myForm" class="text-left" onsubmit="return saveForm()">
			<div class="form-row">
				<div class="form-column">
				<label for="sl"> vendor id:</label> <input type="text"
						id="sl" placeholder="" required readonly>
					<label for="vendorcode"> vendor Code:</label> <input type="text"
						id="vendorcode" placeholder="Enter vendor Code" required>
					<label for="name">Name:</label> <input type="text" id="name"
						required> <label for="contractperson">contactperson:</label>
					<input type="text" id="contractperson" name="contractperson"
						required>
						 
				</div>
				<div class="form-column">
					<label for="vendor">vendor:</label> <input type="text" id="vendor"
						placeholder="Enter vendor"> 
						<label for="address">Vendor
						Address:</label> <input type="text" id="address" required>
						 <label
						for="emailid">email-id:</label> <input type="text"
						placeholder="example@example.xyz" id="emailid">
						
						<label for="contactno">Contact No:</label> <input
						type="contactno" id="contactno" placeholder="Enter Mobile No"
						required pattern="\d{10}"
						oninput="this.value = this.value.replace(/\D/g, '')"
						title="Please enter 10 numbers" maxlength="10">

				</div>
				<div class="buttons">
					<button type="submit" class="btn btn-primary" id="saveButton">Save</button>
					&nbsp;
					<button type="button" class="btn btn-danger" onclick="closeForm()"
						id="exitButton">Close</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>