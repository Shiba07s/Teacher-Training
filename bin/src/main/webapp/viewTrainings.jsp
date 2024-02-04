<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>
<body>
	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead>
						<tr>
							<th>Training Ref Id</th>
							<th>Venue</th>
							<th>Resource Type</th>
							<th>Training Mode</th>
							<th>Module</th>
							<th>Training Month</th>
							<th>Training Year</th>
							<th>Training Name</th>
							<th>Description</th>
							<th>Grade</th>
							<th>Agency</th>
							<th>Venue Address</th>
							<th>Map Location</th>
							<th>Coordinator Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>State</th>
							<th>District</th>
							<th>Mandal</th>
							<th>Application Start Date</th>
							<th>Application End Date</th>
							<th>Training Start Date</th>
							<th>Training End Date</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {

			// Execute the function on page load

			fetchDataAndDisplay();

			function fetchDataAndDisplay() {

				$.ajax({

					type : "GET",

					url : "/api/scheduledTrainings",

					dataType : "json",

					success : function(data) {

						displayTrainingData(data);

					},

					error : function(xhr, status, error) {

						console.error("API request error: " + error);

						toastr.error("Failed to fetch training data");

					}

				});

			}

			function displayTrainingData(data) {

				var trainings = data;

				trainings.reverse();

				var tableBody = $("#trainingTable tbody");

				// Clear existing rows

				tableBody.empty();

				for (var i = 0; i < trainings.length; i++) {

					var training = trainings[i];

					var row = $("<tr></tr>");

					row.append("<td>" + training.ref_planner_id + "</td>");

					row.append("<td>" + training.venue_id + "</td>");

					row.append("<td>" + training.resourcetype + "</td>");

					row.append("<td>" + training.tmode + "</td>");

					row.append("<td>" + training.tmodule + "</td>");

					row.append("<td>" + training.tmonth + "</td>");

					row.append("<td>" + training.tyear + "</td>");

					row.append("<td>" + training.tname + "</td>");

					row.append("<td>" + training.tdescription + "</td>");

					row.append("<td>" + training.tgrade + "</td>");

					row.append("<td>" + training.tagency + "</td>");

					row.append("<td>" + training.vaddress + "</td>");

					row.append("<td>" + training.maplocation + "</td>");

					row.append("<td>" + training.coordinatorname + "</td>");

					row.append("<td>" + training.coordinator_email + "</td>");

					row.append("<td>" + training.coordinator_mobile + "</td>");

					row.append("<td>" + training.tstate + "</td>");

					row.append("<td>" + training.tdistrict + "</td>");

					row.append("<td>" + training.tmandal + "</td>");

					row.append("<td>" + training.apply_start_dt + "</td>");

					row.append("<td>" + training.apply_end_dt + "</td>");

					row.append("<td>" + training.training_start_dt + "</td>");

					row.append("<td>" + training.training_end_dt + "</td>");

					tableBody.append(row);

				}

			}

		});

		function fun() {

			document.getElementById("top").reset();

			document.getElementById("middle").reset();

		}

		function alertbox() {

			alert('training scheduled successfully')

		}
	</script>
</body>
</html>