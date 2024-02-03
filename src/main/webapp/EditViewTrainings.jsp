<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		var venueId = getUrlParameter('vid');
		var trainingId = getUrlParameter('tid');
		//console.log(trainingId,venueId);
		editVenue(trainingId, venueId);
		$('#district').change(function() {
			$('#mandal').empty();
			$('#mandal').append('<option value="">Select Mandal</option>');
			fetchMandals($('#district').val(), $('#mandal').val());
		});
		window.submitForm = function() {
			updateScheduledData();
			return false;
		}

	});
	function getUrlParameter(name) {
		name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
		var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		var results = regex.exec(location.search);
		return results === null ? '' : decodeURIComponent(results[1].replace(
				/\+/g, ' '));
	}
	function editVenue(trainingId, venueId) {
		if (venueId && trainingId) {
			$.ajax({
				type : "GET",
				url : "/api/fetchScheduledTrainingById/" + trainingId
						+ "/" + venueId, // Replace with your actual endpoint
				dataType : "json",
				success : function(data) {
					console.log(data);
					fetchDistricts(data.district,data.mandal);
					Object.keys(data).forEach(function(key) {
						$('#' + key).val(data[key]);
					});
					

				},
				error : function(xhr, status, error) {
					console.error('Error fetching venue data:',xhr.responseText);
					alert('Error fetching venue data. Please check the console for details.');
				}
			});
		} else {
			alert('Venue ID not provided in the URL');
		}
	}
	var districtDropdownPopulated = false;
    var mandalDropdownPopulated = false;
 
    // Variables to store fetched data
    var districtData;
    var mandalData;
	function fetchDistricts(selectedDistrict,selectedMandal) {
	    $.ajax({
	        url: '/api/search/district',
	        type: 'GET',
	        dataType: 'json',
	        success: function (data) {
	            const districtDropdown = $('#district');
	            // Clear existing options
	            districtDropdown.empty();
	 
	            // Add the selected district as the first option
	            districtDropdown.append('<option value="' + selectedDistrict + '">' + selectedDistrict + '</option>');
	 
	            // Populate the district dropdown
	            data.forEach(dist => {
	                // Check if the option already exists
	                if (dist !== selectedDistrict && districtDropdown.find(`option[value="${dist}"]`).length === 0) {
	                    const option = $('<option></option>');
	                    option.val(dist);
	                    option.text(dist);
	 
	                    districtDropdown.append(option);
	                }
	            });
	 
	            // Update flags and data variables
	            districtDropdownPopulated = true;
	            districtData = data;
	 
	            // If a district is selected, fetch and populate mandals
	            if (selectedDistrict) {
	            	$('#mandal').empty();
	    			$('#mandal').append(
	    					'<option value="'+selectedMandal+'">'
	    							+ selectedMandal + '</option>');
	                fetchMandals($('#district').val(),$('#mandal').val());
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
			//console.log(mandals);
				var uniqueMandals = [];
				uniqueMandals.push(mandal);

				$.each(mandals, function(index, m) {
					if (!uniqueMandals
							.includes(m)) {
						uniqueMandals.push(m);
						$('#mandal').append(
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
	
	function updateScheduledData() {
	    if (validateForm()) {
	    	var modifiedTid = $("#ref_planner_id").val();
	    	var modifiedVid = $("#venue_id").val();
	    	console.log(modifiedVid,modifiedTid)
	        var modifiedData = {};
	     
	        $('#myForm input, #myForm select').each(function() {
	            // Get the id and value of each input/select element
	            var id = $(this).attr('id');
	            var value = $(this).val().trim(); // Trim whitespace from the value

	            // Add the id-value pair to the formData object
	            modifiedData[id] = value;
	        });
	        //console.log(modifiedData);
	        // Perform AJAX request to update the data
	        $.ajax({
	            type: "PUT",
	            url: "/api/updateScheduledTraining/" + modifiedTid + "/" + modifiedVid,
	            contentType: "application/json",
	            data: JSON.stringify(modifiedData),
	            success: function (response) {
	            	console.log(response);
	                alert("Training Scheduled successfully");
	                window.location.href = "/viewTrainings.jsp";
	            },
	            error: function (xhr, status, error) {
	                console.error("Failed to update venue: " + error);
	                alert("Failed to update venue: " + error);
	            }
	        });
	    }
	    else{
	    	return;
	    }
	}
	
	function validateForm() {
		var formIds = [
		    "ref_planner_id",
		    "tmode",
		    "vaddress",
		    "tagency",
		    "coordinator_mobile",
		    "apply_start_dt",
		    "venue_id",
		    "tmonth",
		    "tmodule",
		    "maplocation",
		    "tstate",
		    "apply_end_dt",
		    "tname",
		    "tyear",
		    "tdescription",
		    "coordinatorname",
		    "district",
		    "training_start_dt",
		    "venue_name",
		    "resourcetype",
		    "tgrade",
		    "coordinator_email",
		    "mandal",
		    "training_end_dt"
		];

	    
	    var emailInput = document.getElementById("coordinator_email");
	    var email = emailInput.value;
	    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	    if (!emailPattern.test(email)) {
	        alert("Please enter a valid email address.");
	        return false;
	    }
// 	    Check each required field
	    for (var i = 0; i < formIds.length; i++) {
	        var field = formIds[i];
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
		<h1 class="text-center">Edit Schedule</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="ref_planner_id">Training Planner Id:</label> <input
							type="text" id="ref_planner_id" name="ref_planner_id"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="tmode">Training Mode:</label> <input type="text"
							id="tmode" class="form-control" name="tmode">
					</div>
					<div class="form-group">
						<label for="vaddress">Venue Address:</label> <input type="text"
							id="vaddress" name="vaddress" class="form-control"
							placeholder="Enter Venue Address" required>
					</div>
					<div class="form-group">
						<label for="tagency">Agency:</label> <input type="text"
							id="tagency" name="vcontactno" class="form-control"
							name="tagency" required>
					</div>
					<div class="form-group">
						<label for="coordinator_mobile">Co-Ordinator Mobile:</label> <input
							type="text" id="coordinator_mobile" class="form-control"
							name="coordinator_mobile" placeholder="Enter Mobile"
							pattern="\d{10}"
							oninput="this.value = this.value.replace(/\D/g, '')"
							title="Please enter 10 numbers" maxlength="10" required>
					</div>
					<div class="form-group">
						<label for="apply_start_dt">Application Start Date</label> <input
							type="Date" id="apply_start_dt" class="form-control"
							name="apply_start_dt" required>
					</div>

				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="venue_id">Venue Id:</label> <input type="text"
							id="venue_id" class="form-control" name="venue_id" readonly>
					</div>
					<div class="form-group">
						<label for="tmonth">Training Month:</label> <input type="text"
							id="tmonth" name="tmonth" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="tmodule">Module:</label> <input type="text"
							id="tmodule" name="tmodule" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="maplocation">Map Location:</label> <input type="text"
							id="maplocation" name="maplocation" class="form-control" required>
					</div>

					<div class="form-group">
						<label for="tstate">State:</label> <input type="text" id="tstate"
							name="tstate" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="apply_end_dt">Application End Date:</label> <input
							type="Date" id="apply_end_dt" name="apply_end_dt"
							class="form-control" required></input>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="tname">Training Name:</label> <input type="text"
							id="tname" class="form-control" name="tname">
					</div>
					<div class="form-group">
						<label for="tyear">Training Year:</label> <input type="text"
							id="tyear" class="form-control" name="tyear" required>
					</div>
					<div class="form-group">
						<label for="tdescription">Description:</label> <input type="text"
							id="tdescription" name="tdescription" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label for="coordinatorname">Coordinator Name:</label> <input
							type="text" id="coordinatorname" name="coordinatorname"
							class="form-control" required>
					</div>
					<div class="form-group">
						<label for="district">District:</label> <select id="district"
							name="district" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="training_start_dt">Training Start Date:</label> <input
							type="Date" id="training_start_dt" name="training_start_dt"
							class="form-control" required>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="venue_name">Venue Name:</label> <input type="text"
							id="venue_name" class="form-control"
							placeholder="Enter Venue Name" required>
					</div>
					<div class="form-group">
						<label for="resourcetype">Resource Type:</label> <input
							type="text" id="resourcetype" class="form-control"
							name="resourcetype" required>
					</div>
					<div class="form-group">
						<label for="tgrade">Grade:</label> <input type="text" id="tgrade"
							name="tgrade" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="coordinator_email">Coordinator Email:</label> <input
							type="email" id="coordinator_email" class="form-control"
							placeholder="Enter Email" required>
					</div>

					<div class="form-group">
						<label for="mandal">Mandal:</label> <select id="mandal"
							class="form-control" name="mandal" required></select>
					</div>
					<div class="form-group">
						<label for="training_end_dt">Training End Date:</label> <input
							type="Date" id="training_end_dt" name="training_end_dt"
							class="form-control" required></input>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary btn-md">Update</button>
					&nbsp;
					<button type="button" class="btn btn-danger btn-md"
						onclick="closeForm()">Cancel</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>