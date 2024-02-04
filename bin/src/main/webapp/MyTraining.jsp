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
	<div class="container mt-2 tab-content" id="tab3"
				style=" width: 170%; position: relative; top: 52px;">
				<div class="input-group mb-3" style="width: 50%;">
					<input type="text" class="form-control" placeholder="Search..." id="searchBar">
				</div>
				<div class="card mt-2" style="font-size: 14px;">
					<div class="card-header"><b>My Trainings </b></div>
					<div class="card-body">
						<div id="myTrainings"></div>
						<div class="table-responsive w-100%">
							<table class="table table-hover" id="mytraining">
								<thead>
									<tr>
										<th>Treasury Id</th>
										<th>Training Name</th>
										<th>Training Mode</th>
										<th>Training description</th>
										<th>Training start to end date</th>
										<th>Venue Name</th>
										<th>Venue Address</th>
										<th>Venue Contact</th>
										<th>Trainer Name</th>
										<th>Map Location</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function () {
					// Handle input events on the search bar
					$("#searchBar").on("input", function () {
						var searchText = $(this).val().toLowerCase();
						filterTableRows(searchText);
					});
				});

				// Function to filter table rows based on search text
				function filterTableRows(searchText) {
					$("#mytraining tbody tr").filter(function () {
						var trainingName = $(this).find("td:eq(1)").text().toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(trainingName.indexOf(searchText) > -1);
					});
				}
			</script>
		<script>
    $(document).ready(function () {
        // Call the function to fetch data and display it
        fetchDataAndDisplay();

        // Function to fetch data and display it
        function fetchDataAndDisplay() {
            // Retrieve treasuryId from session storage
            var treasuryId = sessionStorage.getItem('treasuryId');

            if (!treasuryId) {
                console.error("Treasury Id not found in session storage");
                // Handle the case where treasuryId is not present in session storage
                return;
            }

            $.ajax({
                type: "GET",
                url: "/api/mytrainings?treasuryId=" + treasuryId,
                //url: "/TTSS03/api/mytrainings?treasuryId=" + treasuryId,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    displayTrainingData(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        }

        function displayTrainingData(data) {
            var trainings = data;
            trainings.reverse();
            var tableBody = $("#mytraining tbody");

            // Clear existing rows
            tableBody.empty();

            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = $("<tr></tr>");

                row.append("<td>" + training.treasuryid + "</td>");
                row.append("<td>" + training.tname + "</td>");
                row.append("<td>" + training.tmode + "</td>");
                row.append("<td>" + training.tdescription + "</td>");
                row.append("<td>" + training.startdate + " to " + training.enddate + "</td>");
                row.append("<td>" + training.vname + "</td>");
                row.append("<td>" + training.vaddress + "</td>");
                row.append("<td>" + training.vcontact + "</td>");
                row.append("<td>" + training.trainername + "</td>");
                row.append("<td>" + training.maplocation + "</td>");
                row.append("<td>" + training.status + "</td>");
                tableBody.append(row);
            }
        }
    });
</script>



</body>
</html>