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
 
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous">
 
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
    <!-- Toastr CSS/JS -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
 
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
 
			padding: 20px;
 
		}
 
		.content {
 
			background-color: #fff;
 
			border: 1px solid;
 
			overflow-x: auto;
 
			font-size: 10px;
 
			width: 185%;
 
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
		.table-container {
 
			overflow-x: auto;
 
			/* Add horizontal scroll if needed */
 
		}
 
 
 
		table {
 
			border-collapse: collapse;
 
		}
 
 
 
		td,
 
		th {
 
			border: 1px solid black;
 
			text-align: left;
			padding: 5px;
		}
		tr:nth-child(even) {
 
			background-color: #dddddd;
		}
		@media (max-width: 768px) {
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
			td,
			th {
				padding: 6px;
				/* Adjust padding */
			}
			.toast-big {
				width: 350px;
				font-size: 16px;
				padding: 20px;
			}
	</style>
 
	<style>
		.modal {
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
		}
		.close {
			color: red;
			float: right;
			font-size: 28px;
			font-weight: bold;
			cursor: pointer;
		}
		.close:hover,
		.close:focus {
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
		}
		#new {
			display: flex;
			justify-content: flex-end;
			padding: 10px;
			margin-top: 10px;
		}
		}
	</style>
   <style>
        .top-buttons {
            position: absolute;
            top: 10px;
            right: 20px;
            display: flex;
        }
 
        .top-buttons button {
            margin-left: 10px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0077BD;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<div id="page-content-wrapper">
		<script>
		   $(document).ready(function () {
               $.ajax({
                   type: "GET",
                   url: "/TTSS03/api/approved-data",
                   dataType: "json",
                   success: function (data) {
                       displayTrainingData(data);
                   },
                   error: function (xhr, status, error) {
                       console.error("API request error: " + error);
                   }
               });
 
               function displayTrainingData(data) {
                   var tableBody = $("#AdminId tbody");
                   tableBody.empty();
                   for (var i = 0; i < data.length; i++) {
                       var trainings = data[i];
                       var row = $("<tr></tr>");
                       row.append("<td class='serial-column'>" + (i + 1) + "</td>");
                      // row.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + trainings.TreasuryId + '" data-trainingname="' + trainings.TrainingName + '"></td>');
						row.append("<td>" + trainings.treasuryid + "</td>");
						row.append("<td>" + trainings.ref_planner_id + "</td>");
						row.append("<td>" + trainings.venue_id + "</td>");
						row.append("<td>" + trainings.mobileno_teacher + "</td>");
						row.append("<td>" + trainings.teacher_name + "</td>");
						row.append("<td>" + trainings.design + "</td>");
 
						var dobParts = (trainings.dob && trainings.dob.split("-")) || [];
						var dob = dobParts.length === 3 ? new Date(dobParts[2], dobParts[1] - 1, dobParts[0]) : null;
 
						// Check if dob is not null before using it
						if (dob !== null) {
						    // Calculate age based on DOB
						    var today = new Date();
						    var age = today.getFullYear() - dob.getFullYear();
						    // Adjust age if birthday hasn't occurred yet this year
						    if (today.getMonth() < dob.getMonth() ||
						        (today.getMonth() === dob.getMonth() && today.getDate() < dob.getDate())) {
						        age--;
						    }
						    row.append("<td>" + age + " years</td>");
						} else {
						    // Handle the case where dob is null (e.g., display an alternative value)
						    row.append("<td>N/A</td>");
						}
						row.append("<td>" + trainings.resourcetype + "</td>");
						row.append("<td>" + trainings.district_name + "</td>");
						row.append("<td>" + trainings.school_code + "</td>");
						row.append("<td>" + trainings.tname + "</td>");
						row.append("<td>" + trainings.tmode + "</td>");
						row.append("<td>" + trainings.tdescription + "</td>");
						row.append("<td>" + trainings.venue_name + ','+"<br>"+trainings.vaddress + "</td>");						 var appliedDateTime = new Date(trainings.applydateandtime);
					        if (!isNaN(appliedDateTime.getTime())) {
					            // Create a human-readable timestamp
					            var options = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZoneName: 'short' };
					            var formattedDateTime = new Intl.DateTimeFormat('en-US', options).format(appliedDateTime);
					            row.append("<td>" + formattedDateTime + "</td>");
					        } else {
					            // Handle the case where applydateandtime is not a valid date string
					            row.append("<td>Invalid Date</td>");
					        }
 
						row.append("<td>" + trainings.appliedtype + "</td>");
						row.append("<td>" + trainings.remarks + "</td>");
 
						  tableBody.append(row);
                   }
 
                   // Your existing DataTable initialization code
                   var dataTable = $('#AdminId').DataTable({
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
 
 
                   $('.dt-buttons').addClass('btn-group').css('font-size', '14px');
                   $('.buttons-excel, .buttons-pdf').addClass('btn btn-primary btn-blue').css('width', '100px');
                   $('.btn-blue').css('background-color', '#63f542');
               }
           });
       </script>
		<div class="maindiv">
			<div class="content">
				<div class="formheading">
					<h1 class="h2">Approved Training</h1>
				</div>
				<div class="table-container">
					<table id="AdminId">
						<thead>
							<tr>
								<th>Sl No</th>
<!-- 								<th>Action</th> -->
								<th>Treasury Id</th>
								<th>Ref Planner Id</th>
								<th>Venue Id</th>
								<th>Mobile No</th>
								<th>Teacher Name</th>
								<th>Designation</th>
								<th>Age</th>
								<th>Resource Type</th>
								<th>District</th>
								<th>School Udise</th>
								<th>Training Name</th>
								<th>Training Mode</th>
								<th>Training Description</th>
								<th>Venue details</th>
								<th>Apply Date</th>
								<th>Apply Type</th>
								<th>Remark</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JS-->
 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
 
		<script src="js/scripts.js"></script>
</body>
 
</html>