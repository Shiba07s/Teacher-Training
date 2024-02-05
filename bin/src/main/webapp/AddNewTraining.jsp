<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add New Training</title>
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
</head>
<body>
	<div class="container mt-2">
		<!-- Your form goes here with fields side by side -->
		<form>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="tname">Training Name:</label> <input type="text"
							class="form-control" id="tname" required>
					</div>
					<div class="form-group">
						<label for="plannerId">Training planner Id:</label> <input
							type="text" class="form-control" id="plannerId" required>
					</div>
					<div class="form-group">
						<label for="trainingMonth">Training Month:</label> <select
							class="form-control" id="trainingMonth" required>
							<option value="default" selected>-----Select-----</option>

							<option value="1">January</option>
							<option value="2">February</option>
							<option value="3">March</option>
							<option value="4">April</option>
							<option value="5">May</option>
							<option value="6">June</option>
							<option value="7">July</option>
							<option value="8">August</option>
							<option value="9">September</option>
							<option value="10">October</option>
							<option value="11">November</option>
							<option value="12">December</option>
						</select>
					</div>
					<!-- Replace the existing "Training Year" input field with a dropdown -->
					<div class="form-group">
						<label for="trainingYear">Training Year:</label> <select
							class="form-control" id="trainingYear" required>
							<!-- Add years dynamically, adjust the range as needed -->
							<%
							int currentYear = java.time.Year.now().getValue();
							for (int i = currentYear; i >= currentYear - 10; i--) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
						</select>
					</div>

					<div class="form-group">
						<label for="startDate">Tentative Start date:</label> <input
							type="date" class="form-control" id="startDate" required>
					</div>
					<div class="form-group">
						<label for="endDate">Tentative End Date:</label> <input
							type="date" class="form-control" id="endDate" required>
					</div>
					<div class="form-group">
						<label for="agency">Training Agency:</label> <input type="text"
							class="form-control" id="agency" required>
					</div>
					<div class="form-group">
						<label for="subject">Training Subject:</label> <input type="text"
							class="form-control" id="subject" required>
					</div>
					<div class="form-group">
						<label for="category">Training Category:</label> <input
							type="text" class="form-control" id="category" required>
					</div>
					<div class="form-group">
						<label for="spell">Training Spell:</label> <input type="text"
							class="form-control" id="spell" required>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Add more fields as needed -->

					<div class="form-group">
						<label for="description">Training Description:</label> <input
							type="text" class="form-control" id="description" required>
					</div>
					<div class="form-group">
						<label for="location">Preferred Location:</label> <input
							type="text" class="form-control" id="location" required>
					</div>
					<div class="form-group">
						<label for="grade">Training Grade:</label> <input type="text"
							class="form-control" id="grade" required>
					</div>
					<div class="form-group">
						<label for="targetGroup">Target Group:</label> <input type="text"
							class="form-control" id="targetGroup" required>
					</div>
					<div class="form-group">
						<label for="stakeholders">Number Of Stakeholders:</label> <input
							type="text" class="form-control" id="stakeholders" required>
					</div>
					<div class="form-group">
						<label for="dayNeeded">Number of day needed:</label> <input
							type="text" class="form-control" id="dayNeeded" required>
					</div>
					<div class="form-group">
						<label for="hoursPerDay">Hours per Day:</label> <input type="text"
							class="form-control" id="hoursPerDay" required>
					</div>
					<div class="form-group">
						<label for="totalHours">Total Hours:</label> <input type="text"
							class="form-control" id="totalHours" required>
					</div>
					<div class="form-group">
						<label for="mode">Training Mode:</label> 
						<select class="form-control" id="mode" required>
							<option value="In-person">In-person</option>
							<option value="Online">Online</option>
							<option value="Hybrid">Hybrid</option>
							<!-- Add more options as needed -->
						</select>
					</div>

					<div class="form-group">
						<label for="status">Training Status:</label> <input type="text"
							class="form-control" id="status" required>
					</div>
					<!-- Add more fields as needed -->
				</div>
			</div>

			<button type="submit" class="btn btn-primary" onclick="submitForm()">Submit</button>
			<button type="button" class="btn btn-secondary" onclick="closeForm()">Cancel</button>
		</form>
	</div>

	<script>
		function closeForm() {
			// Close the form or redirect to another page
			window.location.href = "AcademicCalender.jsp";
		}

		function submitForm() {
			// Collect form data and create a JSON object
			var formData = {

				refplannerid : $("#plannerId").val(),
				tmonth : $("#trainingMonth").val(),
				tyear : $("#trainingYear").val(),
				trainingregstartdt : $("#startDate").val(),
				trainingregenddt : $("#endDate").val(),
				tagency : $("#agency").val(),
				tname : $("#tname").val(),
				tsubject : $("#subject").val(),
				tcategory : $("#category").val(),
				tspell : $("#spell").val(),
				tdescription : $("#description").val(),
				preferdlocation : $("#location").val(),
				tgrade : $("#grade").val(),
				ttargetgroup : $("#targetGroup").val(),
				numberofstakeholder : $("#stakeholders").val(),
				numberdayneeded : $("#dayNeeded").val(),
				tmode : $("#mode").val(),
				thoursperday : $("#hoursPerDay").val(),
				totalhours : $("#totalHours").val(),
				tstatus : $("#status").val(),

			};

			// Make a POST request to the api/savedata endpoint
			$.ajax({
				type : "POST",
				url : "api/savedata",
				contentType : "application/json",
				data : JSON.stringify(formData),
				success : function(response) {
					console.log(response);
					toastr.success("Training data saved successfully");
				},
				error : function(xhr, status, error) {
					console.error("API request error: " + error);
					toastr.error("Failed to save training data");
				}
			});
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>