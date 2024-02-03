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
	<h1>Add Venue</h1>
		<form id="addSessionForm" class="text-left" onsubmit="return saveForm()">
   			 <div class="form-row">
		        <div class="form-column">
		            <label for="vname">Venue Name:</label>
		            <input type="text" id="vname" placeholder="Enter venue name" required>
		            <label for="coordinatorname">Venue Co-Ordinator Name:</label>
	                <input type="text" id="coordinatorname" required>
	                <label for="vcontactno">Venue Co-Ordinator Mobile:</label>
		            <input type="text" id="coordinatormobile" name="coordinatormobile" placeholder="Enter Mobile No" required pattern="\d{10}" oninput="this.value = this.value.replace(/\D/g, '')" title="Please enter 10 numbers" maxlength="10">
		            <label for="coordinatoremail">Venue Co-Ordinator Email:</label>
		            <input type="email" placeholder="example@example.xyz" id="coordinatoremail" required>
		            <label for="vstate">Venue State:</label>
		            <input type="text" id="vstate" placeholder="Enter state" required>
		            
		            <label for="vmandal">Venue Mandal:</label>
		            <select id="vmandal" placeholder="Enter mandal" required>
		                <option value="" disabled selected>Select Mandal</option>
		            </select>
		            <label for="vlocation">Venue Location:</label>
		            <input type="text" id="vlocation" required>
		        </div>
		        <div class="form-column">
		            <label for="vcapacity">Venue Capacity:</label>
		            <input type="text" id="vcapacity" placeholder="Enter Venue Capacity" required pattern="\d{1,10}" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
		            <label for="vaddress">Venue Address:</label>
		            <input type="text" id="vaddress" required>
		            <label for="landmark">Landmark:</label>
		            <input type="text" id="landmark" required>
		            <label for="vtype">Venue Type:</label>
		            <input type="text" id="vtype" required>
		            <label for="vdistrict">Venue District:</label>
			            <select id="vdistrict" placeholder="Enter district" required></select>
		            
		            <label for="maplocation">Map Location:</label>
		            <input type="text" id="maplocation" required>
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

    
   	var emailInput = document.getElementById("coordinatoremail");
    var email = emailInput.value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    return true;
  }
  
  
  function addVenueData(){
	  if (validateForm()) {
          // Collect form data and create a JSON object
          var formData = {
            vname: $("#vname").val(),
            vstate: $("#vstate").val(),
            vmandal: $("#vmandal").val(),
            vdistrict: $("#vdistrict").val(),
            vlocation: $("#vlocation").val(),
            vcapacity: $("#vcapacity").val(),
            vaddress: $("#vaddress").val(),
            landmark: $("#landmark").val(),
            vtype: $("#vtype").val(),
            vcontactname: $("#coordinatorname").val(),
            vcontactno: $("#coordinatormobile").val(),
            vcontactmailid: $("#coordinatoremail").val(),
            maplocation: $("#maplocation").val(),
          };
 
          // Make a POST request to the api/create/venue endpoint
          $.ajax({
            type: "POST",
            url: "/api/create/venue",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
              console.log(response);
              toastr.success("Venue saved successfully",'Success', { timeOut: 2000 });
              window.location.href = "/VenueSetUp.jsp";
            },
            error: function (xhr, status, error) {
              console.error("API request error: " + error);
              toastr.error("Failed to save venue data");
            },
          });
        }
  }
$(document).ready(function () {
     
 
 
      window.saveForm = function () {
        // Prevent the default form submission
        addVenueData();
        return false;
      };
 
      window.closeForm = function () {
        // Redirect to venueSetUp.jsp
        window.location.href = "/VenueSetUp.jsp";
      };
    });
  </script>


	<script>
  
 
  var districtDropdownPopulated = false;
  var mandalDropdownPopulated = false;
 
  // Variables to store fetched data
  var districtData;
  var mandalData;
 
  // Function to fetch districts
  function fetchDistricts() {
    if (!districtDropdownPopulated) {
      $.ajax({
        url: '/api/search/district',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
          const districtDropdown = $('#vdistrict');
          districtDropdown.append('<option value="" selected disabled>Select District</option>');
 
          data.forEach(district => {
            const option = $('<option></option>');
            option.val(district);
            option.text(district);
            districtDropdown.append(option);
          });
 
          districtDropdownPopulated = true;
          districtData = data;
        },
        error: function (error) {
          console.error('Error fetching district data:', error);
        }
      });
    }
  }
 
  // Function to fetch mandals
  function fetchMandals(selectedDistrict) {
    $.ajax({
      url: '/api/mandal?district=' + selectedDistrict,
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        const mandalDropdown = $('#vmandal');
        mandalDropdown.html('<option value="" selected disabled>Select Mandal</option>');
 
        data.forEach(mandal => {
          const option = $('<option></option>');
          option.val(mandal);
          option.text(mandal);
          mandalDropdown.append(option);
        });
 
        mandalData = data;
      },
      error: function (error) {
        console.error('Error fetching mandal data:', error);
      }
    });
  }
 
  // Fetch districts on document load
  $(document).ready(function () {
    fetchDistricts();
  });
 
  // Attach event listener to district dropdown
  $(document).on('change', '#vdistrict', function () {
    const selectedDistrict = $(this).val();
    if (selectedDistrict) {
      fetchMandals(selectedDistrict);
    }
  });
</script>

</body>
</html>