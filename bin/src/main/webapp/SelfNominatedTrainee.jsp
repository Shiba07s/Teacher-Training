<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TTSS</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
<!-- Add this script tag after including Toastr CSS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	
 
  
      <!-- DataTables CSS/JS -->
<!--     <link rel="stylesheet" type="text/css" -->
<!--         href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"> -->
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
    <script type="text/javascript"
        src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
 
    <!-- DataTables Buttons CSS/JS -->
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
    <script type="text/javascript"
        src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.print.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
 
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="css/styles.css" rel="stylesheet" />
 
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 
    <!-- Your Custom Styles -->
    <link href="css/styles.css" rel="stylesheet" />
    
</head>
 
 
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
	/* 	background-image: linear-gradient(to top, #0077BD, #8AC6D1); */
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
}
</style>
<style>
<
style>.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
	font-size: 12px;
}
 
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	font-size: 14px;
}
 
.close {
	color: red;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}
 
.close:hover, .close:focus {
	color: rgb(233, 15, 15);
	text-decoration: none;
}
 
textarea {
	width: 100%;
}
 
.btn {
	padding: 10px;
	margin-top: 10px;
	margin-right: 5px;
	font-size: 14px;
}
 
#new {
	display: flex;
	justify-content: flex-end;
	padding: 10px;
	margin-top: 10px;
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
<style>
.table-container {
	margin-top: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
}
 
.table-responsive {
	overflow-x: auto;
}
 
#admintid {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 0;
}
 
#admintid th, #admintid td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
 
#admintid th {
	background-color: #007bff;
	color: #fff;
}
 
#admintid tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}
 
#admintid tbody tr:hover {
	background-color: #ddd;
}
 
#selfButton {
	font-size: 16px;
	margin-left: 40%;
}
 
#selfButton label {
	margin-right: 10px;
	/* Optional: Adjust spacing between radio buttons and labels */
}
</style>
</head>
 
<body>
<script>
jQuery(document).ready(function($) {
    // Add a click event listener to the "Self" button
    $("#selfRadio").click(function () {
        var apiEndpoint = "/TTSS03/api/self-attended";
        fetchDataAndDownload(apiEndpoint, "SelfData");
        window.location.href = "/TTSS03/Admin_approval.jsp";
    });
 
    // Add a click event listener to the "Nominate" button
    $("#nominateRadio").click(function () {
        var apiEndpoint = "/TTSS03/api/nominate/training";
        fetchDataAndDownload(apiEndpoint, "NominateData");
       
    });
 
    // Trigger the click event for the "Self" button on page load
    $("#nominateRadio").trigger("click");
 
    function fetchDataAndDownload(apiEndpoint, spreadsheetName) {
        // Make an AJAX request to the selected endpoint
        $.ajax({
            type: "GET",
            url: apiEndpoint,
            dataType: "json",
            success: function (response) {
                // Display the response on the console
                console.log("API response:", response);
                // Display training data in the table
                displayTrainingData(response);
                 
            },
            error: function (xhr, status, error) {
                console.error("API request error: " + error);
            }
        });
    }
 
							function displayTrainingData(data) {
								var tableBody = $("#admintid tbody");
 
								// Clear existing rows
								tableBody.empty();
 
								for (var i = 0; i < data.length; i++) {
									var training = data[i];
									var row = $("<tr></tr>");
									row.append("<td class='serial-column'>"
											+ (i + 1) + "</td>");
									// Populate the row with data from the 'training' object
									row
											.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + training.treasuryid + '" data-ref_planner_id="' + training.ref_planner_id + '"></td>');
									row.append("<td>" + training.treasuryid
											+ "</td>");
									row.append("<td>" + training.ref_planner_id
											+ "</td>");
 
									row.append("<td>" + training.mobilenumberteacher
											+ "</td>");
 
									row.append("<td>" + training.teacher_name
											+ "</td>");
									row.append("<td>" + training.designation
											+ "</td>");
 
									// Parse DOB string to create a Date object
									var dobParts = training.dob.split("-");
									var dob = new Date(dobParts[2],
											dobParts[1] - 1, dobParts[0]);
 
									// Calculate age based on DOB
									var today = new Date();
									var age = today.getFullYear()
											- dob.getFullYear();
 
									// Adjust age if birthday hasn't occurred yet this year
									if (today.getMonth() < dob.getMonth()
											|| (today.getMonth() === dob
													.getMonth() && today
													.getDate() < dob.getDate())) {
										age--;
									}
 
									row.append("<td>" + age + " years</td>");
									row.append("<td>" + training.resourcetype
											+ "</td>");
									row.append("<td>" + training.district_name
											+ "</td>");
									row.append("<td>"
											+ training.school_code
											+ "</td>");
									row.append("<td>" + training.tname
											+ "</td>");
									row.append("<td>" + training.tmode
											+ "</td>");
									row.append("<td>" + training.tdescription
											+ "</td>");
									row.append("<td>" +training.venue_name + "," +"<br>" +training.vaddress + "</td>");

									   var appliedDateTime = new Date(training.applydateandtime);
								        if (!isNaN(appliedDateTime.getTime())) {
								            // Create a human-readable timestamp
								            var options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZoneName: 'short' };
								            var formattedDateTime = new Intl.DateTimeFormat('en-US', options).format(appliedDateTime);
								            row.append("<td>" + formattedDateTime + "</td>");
								        } else {
								            // Handle the case where Applydate is not a valid date string
								            row.append("<td>Invalid Date</td>");
								        }
 
// 									row.append("<td>" + training.trainingBefore
// 											+ "</td>");
// 									row.append("<td>" + training.remarks
// 											+ "</td>");
 
									// Add a button with a link to the next page, passing the treasury ID in the URL
									var button = $('<button class="btn btn-primary">Previous Trainings</button>');
									button
											.click(function() {
												window.location.href = "/TTSS03/TrainingInformation.jsp?treasuryId="
														+ training.TreasuryId;
											});
									var buttonCell = $("<td></td>").append(
											button);
									row.append(buttonCell);
									// Add a checkbox in the "Action" column
									tableBody.append(row);
								}
						         var dataTableReject = $('#admintid').DataTable({
						        	 retrieve:true,
							            dom: 'Bfrtip',
							            buttons: [
							                {
							                    extend: 'pdfHtml5',
							                    orientation: 'landscape', // or 'portrait'
							                    pageSize: 'A3', // or 'A4', 'A3', etc.
							                },
							                 'excel'
							            ]
							        });
 
 
							                   // Optional: Add some styling to the buttons
							                   $('.dt-buttons').addClass('btn-group').css('font-size', '14px');
							                   $('.buttons-excel, .buttons-pdf').addClass('btn btn-primary btn-blue').css('width', '100px');
							                   $('.btn-blue').css('background-color', '#63f542');
							               }
							           });
	//	#################### Approved button script ########################
 
		function approveTraining() {
			toastr.options = {
				"positionClass" : "toast-top-right",
				"showDuration" : "300",
				"hideDuration" : "1000",
				"timeOut" : "5000",
				"extendedTimeOut" : "1000",
			};
			var selectedCheckboxes = $('.approveCheckbox:checked');
 
			if (selectedCheckboxes.length > 0) {
				selectedCheckboxes.each(function() {
					var treasuryId = $(this).attr('data-treasuryid');
					var refPlannerId = $(this).attr('data-ref_planner_id');
					console.log(refPlannerId);
 
					$.ajax({
						type : 'PUT',
						url : '/TTSS03/api/update-status',
						data : {
							treasuryId : treasuryId,
							refPlannerId : refPlannerId
						},
						success : function(response) {
							console.log('Status updated successfully:',
									response);
							toastr.success('Approved Training successfully');
 
							setTimeout(function() {
								window.location.href = '/TTSS03/Admin_approval.jsp'; // Replace with your target page
							}, 1000);
						},
						error : function(error) {
							console.error('Error updating status:', error);
							toastr.error('Error for training status');
 
						}
					});
				});
			} else {
				console.log('No checkbox selected');
				toastr.warning('Please select a training to update status');
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
						var trainingName = $(this).find("td:eq(11)").text()
								.toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(trainingName.indexOf(searchText) > -1);
					});
		}
	</script>
	<script>
		$(document).ready(
				function() {
					// Handle input events on the search bar
					$("#searchBar1").on("input", function() {
						var searchText = $(this).val().toLowerCase();
						filterTableRows(searchText);
					});
 
					// Function to filter table rows based on search text
					function filterTableRows(searchText) {
						$("#admintid tbody tr").filter(
								function() {
									var District = $(this).find("td:eq(9)")
											.text().toLowerCase(); // Index 1 is the "Training Name" column
									$(this).toggle(
											District.indexOf(searchText) > -1);
								});
					}
 
					// Add event listener to the download button
					// 		$("#downloadButton").on("click", function() {
					// 			downloadTableToExcel();
					// 		});
 
					// Function to download table data to Excel
					// 		function downloadTableToExcel() {
					// 			// Create a workbook with one empty sheet
					// 			var wb = XLSX.utils.book_new();
					// 			var ws = XLSX.utils.table_to_sheet(document.getElementById("admintid"));
					// 			XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
 
					// 			// Save the workbook as an Excel file
					// 			XLSX.writeFile(wb, "table_data.xlsx");
					// 		}
				});
	</script>
</head>
 
<body>
 
	<div class="maindiv">
		<div class="maindiv2">
			<input type=" text" class="form-control"
				placeholder="Search Training Name..." id="searchBar" />
		</div>
		<div class="maindiv2">
			<input type="text" class="form-control"
				placeholder="Search District Name..." id="searchBar1" />
		</div>
 
	</div>
 
 
	<div id="selfButton" style="margin-top: -20px;">
		<input type="radio" id="selfRadio" name="attendType" value="self"
			 > <label for="selfRadio">Self</label>
			 <input type="radio" id="nominateRadio" name="attendType" value="nominate" checked>
		<label for="nominateRadio">Nominate</label>
	</div>
 
	<div class="formheading">
		<!-- 			<h1 class="h2">Training Approval</h1> -->
 
	</div>
	<div class="table-container" style="margin-top: -10px;">
		<div class="table-responsive">
			<table id="admintid" class="table">
				<thead>
					<tr>
						<th>Sl no</th>
						<th>Action</th>
						<th>Treasury Id</th>
						<th>Planner Id</th>
						<th>Mobile No</th>
						<th>Teacher Name</th>
						<th>Designation</th>
						<th>Age as per the DOB</th>
						<th>Resource Type</th>
						<th>District</th>
						<th>School Udise</th>
						<th>Training Name</th>
						<th>Training Mode</th>
						<th>Training Description</th>
						<th>Venue details</th>
						<th>Apply Date</th>
<!-- 						<th>Have you attended any training before</th> -->
<!-- 						<th>Remark</th> -->
						<th>Previous Training</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="fixed-buttons">
    <button class="btn btn-success" id="approveButton" onclick="approveTraining()">Approve</button>
    <button class="btn btn-danger" id="cancelButton" onclick="showRejectModal()">Reject</button>
</div>
 
<div id="rejectModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeRejectModal()">&times;</span>
        <label for="rejectReason">Reason for Rejection:</label>
        <textarea id="rejectReason" name="rejectReason" rows="4" cols="50" required></textarea>
        <br>
        <div id="new">
            <button class="btn btn-danger" onclick="cancelReject()">Cancel</button>
            <button id="submitRejectButton" class="btn btn-danger" style="width:100px;" onclick="submitFormWithValidation()">Submit</button>
        </div>
    </div>
</div>
 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 
<!-- Your existing script -->
<script>
    toastr.options = {
        "positionClass" : "toast-top-right",
        "showDuration" : "300",
        "hideDuration" : "1000",
        "timeOut" : "5000",
        "extendedTimeOut" : "1000",
    };
 
    function showRejectModal() {
        var selectedCheckboxes = $('.approveCheckbox:checked');
 
        if (selectedCheckboxes.length > 0) {
            var selectedCheckbox = selectedCheckboxes.first();
            var treasuryId = selectedCheckbox.attr('data-treasuryid');
            var refPlannerIds = selectedCheckbox.attr('data-ref_planner_id');
 
            // Set the selected details in the modal
            $('#rejectReason').val('');
            $('#rejectModal').attr('data-treasuryid', treasuryId);
            $('#rejectModal').attr('data-ref_planner_id', refPlannerIds);
 
            document.getElementById('rejectModal').style.display = 'block';
        } else {
            console.log('No checkbox selected');
            toastr.warning('Please Select A Checkbox');
        }
    }
 
    function closeRejectModal() {
        document.getElementById('rejectModal').style.display = 'none';
    }
 
    function cancelReject() {
        closeRejectModal();
    }
 
    function submitFormWithValidation() {
        var treasuryId = $('#rejectModal').attr('data-treasuryid');
        var refPlannerIds = $('#rejectModal').attr('data-ref_planner_id');
        var remarks = $('#rejectReason').val();
 
        $.ajax({
            type: 'PUT',
            url: '/TTSS03/api/remarks',
            data: {
                treasuryId: treasuryId,
                refPlannerIds: refPlannerIds,
                remarks: remarks
            },
            success: function(response) {
                console.log('Training Rejected Successfully:', response);
                toastr.success('Training Rejected Successfully');
 
                closeRejectModal();
 
                setTimeout(function() {
                    window.location.href = '/TTSS03/Admin_approval.jsp';
                }, 1000);
            },
            error: function(error) {
                console.error('Error For Training Rejected:', error);
                toastr.error('Error For Training Rejected');
            }
        });
    }
    </script>
 
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
 
</html>