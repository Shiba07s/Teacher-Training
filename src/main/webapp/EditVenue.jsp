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

$(document).ready(function () {
    // Get field values from URL parameters
    editVenue();
    $('#vdistrict')
	.change(function() {
				$('#vmandal').empty();
				$('#vmandal').append('<option value="">Select Mandal</option>');
				fetchMandals($('#vdistrict').val(), $('#vmandal').val());
	});
    
    window.submitForm = function() {
    	updateVenue();
	return false;
	}
    
    
});
    // Function to get URL parameters by name
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
 
    
    
 
    function editVenue(){
    	var venueId = getUrlParameter('vid');
        if (venueId) {
			$
					.ajax({
						type : "GET",
						url : "/api/fetchVenueById/"
								+ venueId, // Replace with your actual endpoint
						dataType : "json",
						success : function(data) {
							console.log(data);
							// Populate form fields with the retrieved data
							 $('#vid').val(data.vid);
						    $('#vname').val(data.vname);
						    $('#vstate').val(data.vstate);
						    $('#vmandal').val(data.vmandal);
						    $('#vdistrict').val(data.vdistrict);
						    $('#vlocation').val(data.vlocation);
						    $('#vcapacity').val(data.vcapacity);
						    $('#vaddress').val(data.vaddress);
						    $('#landmark').val(data.landmark);
						    $('#vtype').val(data.vtype);
						    $('#vcontactname').val(data.vcontactname);
						    $('#vcontactno').val(data.vcontactno);
						    $('#vcontactmailid').val(data.vcontactmailid);
						    
						    $('#vstatus').val(data.vstatus);
						    $('#remarks').val(data.remarks);
						    $('#maplocation').val(data.maplocation);
							// Add similar lines for other form fields
 
							// Display the form for editing
							$('#myForm').show();
							fetchDistricts(data.vdistrict,data.vmandal);
							//console.log(data.vdistrict);
						},
						error : function(xhr, status,
								error) {
							console
									.error(
											'Error fetching venue data:',
											xhr.responseText);
							alert('Error fetching venue data. Please check the console for details.');
						}
					});
		} else {
			alert('Venue ID not provided in the URL.');
		}
    }
    
  
 
    // Flags to check if dropdowns are already populated
    var districtDropdownPopulated = false;
    var mandalDropdownPopulated = false;
 
    // Variables to store fetched data
    var districtData;
    var mandalData;
 
    // Function to fetch districts
   // Function to fetch districts
function fetchDistricts(selectedDistrict,selectedMandal) {
    	console.log(selectedMandal);
    $.ajax({
        url: '/api/search/district',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            const districtDropdown = $('#vdistrict');
            // Clear existing options
            districtDropdown.empty();
 
            // Add the selected district as the first option
            districtDropdown.append('<option value="' + selectedDistrict + '">' + selectedDistrict + '</option>');
 
            // Populate the district dropdown
            data.forEach(district => {
                // Check if the option already exists
                if (district !== selectedDistrict && districtDropdown.find(`option[value="${district}"]`).length === 0) {
                    const option = $('<option></option>');
                    option.val(district);
                    option.text(district);
 
                    districtDropdown.append(option);
                }
            });
 
            // Update flags and data variables
            districtDropdownPopulated = true;
            districtData = data;
 
            // If a district is selected, fetch and populate mandals
            if (selectedDistrict) {
            	$('#vmandal').empty();
    			$('#vmandal').append(
    					'<option value="'+selectedMandal+'">'
    							+ selectedMandal + '</option>');
                fetchMandals($('#vdistrict').val(),$('#vmandal').val());
            }
            
        },
        error: function (error) {
            console.error('Error fetching district data:', error);
        }
    });
}
function fetchMandals(dist, mandal) {
	var selectedDistrict = dist;
	//console.log(selectedDistrict);

	$.ajax({
		type : 'GET',
		url : '/api/mandal?district=' + dist,
		dataType : 'json',
		success : function(mandals) {
		console.log(mandals);
			var uniqueMandals = [];
			uniqueMandals.push(mandal);

			$.each(mandals, function(index, m) {
				if (!uniqueMandals
						.includes(m)) {
					uniqueMandals.push(m);
					$('#vmandal').append(
							'<option value="' + m + '">'
									+ m
									+ '</option>');
				}
			});
		},
		error : function(error) {
			console.error(
					'Error fetching mandals: ',
					error);
		}
	});
}


function closeForm(){
	window.location.href = "/VenueSetUp.jsp";
}
function updateVenue() {
    if (validateForm()) {
    	var modifiedUid = $("#vid").val();
        var modifiedData = {
            vname: $("#vname").val(),
            vaddress: $("#vaddress").val(),
            vcapacity: $("#vcapacity").val(),
            vmandal: $("#vmandal").val(),
            vdistrict: $("#vdistrict").val(),
            vtype: $("#vtype").val(),
            vstate: $("#vstate").val(),
            vstatus: $("#vstatus").val(),
            maplocation: $("#maplocation").val(),
            status: $("#status").val(),
            vlocation: $("#vlocation").val(),
            vcontactname: $("#vcontactname").val(),
            vcontactno: $("#vcontactno").val(),
            vcontactmailid: $("#vcontactmailid").val(),
            landmark: $("#landmark").val()
        };
     
        // Perform AJAX request to update the data
        $.ajax({
            type: "PUT",
            url: "/api/updateVenue/" + modifiedUid,
            contentType: "application/json",
            data: JSON.stringify(modifiedData),
            success: function (response) {
                console.log("venue updated successfully");
                alert("venue updated successfully");
                window.location.href = "/VenueSetUp.jsp";
            },
            error: function (xhr, status, error) {
                console.error("Failed to update venue: " + error);
                alert("Failed to update venue: " + error);
            }
        });
    }else{
    	return;
    }
}
 function validateForm() {
	    var requiredFields = ["vname", "vstate", "vdistrict", "vmandal", "vlocation", "vcapacity", "vaddress", "landmark", "vtype", "vcontactname", "vcontactno", "vcontactmailid", "maplocation", "vstatus"];
	    
	    var emailInput = document.getElementById("vcontactmailid");
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
		<h1 class="text-center">Edit Venue</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="vid">Venue Id:</label> <input type="text" id="vid"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="vname">Venue Name:</label> <input type="text"
							id="vname" class="form-control" placeholder="Enter venue name"
							required>
					</div>
					<div class="form-group">
						<label for="vcontactname">Venue Co-Ordinator Name:</label> <input
							type="text" id="vcontactname" class="form-control"
							placeholder="Enter Co-Ordinator Name" required>
					</div>
					<div class="form-group">
						<label for="vcontactno">Venue Co-Ordinator Mobile:</label> <input
							type="text" id="vcontactno" name="vcontactno"
							class="form-control" placeholder="Enter Mobile No" required
							pattern="\d{10}"
							oninput="this.value = this.value.replace(/\D/g, '')"
							title="Please enter 10 numbers" maxlength="10">
					</div>
					<div class="form-group">
						<label for="vcontactmailid">Venue Co-Ordinator Email:</label> <input
							type="email" id="vcontactmailid" class="form-control"
							placeholder="Enter Email" required>
					</div>
					<div class="form-group">
						<label for="vstate">Venue State:</label> <input type="text"
							id="vstate" class="form-control" placeholder="Enter state"
							required>
					</div>

					<div class="form-group">
						<label for="vmandal">Venue Mandal:</label> <select id="vmandal"
							class="form-control" required></select>
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="vcapacity">Venue Capacity:</label> <input type="text"
							id="vcapacity" class="form-control"
							placeholder="Enter Venue Capacity" required pattern="\d{1,10}"
							oninput="this.value = this.value.replace(/[^0-9]/g, '');">
					</div>
					<div class="form-group">
						<label for="vaddress">Venue Address:</label> <input type="text"
							id="vaddress" class="form-control"
							placeholder="Enter Venue Address" required>
					</div>
					<div class="form-group">
						<label for="landmark">Landmark:</label> <input type="text"
							id="landmark" class="form-control" placeholder="Enter Landmark"
							required>
					</div>
					<div class="form-group">
						<label for="vtype">Venue Type:</label> <input type="text"
							id="vtype" class="form-control" placeholder="Enter Venue Type"
							required>
					</div>

					<div class="form-group">
						<label for="maplocation">Map Location:</label> <input type="text"
							id="maplocation" class="form-control"
							placeholder="Enter maplocation" required>
					</div>
					<div class="form-group">
						<label for="vdistrict">Venue District:</label> <select
							id="vdistrict" class="form-control" required></select>
					</div>
					<div class="hidden">
						<!-- Add d-none class here to hide the status field -->
						<label for="vstatus" class="col-sm-2 col-form-label">Venue
							Status:</label>
						<div class="col-sm-10">
							<input type="text" id="vstatus" class="form-control"
								placeholder="Enter Status" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="vlocation">Venue Location:</label> <input type="text"
							id="vlocation" class="form-control"
							placeholder="Enter Venue Location" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary">Update</button>
					<button type="button" class="btn btn-danger" onclick="closeForm()">Cancel</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>