<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>Edit Training</title>
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Include Toastr CSS and JS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>


<!-- <script src=" https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" /> -->
<link href="css/styles.css" rel="stylesheet" />
<style>
body {
	font-family: "Arial", sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

form {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	width: 100%;
	text-align: center;
	color: #007bff;
	margin-bottom: 20px;
}

label {
	/*       width: calc(25% - 20px); */
	display: block;
	margin-bottom: 8px;
	color: #495057;
}

input {
	/*       width: calc(100% - 16px); */
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
	border: 1px solid #ced4da;
	border-radius: 4px;
	font-size: 14px;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
	margin-left: 10px;
}

button[type="submit"] {
	background-color: #28a745;
}

button[type="button"] {
	background-color: #dc3545;
}

.form-group {
	width: 20%;
	margin-left: 3rem;
}
</style>
</head>

<body>
	<form id="updateForm" action="updateTraining" method="post">
		<h2>Edit Training</h2>

		<!--########### Row 1 #############-->
		<div class="row">
			<div class="form-group col-md-3">
				<label for="refplannerid">Training plannerId:</label>
				<div class="form-floating">
					<input type="text" id="refplannerid" name="refplannerid"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tsubject">Training Subject:</label>
				<div class="form-floating">
					<input type="text" id="tsubject" name="tsubject" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tcategory">Training Category:</label>
				<div class="form-floating">
					<input type="text" id="tcategory" name="tcategory" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tmode">Training Mode:</label>
				<div class="form-floating">
					<input type="text" id="tmode" name="tmode" />
				</div>
			</div>
		</div>

		<!--########### Row 2 #############-->
		<div class="row">
			<div class="form-group col-md-3">
				<label for="ttargetgroup">Target Group:</label>
				<div class="form-floating">
					<input type="text" id="ttargetgroup" name="ttargetgroup" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tmonth">Training Month:</label>
				<div class="form-floating">
					<input type="text" id="tmonth" name="tmonth" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tyear">Training Year:</label>
				<div class="form-floating">
					<input type="text" id="tyear" name="tyear" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tname">Training Name:</label>
				<div class="form-floating">
					<input type="text" id="tname" name="tname" />
				</div>
			</div>
		</div>

		<!--########### Row 3 #############-->
		<div class="row">
			<div class="form-group col-md-3">
				<label for="tdescription">Description:</label>
				<div class="form-floating">
					<input type="text" id="tdescription" name="tdescription" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tgrade">Grade:</label>
				<div class="form-floating">
					<input type="text" id="tgrade" name="tgrade" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tagency">Agency:</label>
				<div class="form-floating">
					<input type="text" id="tagency" name="tagency" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tspell">Training Spell:</label>
				<div class="form-floating">
					<input type="text" id="tspell" name="tspell" />
				</div>
			</div>
		</div>

		<!--########### Row 4 #############-->
		<div class="row">
			<div class="form-group col-md-3">
				<label for="preferdlocation">Preferred Location:</label>
				<div class="form-floating">
					<input type="text" id="preferdlocation" name="preferdlocation" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="numberofstakeholder">No. Of Stakeholders:</label>
				<div class="form-floating">
					<input type="text" id="numberofstakeholder"
						name="numberofstakeholder" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="numberdayneeded">No. Of Day Needed:</label>
				<div class="form-floating">
					<input type="text" id="numberdayneeded" name="numberdayneeded" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="thoursperday">Hours per Day:</label>
				<div class="form-floating">
					<input type="text" id="thoursperday" name="thoursperday" />
				</div>
			</div>
		</div>

		<!--########### Row 1 #############-->
		<div class="row">
			<div class="form-group col-md-3">
				<label for="totalhours">Total Hours:</label>
				<div class="form-floating">
					<input type="text" id="totalhours" name="totalhours" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="trainingregstartdt">Tentative Start Date:</label>
				<div class="form-floating">
					<input type="text" id="trainingregstartdt"
						name="trainingregstartdt" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="trainingregenddt">Tentative End Date:</label>
				<div class="form-floating">
					<input type="text" id="trainingregenddt" name="trainingregenddt" />
				</div>
			</div>
			<div class="form-group col-md-3">
				<label for="tstatus">Training Status:</label>
				<div class="form-floating">
					<input type="text" id="tstatus" name="tstatus" />
				</div>
			</div>
		</div>
		<button type="button" style="width: 9%; margin-left: 35%"
			onclick="cancelUpdate()">Cancel</button>
		<button type="submit" style="width: 9%">Update</button>
	</form>

	<script>
		toastr.options = {
			progressBar : true,
			timeOut : 2000,
			positionClass : "toast-bottom-right",
		};

		function getUrlParameter(name) {
			name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
			var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
			var results = regex.exec(location.search);
			return results === null ? '' : decodeURIComponent(results[1]
					.replace(/\+/g, ' '));
		}
		function updateTraining() {
			var formData = {
				refplannerid : $("#updateForm [name=refplannerid]").val(),
				tsubject : $("#updateForm [name=tsubject]").val(),
				tcategory : $("#updateForm [name=tcategory]").val(),
				tmode : $("#updateForm [name=tmode]").val(),
				ttargetgroup : $("#updateForm [name=ttargetgroup]").val(),
				tmonth : $("#updateForm [name=tmonth]").val(),
				tyear : $("#updateForm [name=tyear]").val(),
				tname : $("#updateForm [name=tname]").val(),
				tdescription : $("#updateForm [name=tdescription]").val(),
				tgrade : $("#updateForm [name=tgrade]").val(),
				tagency : $("#updateForm [name=tagency]").val(),
				tspell : $("#updateForm [name=tspell]").val(),
				preferdlocation : $("#updateForm [name=preferdlocation]").val(),
				numberofstakeholder : $(
						"#updateForm [name=numberofstakeholder]").val(),
				numberdayneeded : $("#updateForm [name=numberdayneeded]").val(),
				thoursperday : $("#updateForm [name=thoursperday]").val(),
				totalhours : $("#updateForm [name=totalhours]").val(),
				trainingregstartdt : $("#updateForm [name=trainingregstartdt]")
						.val(),
				trainingregenddt : $("#updateForm [name=trainingregenddt]")
						.val(),
				tstatus : $("#updateForm [name=tstatus]").val(),
			};

			var jsonData = JSON.stringify(formData);

			$.ajax({
				type : "PUT",
				url : "/api/edit/" + $('[name=refplannerid]').val(),

				contentType : "application/json", // Set content type to JSON
				data : jsonData,
				success : function(response) {
					toastr.success("Training updated successfully");
					setTimeout(() => {
						window.location.href = "/AcademicCalender.jsp";
					}, 700);
					

				},
				error : function(xhr, status, error) {
					toastr.error("Failed to update training: " + error);
				}
			});
		}

		$(document).ready(function() {
			$('#updateForm').hide();
			editCalender();
		});

		function editCalender() {
			var calenderId = getUrlParameter('refplannerid');
			console.log(calenderId);
			if (calenderId) {
				$
						.ajax({
							type : "GET",
							url : "/api/getdatabyid/" + calenderId, // Replace with your actual endpoint
							dataType : "json",
							success : function(data) {
								console.log(data);
								// Populate form fields with the retrieved data
								// Setting values from 'data' object to the respective form fields by their IDs
								$('#refplannerid').val(data.refplannerid);
								$('#tsubject').val(data.tsubject);
								$('#tcategory').val(data.tcategory);
								$('#tmode').val(data.tmode);
								$('#ttargetgroup').val(data.ttargetgroup);
								$('#tmonth').val(data.tmonth);
								$('#tyear').val(data.tyear);
								$('#tname').val(data.tname);
								$('#tdescription').val(data.tdescription);
								$('#tgrade').val(data.tgrade);
								$('#tagency').val(data.tagency);
								$('#tspell').val(data.tspell);
								$('#preferdlocation').val(data.preferdlocation);
								$('#numberofstakeholder').val(
										data.numberofstakeholder);
								$('#numberdayneeded').val(data.numberdayneeded);
								$('#thoursperday').val(data.thoursperday);
								$('#totalhours').val(data.totalhours);
								$('#trainingregstartdt').val(
										data.trainingregstartdt);
								$('#trainingregenddt').val(
										data.trainingregenddt);
								$('#tstatus').val(data.tstatus);

								// Add similar lines for other form fields
								// Display the form for editing
								$('#updateForm').show();
							},
							error : function(xhr, status, error) {
								console.error('Error fetching venue data:',
										xhr.responseText);
								alert('Error fetching venue data. Please check the console for details.');
							}
						});
			} else {
				alert('Venue ID not provided in the URL.');
			}
		}
		function cancelUpdate() {
			// Redirect back to the original page or perform any other cancel action
			window.location.href = "/AcademicCalender.jsp";
		}

		$("#updateForm").submit(function(event) {
			// Prevent the default form submission
			event.preventDefault();

			// Call the updateTraining function on form submission
			updateTraining();
		});
	</script>
</body>

</html>
