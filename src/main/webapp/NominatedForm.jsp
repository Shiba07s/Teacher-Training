<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TTSS</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="..." crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="..." crossorigin="anonymous" referrerpolicy="no-referrer" />
 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
	
 
 
<!-- Core theme CSS (includes Bootstrap) -->
<link href="css/styles.css" rel="stylesheet" />
<!--    <style type="text/css">
body {
    font-size: 14px; /* Adjust the size as needed */
}
form {
  font-size: 14px;
}
 
.form-control {
  font-size: 14px;
  padding: 5px;
  border: 1px solid #ccc;
}
 
</style> -->
 
 
<style>
/* Remove date format from input */
input[type=date]:required:invalid::-webkit-datetime-edit {
	color: transparent;
	font-size: 15px;
}
 
input[type=date]:focus::-webkit-datetime-edit {
	color: black !important;
	font-size: 15px;
}
 
.custom-card-body {
	background-color: #f8f9fa;
	/* Example background color */
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 350px;
	height: 200px;
	padding: 80px;
	/* Example box shadow */
}
 
.fixed-buttons {
	position: fixed;
	bottom: 20px;
	right: 40%;
	display: flex;
	gap: 10px;
}
 
/* Optional styles for the buttons */
.fixed-buttons button {
	padding: 10px 20px;
}
 
body {
	margin: 0;
	font-family: Arial, sans-serif;
}
 
.maindiv {
	width: 100%;
	padding: 20px;
	display: flex;
	justify-content: space-between;
}
 
.content {
	background-color: #fff;
	border: 1px solid;
	overflow-x: auto;
	font-size: 10px;
	width: 100%;
	/* Add horizontal scroll if needed */
}
 
.formheading {
	display: flex;
	justify-content: center;
	background-image: linear-gradient(to top, #0077BD, #8AC6D1);
	color: white;
	padding: 10px;
	/* Add padding to the form heading */
}
 
.maindiv2 {
	width: 100%;
	padding: 20px;
	display: flex;
	justify-content: space-between;
}
 
.table-container {
	overflow-x: auto;
	/* Add horizontal scroll if needed */
}
 
table {
	border-collapse: collapse;
}
 
td, th {
	border: 1px solid black;
	text-align: left;
	padding: 5px;
}
 
tr:nth-child(even) {
	background-color: #dddddd;
}
 
@media ( max-width : 768px) {
	/* Adjust styles for smaller screens */
	.formheading {
		font-size: 18px;
		/* Adjust font size */
	}
	.table-container {
		overflow-x: auto;
	}
	table {
		font-size: 14px;
		/* Adjust font size */
	}
	td, th {
		padding: 6px;
		/* Adjust padding */
	}
	<
	style>.row {
		display: flex;
		justify-content: space-between;
		margin-bottom: 20px; /* Adjust the margin as needed */
	}
	.form-group {
		margin-bottom: 15px; /* Adjust the margin as needed */
	}
	label {
		display: block;
		font-weight: bold;
		margin-bottom: 5px; /* Adjust the margin as needed */
	}
	select.form-control {
		width: 100%;
		padding: 10px;
		font-size: 14px; /* Adjust the font size as needed */
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}
	.fixed-buttons {
	position: fixed;
	bottom: 20px;
	right: 40%;
	display: flex;
	gap: 10px;
}
 
/* Optional styles for the buttons */
.fixed-buttons button {
	padding: 10px 20px;
}
}
</style>
 
 
 
</head>
<body>
	<div class="row">
		<div class="form-group col-md-3">
			<div class="form-group" id="venueName">
				<label for="venue">District Name:</label> <select
					id="districtDropdown" class="form-control" placeholder="select District..." required></select>
			</div>
		</div>
		<div class="form-group col-md-3">
			<div class="form-group" id="resourceType">
				<label for="resource">Mandal Name:</label> <select
					id="mandalDropdown" class="form-control" required></select>
			</div>
		</div>
		<div class="form-group col-md-3" style="margin-top: 20px;">
			<button class="btn btn-primary" id="searchButton"
				onclick="performSearch()" style="font-size: 14px;">Search</button>
		</div>
		<div class="form-group col-md-3" style="margin-top: 20px">
			<input type=" text" class="form-control" placeholder="Search Treasury ID..." id="searchBar" />
		</div>
	</div>
	<div class="fixed-buttons">
<!-- 	<button class="btn btn-success" id="approveButton">NOMINATED</button> -->
	
		<button class="btn btn-success" id="approveButton" onclick="approveTraining();">NOMINATED</button>
			
		
	</div>
	<div class="content">
		<div class="formheading">
			<h1 class="h2">Nominate Trainee Form</h1>
		</div>
		<div class="table-container">
			<div class="table-responsive">
				<table id="admintid" class="table">
					<thead>
						<tr>
							<th>SL NO</th>
							<th>Action</th>
							<th style="display: none;">AppliedType</th>
							<th>RefPlannerId</th>
							<th style="display: none;"> Venue Id</th>
							<th>Treasury Id</th>
							<th>Mobile No</th>
							<th>Teacher Name</th>
							<th>Designation</th>
							<th>DOB</th>
							<th>District</th>
							<th>School Name</th>
							<th>School Udise</th>
							<th>Previous Training</th>
						</tr>
					</thead>
					<tbody>
						<!-- Data will be populated dynamically here -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Add this script at the end of your HTML body -->
<script>
  
 
        // Flags to check if dropdowns are already populated
        var districtDropdownPopulated = false;
        var mandalDropdownPopulated = false;
 
        // Variables to store fetched data
        var districtData;
        var mandalData;
 
        // Function to fetch districts
        function fetchDistricts() {
            // Fetch districts only if not already populated
            if (!districtDropdownPopulated) {
                $.ajax({
                    url: '/api/search/districts',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        const districtDropdown = $('#districtDropdown');
                        districtDropdown.append('<option value="" selected disabled>Select District</option>');

 
                        // Populate the district dropdown
                        data.forEach(district => {
                            const option = $('<option></option>');
                            option.val(district);
                            option.text(district);
                            districtDropdown.append(option);
                        });
 
                        // Update flags and data variables
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
        url: '/api/mandalsa?district=' + selectedDistrict,
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            const mandalDropdown = $('#mandalDropdown');
            console.log(data);

            // Clear existing options
            mandalDropdown.html('<option value="" selected disabled>Select Mandal</option>');

            // Populate the mandal dropdown
            data.forEach(mandal => {
                const option = $('<option></option>');
                option.val(mandal);
                option.text(mandal);
                mandalDropdown.append(option);
            });

            // Update data variable
            mandalData = data;
        },
        error: function (error) {
            console.error('Error fetching mandal data:', error);
        }
    });
}
        // Function to perform search
        function performSearch() {
            // Get selected district and mandal
            const selectedDistrict = $('#districtDropdown').val();
            const selectedMandal = $('#mandalDropdown').val();
 
            // Log selected values to the console
            console.log('Selected District:', selectedDistrict);
            console.log('Selected Mandal:', selectedMandal);
 
            // Fetch districts and mandals if not already populated
            fetchDistricts();
            fetchMandals(selectedDistrict);
            var refPlannerId = getParameterByName("ref_planner_id");
//             var refPlannerId = getParameterByName("venue_id");
//             var refPlannerId = getParameterByName("tname");
//             var refPlannerId = getParameterByName("venue_name");
//             var refPlannerId = getParameterByName("vaddress");
//             var refPlannerId = getParameterByName("tmode");
//             var refPlannerId = getParameterByName("tmonth");
//             var refPlannerId = getParameterByName("tyear");
//             var refPlannerId = getParameterByName("training_start_dt");
//             var refPlannerId = getParameterByName("training_end_dt");
//             var tstarttime = getParameterByName("tstarttime");
//             var tendtime = getParameterByName("tendtime");
//             var coordinatormobileno = getParameterByName("coordinatormobileno");
//             var refPlannerId = getParameterByName("maplocation");
//             var refPlannerId = getParameterByName("tdescription");
           
            
 
 
            // Perform AJAX request to fetch search results
            $.ajax({
                url: '/api/details',
                type: 'GET',
                data: {
                    district: selectedDistrict,
                    mandal: selectedMandal,
                    refPlannerId: refPlannerId // Replace with your refPlannerId
                },
                dataType: 'json',
                success: function (data) {
                    // Process the search results
//                     console.log('Search Results:', data);
 
                    // Update the table with search results
                    displayTrainingData(data);
                },
                error: function (error) {
                    console.error('Error performing search:', error);
                    // Handle errors, e.g., display an error message to the user
                }
            });
        }
 
        // Function to update the table with search results
function displayTrainingData(data) {
    var tableBody = $("#admintid tbody");
 
    // Clear existing rows
    tableBody.empty();
 
    // Get the planner ID from the URL
    var refPlannerId = getParameterByName("refPlannerId");
   // console.log(refPlannerId);
 
 
    for (var i = 0; i < data.length; i++) {
        var training = data[i];
        var row = $("<tr></tr>");
        var serialNumberCell = $("<td></td>").text(i + 1);
        row.append(serialNumberCell);
 
        // Populate the row with data from the 'training' object
        row.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + training.TreasuryId + '" data-refplannerid="' + training.refPlannerId + '"></td>');
        row.append("<td style='display:none;'>" + "Nominated" + "</td>");
        row.append("<td>" + getParameterByName("ref_planner_id") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("venue_id") + "</td>");

        row.append("<td>" + training.treasuryid + "</td>");
        row.append("<td>" + training.mobilenumberteacher + "</td>");
        row.append("<td>" + training.teacher_name + "</td>");
        row.append("<td>" + training.designation + "</td>");
        row.append("<td>" + training.dob + "</td>");
        row.append("<td>" + training.districtnamewrk + "</td>");
        row.append("<td>" + training.school_name + "</td>");
        row.append("<td>" + training.schcd + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("venue_name") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("vaddress") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("training_start_dt") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("training_end_dt") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tname") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tmode") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tstarttime") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tendtime") + "</td>");

        row.append("<td style='display: none;'>" + getParameterByName("coordinatormobileno") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("coordinatorname") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("coordinatoremailid") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("maplocation") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tdescription") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("tagency") + "</td>");
        row.append("<td style='display: none;'>" + getParameterByName("resourcetype") + "</td>");

        // Add a button with a link to the next page, passing the treasury ID and planner ID in the URL
        var button = $('<button class="btn btn-primary">Previous Trainings</button>');
        button.click(function () {
            window.location.href = "/TrainingInformation.jsp?treasuryId=" + training.TreasuryId + "&refPlannerId=" + refPlannerId;
        });
 
        var buttonCell = $("<td></td>").append(button);
        row.append(buttonCell);
 
        // Add a checkbox in the "Action" column
        tableBody.append(row);
    }
}
 
        
     // Function to get URL parameter by name
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, '\\$&');
            const regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
 
        // Rest of your script...
 
 
        // Fetch districts on page load
        fetchDistricts();
 
        // Event listener for changes in the district dropdown
       // Event listener for changes in the district dropdown
$('#districtDropdown').change(function () {
    const selectedDistrict = $(this).val();
    console.log(selectedDistrict);

    // Fetch mandals every time the district selection changes
    fetchMandals(selectedDistrict);
});

        
        function approveTraining() {
        	
            // Array to store selected row data
            var selectedRowsData = [];
 
            // Iterate over the checkboxes and collect data from selected rows
            $('.approveCheckbox:checked').each(function () {
                var rowData = {
                   
                		appliedtype: $(this).closest('tr').find('td:eq(2)').text(), // Assuming Treasury Id is in the second column
                		ref_planner_id: $(this).closest('tr').find('td:eq(3)').text(), // Assuming Treasury Id is in the second column
                		venue_id: $(this).closest('tr').find('td:eq(4)').text(), // Assuming Treasury Id is in the second column
                	treasuryid: $(this).closest('tr').find('td:eq(5)').text(), // Assuming Treasury Id is in the second column
                    
                	mobilenumberteacher: $(this).closest('tr').find('td:eq(6)').text(),
                    teacher_name: $(this).closest('tr').find('td:eq(7)').text(),
                    designation: $(this).closest('tr').find('td:eq(8)').text(),
                    dob: $(this).closest('tr').find('td:eq(9)').text(),
                    district_name: $(this).closest('tr').find('td:eq(10)').text(),
                    school_name: $(this).closest('tr').find('td:eq(11)').text(),
                    school_code: $(this).closest('tr').find('td:eq(12)').text(),
                    
                    
                    
                    venue_name: $(this).closest('tr').find('td:eq(13)').text(),
                    vaddress: $(this).closest('tr').find('td:eq(14)').text(),
                    training_start_dt: $(this).closest('tr').find('td:eq(15)').text(),
                    training_end_dt: $(this).closest('tr').find('td:eq(16)').text(),
                    tname: $(this).closest('tr').find('td:eq(17)').text(),
                   
                    tmode: $(this).closest('tr').find('td:eq(18)').text(),
                    tstarttime: $(this).closest('tr').find('td:eq(19)').text(),
                    tendtime: $(this).closest('tr').find('td:eq(20)').text(),
                  
                    /* coordinatorname: $(this).closest('tr').find('td:eq(21)').text(),
                    coordinatoremailid: $(this).closest('tr').find('td:eq(22)').text(), */
//                     coordinatormobileno: $(this).closest('tr').find('td:eq(21)').text(),
                    
                     coordinatormobileno:
    $(this).closest('tr').find('td:eq(21)').text() + ' , ' +
    $(this).closest('tr').find('td:eq(22)').text() + ' , ' +
    $(this).closest('tr').find('td:eq(23)').text(),

                    maplocation: $(this).closest('tr').find('td:eq(24)').text(),
                    tdescription: $(this).closest('tr').find('td:eq(25)').text(),
                    tagency: $(this).closest('tr').find('td:eq(26)').text(),
                    resourcetype: $(this).closest('tr').find('td:eq(27)').text(),
                    previousTraining: $(this).closest('tr').find('td:eq(28)').text()
                    // Add other properties as needed
                };
 
                selectedRowsData.push(rowData);
            });
 
            // Check if any checkboxes are selected
            if (selectedRowsData.length > 0) {
                // Get refPlannerId from the URL
                var refPlannerId = getParameterByName("refPlannerId");
 
                // Make an AJAX request to store the data in the database
                $.ajax({
                    type: "POST",
                    url: "/api/localData",
                    contentType: "application/json",
                    data: JSON.stringify(selectedRowsData),
                    dataType: "json",
                    success: function (response) {
                        if (response && response.success) {
                            // Handle success response
                            alert('Data stored successfully!');
                        } else {
                            // Handle unexpected response format
                            alert('Unexpected response format. Please try again.');
                        }
                    },
                    error: function (xhr, status, error) {
                        // Log the details to the console for debugging
                        console.log("Status code:", xhr.status);
                        console.log("Actual response:", xhr.responseText);

                        // Handle error response
                        alert('storing data: ' + xhr.responseText);
                        window.location.href="/dashboard.jsp";
                    }
                });
            } else {
                // Show an alert message indicating that no checkboxes are selected
                alert('Please select at least one checkbox.');
            }
        }
    </script>
    <script>
		$(document).ready(function() {
			// Handle input events on the search bar
			$("#searchBar").on("input", function() {
				var searchText = $(this).val().toLowerCase();
				filterTableRows(searchText);
			});
		});

		// Function to filter table rows based on search text
		function filterTableRows(searchText) {
			$("#admintid tbody tr").filter(
					function() {
						var treasuryid = $(this).find("td:eq(4)").text()
								.toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(treasuryid.indexOf(searchText) > -1);
					});
		}
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>