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
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<!-- Custom Styles -->


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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />



<style>
.serial-column {
	font-weight: bold;
}

.table thead th {
	background-color: #007bff;
	color: #fff;
	font-weight: bold;
	border-color: #007bff;
}

.table tbody td {
	border-color: #007bff;
}

.table tbody tr:hover {
	background-color: #f1f1f1;
}
</style>

</head>
<body>
	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead>
						<tr>
							<th>Sl no</th>
							<th>Training Ref Id</th>
							<th>Venue</th>
							<th>Resource Type</th>
							<th>Training Mode</th>
							<th class="module-column">Module</th>
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
							<th>Action</th>
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
		});

		function fetchDataAndDisplay() {

			$.ajax({

				type : "GET",
				url : "${pageContext.request.contextPath}/api/scheduledTrainings1",
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
				row.append("<td class='serial-column'>" + (i + 1) + "</td>");

				row.append("<td>" + training.ref_planner_id + "</td>");

				row.append("<td>" + training.venue_id + "</td>");

				row.append("<td>" + training.resourcetype + "</td>");

				row.append("<td>" + training.tmode + "</td>");

				row.append("<td class='module-column'>" + training.tmodule
						+ "</td>");

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

				row
						.append("<td><div class='col'><button class='btn btn-primary btn-lg btn-block' onclick='editTraining("
								+ training.ref_planner_id
								+ ","
								+ training.venue_id
								+ ")'>Edit</button></div>&nbsp;<div class='col'><button class='btn btn-danger btn-lg btn-block' onclick='deleteTraining(this,"
								+ training.ref_planner_id
								+ ","
								+ training.venue_id
								+ ")'>Delete</button></div></td>");

				tableBody.append(row);

			}
			// Your existing DataTable initialization code
			var dataTable = $('#trainingTable').DataTable({
				dom : 'Bfrtip',
				buttons : [ {
					extend : 'pdfHtml5',
					orientation : 'landscape', // or 'portrait'
					pageSize : 'A3', // or 'A4', 'A3', etc. 
				}, 'excel' ]

			});

			$('.dt-buttons').addClass('btn-group').css('font-size', '14px');
			$('.buttons-excel, .buttons-pdf').addClass(
					'btn btn-primary btn-blue').css('width', '100px');
			$('.btn-blue').css('background-color', '#63f542');
		}

		// Sample function for edit
		function editTraining(tid, vid) {
			var isConfirmed = confirm("Are you sure you want to edit this training?");

			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
				//console.log(tid,vid);
				// Assuming you have an EditTraining.jsp page to handle editing
				var editUrl = "${pageContext.request.contextPath}/EditViewTrainings.jsp?tid=" + tid + "&vid="
						+ vid; // Redirect to the EditTraining.jsp page with the query string parameters
				window.location.href = editUrl;
			} else
				return;
		}

		function fun() {

			document.getElementById("top").reset();

			document.getElementById("middle").reset();

		}

		function alertbox() {

			alert('training scheduled successfully')

		}

		function deleteTraining(button, tid, vid) {
			var isConfirmed = confirm("Are you sure you want to delete this training?");

			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
				var row = $(button).closest('tr');
				// Make an AJAX request to the delete endpoint

				$.ajax({
					type : "Delete",
					url : "${pageContext.request.contextPath}/api/deleteScheduledTraining/" + tid + "/" + vid,
					success : function(response) {
						var table = $('#trainingTable').DataTable();
						table.row(row).remove().draw(false);
						toastr.success("venue deleted successfully");
						// Reload or update the data after deletion
						fetchDataAndDisplay();
					},
					error : function(xhr, status, error) {
						toastr.error("Failed to delete Venue: " + error);
					}
				});
			}else return;
		}
	</script>


</body>
</html>