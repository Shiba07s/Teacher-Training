<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="container tab-content " id="tab3">
		<!-- Form Start  -->
		<div class="card mt-3">
			<div class="card-header text-center">
				<h4>Training schedule form</h4>
			</div>
			<!-- ################################ -->
			<div class="container mt-2">
				<!-- <div class="card"> -->
				<!-- <div class=""> -->
				<form class="card-body shadow-lg bg-body-tertiary rounded" id="top">
					<div class="row">
						<div class="form-group col-md-3">
							<label for="trainingReferenceId" class="form-label">RefPlanner
								ID</label>
							<div class="form-floating">


								<input type="text" class="form-control" id="trainingReferenceId"
									style="font-size: 20px;">
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<button type="button" class="btn btn-primary btn-lg"
									Id="searchButton" style="position: relative; top: 23px">Search</button>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-group" id="venueName">
								<label for="venue">Venue Name:</label> <select
									id="venueDropdown" class="form-control" required></select>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-group" id="resourceType">
								<label for="resource">Resource Type:</label> <select
									id="resourceDropdown" class="form-control" required></select>
							</div>
						</div>
						<div class="form-group" style="display: none;">
							<label for="venue">Venue Id:</label> <input type="text"
								class="form-control" id="venueId" name="venueId" required>
						</div>


					</div>
				</form>
			</div>
			<!-- ################################### -->




			<div class="card-body">
				<span class="text-danger"> * After search respective data
					will auto populated</span>

				<form class="card-body shadow-lg p-3 mb-5 bg-body-tertiary rounded"
					id="middle">
					<div class="row">
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="trainingType"
									placeholder="12343215" required readonly> <label
									for="trainingType">Training Type</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="trainingMode"
									placeholder="99372257343" required readonly> <label
									for="trainingMode">Training Mode</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="trainingMonth"
									placeholder="12343215" required readonly> <label
									for="trainingMonth">Training Month</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="trainingYear"
									placeholder="12343215" required readonly> <label
									for="trainingYear">Training Year</label>
							</div>
						</div>
					</div>
					<!-- ################### 2nd ################ -->
					<div class="row mt-1">
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="trainingName"
									placeholder="12343215" required readonly> <label
									for="trainingName">Training Name</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="module"
									placeholder="99372257343" required readonly> <label
									for="module">Module</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="description"
									placeholder="12343215" required readonly> <label
									for="description">Description</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="vaddress"
									placeholder="12343215" required readonly> <label
									for="description">Venue Address</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="maplocation"
									placeholder="12343215" required readonly> <label
									for="mapLocation">Map Location</label>
							</div>
						</div>
					</div>
					<!-- ################################# 3rd ############################# -->
					<div class="row mt-1">
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="grade"
									placeholder="12343215" required readonly> <label
									for="grade">Grade</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="agency"
									placeholder="99372257343" required readonly> <label
									for="agency">Agency</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="coordinatorName"
									placeholder="12343215" required readonly> <label
									for="coordinatorName">Co-Ordinater Name</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="email"
									placeholder="12343215" required readonly> <label
									for="email">Email</label>
							</div>
						</div>
					</div>
					<!-- ############################# 4th ###############################
             -->
					<div class="row mt-1">
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="mobile"
									placeholder="" required readonly> <label for="mobile">Mobile</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="state"
									placeholder="" required readonly> <label for="state">State</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="district"
									placeholder="12343215" required readonly> <label
									for="district">District</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="text" class="form-control" id="mandal"
									placeholder="12343215" required readonly> <label
									for="mandal">mandal</label>
							</div>
						</div>
					</div>

					<div class="row mt-1">
						<span class="text-danger">* Please Fill The Bellow date</span>
					</div>

					<div class="row mt-1">
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="Date" class="form-control " id="applicationSD"
									required> <label for="applicationSD">Application
									Start Date</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="Date" class="form-control" id="applicationED"
									placeholder="99372257343" required> <label
									for="applicationED">Application End Date</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="Date" class="form-control" id="trainingSD"
									placeholder="12343215" required> <label
									for="trainingSD">Training Start Date</label>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="form-floating">
								<input type="Date" class="form-control" id="trainingED"
									placeholder="12343215" required> <label
									for="trainingED">Training End date</label>
							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<button type="button" class="btn btn-primary btn-lg "
								Id="saveSchedule">Schedule</button>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-danger btn-lg "
								onclick="fun()">Clear</button>
						</div>
						<div class="col-md-3"></div>

					</div>

				</form>
			</div>
		</div>
		<form></form>

	</div>
	<script>
		$(document).ready(function () {
			$("#saveSchedule").click(function () {
				var trainingRefId = $("#trainingReferenceId").val();
				var tvenueId = $("#venueId").val();
				var r_type = $("#resourceDropdown").val();
				var trainingMode = $("#trainingMode").val();
				var trainingMonth = $("#trainingMonth").val();
				var trainingYear = $("#trainingYear").val();
				var trainingName = $("#trainingName").val();
				var module = $("#module").val();
				var description = $("#description").val();
				var grade = $("#grade").val();
				var agency = $("#agency").val();
				var coordinatorname = $("#coordinatorName").val();
				var cemail = $("#email").val();
				var cmobile = $("#mobile").val();
				var tstate = $("#state").val();
				var tdistrict = $("#district").val();
				var tmandal = $("#mandal").val();
				var astartDate = $("#applicationSD").val();
				var aendDate = $("#applicationED").val();
				var tstartDate = $("#trainingSD").val();
				var tendDate = $("#trainingED").val();
				var location = $("#maplocation").val();
				var vaddress = $("#vaddress").val();

				// Construct the formData object
				var formData = {
					ref_planner_id: trainingRefId,
					venue_id: tvenueId,
					resourcetype: r_type,
					tmode: trainingMode,
					tmonth: trainingMonth,
					tyear: trainingYear,
					tname: trainingName,
					tmodule: module,
					tdescription: description,
					tgrade: grade,
					tagency: agency,
					coordinatorname: coordinatorname,
					coordinatoremailid: cemail,
					coordinatormobileno: cmobile,
					state: tstate,
					district: tdistrict,
					mandal: tmandal,
					apply_start_dt: astartDate,
					apply_end_dt: aendDate,
					training_start_dt: tstartDate,
					training_end_dt: tendDate,
					maplocation: location,
					vaddress: vaddress
				};

				var jsonString = JSON.stringify(formData);

				// '/TTSS03/api/schedule'
				fetch('/api/schedule', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json',
					},
					body: jsonString
				})

					.then(response => response.json())
					.then(data => {
						console.log("Schedule API response:", data);



					})
					.catch(error => {
						console.log("Error:", error);
					});
			});
		});

		//script-2
		$(document).ready(function () {
			$("#searchButton").click(function () {
				var searchTerm = $("#trainingReferenceId").val();

				$.ajax({
					type: "GET",
					url: "/api/search/schedule?ref_planner_id=" + searchTerm,
					//url: "/TTSS03/api/search/schedule?ref_planner_id=" + searchTerm,
					dataType: "json",
					success: function (response) {
						console.log(response);
						var tmonth = response[0].tmonth;
						var tyear = response[0].tyear;
						var tname = response[0].tname;
						var tdescription = response[0].tdescription;

						var tmode = response[0].tmode;
						//var tmodule = response[0].tmodule;
						var tgrade = response[0].tgrade;
						var tagency = response[0].tagency;
						var tcategory = response[0].tcategory;
						var module = response[0].t_subjects;



						$("#trainingMonth").val(tmonth);
						$("#trainingYear").val(tyear);
						$("#trainingName").val(tname);
						$("#description").val(tdescription);

						$("#traningMode").val(tmode);
						//$("#module").val(tmodule);
						$("#grade").val(tgrade);
						$("#trainingMode").val(tmode);
						$("#agency").val(tagency);
						$("#trainingType").val(tcategory);
						$("#module").val(module);
					},
					error: function (error) {
						console.log("Error:", error);
					}
				});
			});
		});

		function formatDate(inputDate) {
			var date = new Date(inputDate);
			var year = date.getFullYear();
			var month = String(date.getMonth() + 1).padStart(2, '0');
			var day = String(date.getDate()).padStart(2, '0');
			return year + "-" + month + "-" + day;
		}




		$(document).ready(function () {
			$.ajax({
				url: "/api/search/venue",
				//url: "/TTSS03/api/search/venue",
				type: "GET",
				dataType: "json",
				success: function (data) {
					var dropdown = $("#venueDropdown");
					dropdown.empty();
					dropdown.append($("<option>").val("").text("----Select Venue----"));
					$.each(data, function (index, item) {
						var optionText = item.vname;
						dropdown.append($("<option>").val(item.vid).text(optionText));
					});
				},
				error: function (error) {
					console.log("Error fetching venue data:", error);
				}
			});

			$('#venueDropdown').change(function () {
				var selectedVenueId = $(this).val();
				console.log(selectedVenueId);

				if (selectedVenueId) {
					$('#venueId').val(selectedVenueId);

					$.ajax({
						type: "GET",
						url: "/api/search/venueId?vid=" + selectedVenueId,
						//url: "/TTSS03/api/search/venueId?vid=" + selectedVenueId,
						dataType: "json",
						success: function (response) {
							var vid = response[0].vid;

							var vmandal = response[0].vmandal;
							var vstate = response[0].vstate;
							var vdistrict = response[0].vdistrict;
							var vlocation = response[0].vaddress;
							var vcontactname = response[0].vcontactname;
							var vcontactno = response[0].vcontactno;
							var vcontactmailid = response[0].vcontactmailid;
							var maplocation = response[0].maplocation;

							$("#venueId").val(vid);
							$("#mandal").val(vmandal);
							$("#state").val(vstate);
							$("#district").val(vdistrict);
							$("#maplocation").val(maplocation);
							$("#coordinatorName").val(vcontactname);
							$("#mobile").val(vcontactno);
							$("#email").val(vcontactmailid);
							$("#vaddress").val(vlocation);


						},
						error: function (error) {
							console.log("Error fetching venue details:", error);
						}
					});
				} else {
					$('#venueId').val('');
					$('#mandal').val('');
					$('#state').val('');
					$('#district').val('');
					$('#maplocation').val('');
					$('#coordinatorName').val('');
					$('#mobile').val('');
					$('#email').val('');
					$('#vaddress').val('');

				}
			});
		});

		$.ajax({
			url: "/api/search/resource",
			//url: "/TTSS03/api/search/resource",
			type: "GET",
			dataType: "json",
			success: function (data) {
				var resDropdown = $("#resourceDropdown");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text("----Select Resource----"));
				$.each(data, function (index, item) {
					var optionText = item.resourcetype;
					resDropdown.append($("<option>").val(item.resourcetype).text(optionText));
				});
			},
			error: function (error) {
				console.log("Error fetching venue data:", error);
			}
		});
	</script>

	<script>
					document.getElementById("saveSchedule").addEventListener("click", function () {
						// Display success message
						alert("Training Schedule Successfully ! ! !");

						// Wait for 1 second (1000 milliseconds)
						setTimeout(function () {
							// Redirect to another page (replace 'yourPage.html' with the actual page URL)
							window.location.href = '/TTSS03/Admin_dashboard.html';
							//window.location.href = '/TTSS03/Admin_dashboard.html';
						}, 1000);
					});
					function fun() {
						document.getElementById("top").reset();
						document.getElementById("middle").reset();

					}

				</script>

</body>
</html>