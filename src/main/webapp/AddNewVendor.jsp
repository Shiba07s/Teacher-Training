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
	cursor: pointer
	background-color: #4caf50;
}
button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="container" align="center">
	<h1>Add Vendor</h1>
		<form id="addSessionForm" class="text-left" onsubmit="return saveForm()">
   			 <div class="form-row">
		        <div class="form-column">
		            <label for="vendorcode"> vendor Code:</label>
		            <input type="text" id="vendorcode" placeholder="Enter vendor Code" required>
		            <label for="name">Name:</label>
	                <input type="text" id="name" required>
	                <label for="contractperson">contract person:</label>
		            <input type="text" id="contractperson" name="contractperson" required >
		            
		            <label for="contactno">Contact No:</label>
		            <input type="contactno" id="contactno"  placeholder="Enter Mobile No" required pattern="\d{10}" oninput="this.value = this.value.replace(/\D/g, '')" title="Please enter 10 numbers" maxlength="10">
		        </div>
		        <div class="form-column">
		            <label for="vendor">vendor:</label>
		            <input type="text" id="vendor" placeholder="Enter vendor" >
		            <label for="address">Vendor Address:</label>
		            <input type="text" id="address" required>
		            <label for="emailid">email-id:</label>
		            <input type="text" placeholder="example@example.xyz" id="emailid" >
		           
		        </div>
		        <div class="buttons">
					<button type="submit" class="btn btn-primary" id="saveButton">Save</button>
					&nbsp;
					<button type="button" class="btn btn-danger" onclick="closeForm()" id="exitButton">Close</button>
				</div>
    	</div>
 	</form>

</div>
	<script>

function validateForm() {

    
   	var emailInput = document.getElementById("emailid");
    var email = emailInput.value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    return true;
  }
  
  
  function addVeendorData(){
	  if (validateForm()) {
          // Collect form data and create a JSON object
          var formData = {
        		  vendorcode: $("#vendorcode").val(),
        		  vendor: $("#vendor").val(),
        		  name: $("#name").val(),
        		  address: $("#address").val(),
        		  contractperson: $("#contractperson").val(),
        		  emailid: $("#emailid").val(),
        		  contactno: $("#contactno").val(),
            
          };
 
          // Make a POST request to the api/create/venue endpoint
          $.ajax({
            type: "POST",
            url: "/api/vender/save",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
              console.log(response);
              toastr.success("Venue saved successfully",'Success', { timeOut: 2000 });
              window.location.href = "/VendorMaster.jsp";
            },
            error: function (xhr, status, error) {
              console.error("API request error: " + error);
              toastr.error("Failed to save vendor  data");
            },
          });
        }
  }
$(document).ready(function () {
     
 
 
      window.saveForm = function () {
        // Prevent the default form submission
        addVeendorData()
        return false;
      };
 
      window.closeForm = function () {
        // Redirect to venueSetUp.jsp
        window.location.href = "/VendorMaster.jsp";
      };
    });
  </script>


	

</body>
</html>