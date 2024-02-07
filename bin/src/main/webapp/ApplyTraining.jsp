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
<style>
.container {
	width: 180%;
	font-size: 14px;
}
#tab2 {
	display: none;
}
 .table{
    height: "5  0px"
 }
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div class="container tab-content" id="tab2">
		<div class="mt-1">
			<b></b>
		</div>
		<table class="table table-hover" id="trainingTable">
			<tbody></tbody>
		</table>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							fetchDataAndDisplay();

							function fetchDataAndDisplay() {
								$.ajax({
									type : "GET",
									url : "/api/scheduledTrainings",
									dataType : "json",
									success : function(data) {
										displayTrainingData(data);
										$("#tab2").css("display", "block");
									},
									error : function(xhr, status, error) {
										console.error("API request error: "
												+ error);
									}
								});
							}

							function displayTrainingData(data) {
								var trainings = data;
								trainings.reverse();

								var table = document
										.getElementById("trainingTable");

								table.innerHTML = "<tr><th>Reference Id</th><th>Training Name</th><th>Training Mode</th><th>Description</th><th>Application start to end</th><th>Training start to end</th><th>Venue Id</th><th>venue Address</th><th>Map Location</th><th>Co-ordinater Details</th><th>Resource Type</th><th>Action</th></tr>";

								for (var i = 0; i < trainings.length; i++) {
									var training = trainings[i];
									var row = table.insertRow(i + 1);

									row.insertCell(0).innerHTML = training.ref_planner_id;
									row.insertCell(1).innerHTML = training.tname;
									row.insertCell(2).innerHTML = training.tmode;
									row.insertCell(3).innerHTML = training.tdescription;
									row.insertCell(4).innerHTML = training.apply_start_dt
											+ "to" + training.apply_end_dt;
									row.insertCell(5).innerHTML = training.training_start_dt
											+ "to" + training.training_end_dt;
									row.insertCell(6).innerHTML = training.venue_id;
									row.insertCell(7).innerHTML = training.vaddress;
									row.insertCell(8).innerHTML = training.maplocation;
									row.insertCell(9).innerHTML = training.coordinatorname;
									row.insertCell(10).innerHTML = training.resourcetype;

									var applyNowButton = document
											.createElement("button");
									applyNowButton.textContent = "Apply Now";
									applyNowButton.className = "btn btn-success";

									applyNowButton.onclick = createApplyButtonClickHandler(
											training.ref_planner_id,
											training.venue_id);

									var actionCell = row.insertCell(11);
									actionCell.appendChild(applyNowButton);
								}
							}

							function createApplyButtonClickHandler(
									refPlannerId, venueId) {
								return function() {
									redirectToApplyPage(refPlannerId, venueId);
								};
							}

							function redirectToApplyPage(refPlannerId, venueId) {
								var applyPageUrl = '/TrainingApplyForm.jsp';
								applyPageUrl += '?ref_planner_id='
										+ encodeURIComponent(refPlannerId);

								if (venueId !== null && venueId !== undefined) {
									applyPageUrl += '&venue_id='
											+ encodeURIComponent(venueId);
								}

								window.location.href = applyPageUrl;
							}
						});
	</script>
</body>
</html>
