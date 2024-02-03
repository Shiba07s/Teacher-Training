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
<!-- 					<div class="form-group"> -->
<!-- 						<label for="plannerId">Training planner Id:</label> <input -->
<!-- 							type="text" class="form-control" id="plannerId" required> -->
<!-- 					</div> -->
					<div class="form-group">
						<label for="trainingMonth">Training Month:</label> <select
							class="form-control" id="trainingMonth" required>
							<option value="default" selected>-----Select-----</option>
 
							<option value="January">January</option>
							<option value="February">February</option>
							<option value="March">March</option>
							<option value="April">April</option>
							<option value="May">May</option>
							<option value="June">June</option>
							<option value="July">July</option>
							<option value="August">August</option>
							<option value="September">September</option>
							<option value="October">October</option>
							<option value="November">November</option>
							<option value="December">December</option>
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
						<label for="agency">Training Agency:</label> <select
						id="agency" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="subject">Training Subject:</label> <input type="text"
							class="form-control" id="subject" required>
					</div>
					<div class="form-group">
						<label for="category">Training Category:</label> <select
						id="category" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="resource">Training Spell:</label> <select
						id="spell" class="form-control" required></select>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Add more fields as needed -->
 
					<div class="form-group">
						<label for="description">Training Description:</label> <input
							type="text" class="form-control" id="description" required>
					</div>
					<div class="form-group">
						<label for="location">Preferred Location:</label> <select
						id="venue" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="grade">Training Grade:</label> <select
						id="grade" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="targetGroup">Target Group:</label><select
						id="group" class="form-control" required></select>
					</div>
					<div class="form-group">
						<label for="stakeholders">Number Of Stakeholders:</label> <input
							type="text" class="form-control" id="stakeholders"  pattern="\d*"   
							 oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
					</div>
					<div class="form-group">
						<label for="dayNeeded">Number of day needed:</label> <input
							type="text" class="form-control" id="dayNeeded"  pattern="\d*"   
							 oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
					</div>
					<div class="form-group">
						<label for="hoursPerDay">Hours per Day:</label> <input type="text"
							class="form-control" id="hoursPerDay"  pattern="\d*"   
							 oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
					</div>
					<div class="form-group">
						<label for="totalHours">Total Hours:</label> <input type="text"
							class="form-control" id="totalHours"  pattern="\d*"   
							 oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
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
						<label for="status">Training Status:</label><select
						id="status" class="form-control" required>
								<option value="NA">NA</option>
								<option value="confirmed">Confirmed</option>
						
						
						
						</select>
					</div>
					<!-- Add more fields as needed -->
				</div>
			</div>
 
			<button type="submit" class="btn btn-primary" onclick="submitForm()">Submit</button>
			<button type="button" class="btn btn-secondary" onclick="closeForm()">Cancel</button>
		</form>
	</div>
 <script>
		$.ajax({
			url : "/TTSS03/api/spell",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#spell");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Spell Name----"));
				$.each(data, function(index, item) {
					var optionText = item.spell;
					resDropdown.append($("<option>").val(item.spell)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		$.ajax({
			url : "/TTSS03/api/attendGrade",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#grade");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Grade----"));
				$.each(data, function(index, item) {
					var optionText = item.attendgrade;
					resDropdown.append($("<option>").val(item.attendgrade)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		$.ajax({
			url : "/TTSS03/api/category",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#category");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Category----"));
				$.each(data, function(index, item) {
					var optionText = item.trainingcategory;
					resDropdown.append($("<option>").val(item.trainingcategory)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		$.ajax({
			url : "/TTSS03/api/group",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#group");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select group----"));
				$.each(data, function(index, item) {
					var optionText = item.targetgroup;
					resDropdown.append($("<option>").val(item.targetgroup)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		
		$.ajax({
			url : "/TTSS03/api/search/venue",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#venue");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Location----"));
				$.each(data, function(index, item) {
					var optionText = item.vname;
					resDropdown.append($("<option>").val(item.vname)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
		
		
		$.ajax({
			url : "/TTSS03/api/agency",
			type : "GET",
			dataType : "json",
			success : function(data) {
				console.log(data);
				var resDropdown = $("#agency");
				resDropdown.empty();
				resDropdown.append($("<option>").val("").text(
						"----Select Agency----"));
				$.each(data, function(index, item) {
					var optionText = item.agency;
					resDropdown.append($("<option>").val(item.agency)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
	</script>
 
	<script>
		function closeForm() {
			// Close the form or redirect to another page
			window.location.href = "/TTSS03/AcademicCalender.jsp";
		}
 
		function submitForm() {
			// Collect form data and create a JSON object
			var formData = {
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
				preferdlocation : $("#venue").val(),
				tgrade : $("#grade").val(),
				ttargetgroup : $("#group").val(),
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
				url : "/TTSS03/api/savedata",
				contentType : "application/json",
				data : JSON.stringify(formData),
				success : function(response) {
					console.log(response);
					toastr.success("Training data saved successfully");
					
					window.location.href = "/TTSS03/AcademicCalender.jsp";

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