<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Venue</title>

<!-- Favicon-->
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
		<h1 class="text-center">Add New Component</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="resources">Resources</label> <input type="text"
							id="resources" class="form-control"
							placeholder="Enter Resources name" required>
					</div>
					<div class="form-group">
						<label for="description">Description:</label> <input type="text"
							id="description" class="form-control"
							placeholder="Enter Description" required>
					</div>


				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="resourceCode">Resourse Code:</label> <input
							type="text" id="resourceCode" class="form-control"
							placeholder="Enter Venue Capacity" pattern="\d{10}" oninput="this.value = this.value.replace(/\D/g, '')" required>
					</div>
					<div class="form-group">
						<label for="resourceType">Resources Type:</label> <input
							type="text" id="resourceType" class="form-control"
							placeholder="Enter Resource Type" required>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary">Add</button>
					<button type="button" class="btn btn-danger" onclick="closeForm()">Close</button>
				</div>
			</div>
		</form>
	</div>

	<script>

  
  function addVenueData(){
	  
          // Collect form data and create a JSON object
          var formData = {
        		resourceCode : $("#resourceCode").val(),
  				resources : $("#resources").val(),
  				resourceType : $("#resourceType").val(),
  				description : $("#description").val()
          };
 
          // Make a POST request to the api/create/venue endpoint
          $.ajax({
            type: "POST",
            url: "/api/component/savecomponent",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
              console.log(response);
              toastr.success("Component saved successfully",'Success', { timeOut: 2000 });
              window.location.href = "/ComponentMaster.jsp";
            },
            error: function (xhr, status, error) {
              console.error("API request error: " + error);
              toastr.error("Failed to save Component data");
            },
          });
  }
$(document).ready(function () {
     
 
 
      window.submitForm = function () {
        // Prevent the default form submission
        addVenueData();
        return false;
      };
 
      window.closeForm = function () {
        // Redirect to venueSetUp.jsp
        window.location.href = "/ComponentMaster.jsp";
      };
    });
  </script>


</body>
</html>