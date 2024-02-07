<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Component Resource Limit</title>

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
	cursor: pointer;
	background-color: #4caf50;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="container" align="center">
		<h1>Edit Component Resource Limit</h1>
		<form id="myForm" class="text-left"
			onsubmit="return submitForm()">
			<div class="form-row">
				<div class="form-column">
					<label for="resources">Resources:</label> <select id="resources"
						placeholder="Enter Resources" required>
						<option value="projector">Projector</option>
						<option value="venue">Venue</option>
						<option value="duster">Duster</option>
						<option value="speaker">Speaker</option>
						<option value="marker">Marker</option>
						<option value="table">Table</option>
						<option value="chair">Chair</option>
					</select> <label for="approved_rate">Approved_rate:</label> <input
						type="text" id="approved_rate" required>
				</div>
				<div class="form-column">
					<label for="budgeted_year">Budgeted_year</label> <input type="text"
						id="budgeted_year" placeholder="Enter Budgeted year" readonly>
					<label for="unit">Unit:</label> <select id="unit"
						placeholder="Options" required>
						<option value="Per_day">Per Day</option>
						<option value="lumpsum">LumpSum</option>
					</select> <input type="hidden" id="sl" name="sl">
					<!-- Hidden field for sl -->
				</div>
				<div class="buttons">
					<button type="submit" class="btn btn-primary" id="updateButton">Update</button>
					&nbsp;
					<button type="button" class="btn btn-danger" onclick="closeForm()"
						id="exitButton">Close</button>
				</div>
			</div>
		</form>
	</div>
	<script>
	
	
	$(document).ready(function () {
	    // Get field values from URL parameters
	    editCLimit();
	    $('#resources').on('change', function() {
	        // Get the selected option
	        const selectedOption = $(this).find('option:selected');
	      
	        // Get the additional data associated with the selected option
	        const additionalData = selectedOption.data('additionalData');
	      
	        // Set the value of the #budgeted_year dropdown to the additionalData
	        $('#budgeted_year').val(additionalData);
	      
	        // Clear existing options and append a new option with the additionalData as its value
	        $('#budgeted_year').empty();
	        $('#budgeted_year').append('<option value="' + additionalData + '">' + additionalData + '</option>');
	    });

	    
	    window.submitForm = function() {
	    	var isConfirmed = confirm("Are you sure you want to edit this training?");
			 
			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
	    	updateComponentData();
			}
		return false;
		}
	    
	    
	});

		
		function fetchResourse() {
		    
		      $.ajax({
		        url: '${pageContext.request.contextPath}/api/getallcomponents',
		        type: 'GET',
		        dataType: 'json',
		        success: function (data) {
		          const districtDropdown = $('#resources');
		          districtDropdown.append('<option value="" selected disabled>Select Resourse</option>');
		          $.each(data, function(index, item) {
		          districtDropdown.append($('<option>', {
						value : item.resources,
						text : item.resources,
						'data-byear' :item.budgeted_year
					}));
		          });
		        },
		        error: function (error) {
		          console.error('Error fetching district data:', error);
		        }
		      });
		    }
		
		
		function updateComponentData() {
			var sl = getUrlParameter('sl');
				// Collect form data and create a JSON object
				var formData = {
					sl : $("#sl").val(),
					resources : $("#resources").val(),
					approved_rate : $("#approved_rate").val(),
					budgeted_year : $("#budgeted_year").val(),
					unit : $("#unit").val()
				// Add other fields if needed
				};
				// Make a PUT request to the api/update/spell endpoint
				$.ajax({
					type : "PUT",
					url : "${pageContext.request.contextPath}/api/updatecomponent/"+ sl,
					contentType : "application/json",
					data : JSON.stringify(formData),
					success : function(response) {
						console.log(response);
						toastr.success("Data updated successfully");
						setTimeout(function() {
							window.location.href = "${pageContext.request.contextPath}/ComponentLimit.jsp";
						}, 1000);
					},
					error : function(xhr, status, error) {
						console.error("API request error: " + error);
						toastr.error("Failed to update data");
					}
				});
			
			// Prevent the default form submission
			return false;
		}

		function closeForm() {
			// Redirect to ComponentResource.jsp
			window.location.href = "${pageContext.request.contextPath}/ComponentLimit.jsp";
		}

		// Call populateForm with the data you get from the server when the page loads
		// For example, you can fetch the data based on the sl from the URL
		function editCLimit() {
			var sl = getUrlParameter('sl');
			if (sl) {
				$
						.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/api/getbycomponentid/"
									+ sl, // Replace with your actual endpoint
							dataType : "json",
							success : function(data) {
								console.log(data);
								const res = $('#resources');
								const unit = $('#unit');
					            // Clear existing options
					            res.empty();
					            unit.empty();
					 
					            // Add the selected district as the first option
					            res.append('<option value="' + data.resources + '">' + data.resources + '</option>');
					            unit.append('<option value="' + data.unit + '">' + data.unit + '</option>');
								// Populate form fields with the retrieved data
								$('#sl').val(data.sl);
								$('#budgeted_year').val(data.budgeted_year);
						
								$('#approved_rate').val(data.approved_rate);

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

		// Function to get URL parameters
		function getUrlParameter(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
			var results = regex.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}
	</script>
</body>
</html>

