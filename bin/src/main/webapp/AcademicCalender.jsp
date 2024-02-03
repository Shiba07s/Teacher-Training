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
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
<!-- Include Toastr CSS and JS -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
 
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Your custom script containing deleteTraining function -->
 
<!-- Include Bootstrap JS (after your custom script) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous"> -->

    <!-- Include Bootstrap JS (after your custom script) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

 
<!-- Core theme JS (if needed) -->
<script src="js/scripts.js"></script>
<style type="text/css">
.btn{
	font-size: 14px;
}
 .edit-button {
            width: 62.47px;
        }
     element.style{
     margin-left: -370px;
     }
        
        }

</style>
 
</head>
<body>

<script>
    function uploadFile() {
        var fileInput = document.getElementById('file');
        var file = fileInput.files[0];

        var formData = new FormData();
        formData.append('file', file);

        $.ajax({
            type: 'POST',
            url: '/TTSS03/api/upload',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);
                alert(response);
            },
            error: function(error) { 
                console.error(error);
                alert('File upload failed. Please try again.');
            }
        });
    }
</script>
  
 
 
<!-- 	<a href="AddNewTraining.jsp" class="btn btn-success mt-2">Add -->
<!-- 		NewTraining +</a> -->
<!--         <div class="form-group"> -->
<!--             <label for="file">Choose File:</label> -->
<!--             <input type="file" class="form-control-file" id="file" name="file"> -->
<!--         </div> -->
<!--         <button type="submit" class="btn btn-primary">Upload File</button> -->
		
<!-- 		 <input type="file" id="fileInput" /> -->
<!--     <button onclick="uploadFile()">Upload File</button> -->
 <div class="row">
    <div class="col-md-4">
        <a href="AddNewTraining.jsp" class="btn btn-success mt-2" style="margin-top: 20px;">Add New Training +</a>
    </div>
    <div class="col-md-4">
            <a href="/TTSS03/Academic_calender_master.xlsx" download class="btn btn-info mt-2" style="margin-left: -150px; margin-top: 20px;">Download Excel Format</a>
        </div>
    <div class="col-md-4" >
        <div class="form-group" > 
            <label for="file" style="margin-left: -296px;">Choose File(Upload That Excel format)):</label>
            <input type="file" class="form-control-file " style="margin-left: -296px;" id="file" name="file">
        </div>
         <button type="submit" id="uploadBtn" class="btn btn-primary" style="margin-top: -70px" onclick="uploadFile()">Upload File</button>
    </div>
<!--     <div> -->
<!--     <button type="submit" id="uploadBtn" class="btn btn-primary" style="margin-left: -325px; margin-top: 20px">Upload File</button> -->
<!--     </div> -->
    
<!--  <a href="#" id="downloadButton" class="btn btn-info mt-2">Download Excel</a> -->

</div>
	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead class="thead-dark"
						style="background-color: #337ab7; color: white;">
 
						<tr>
							<th>Sl.no.</th>
							<th>Training Ref Id</th>
							<th>Training Subject</th>
							<th>Training Category</th>
							<th>Training Mode</th>
							<th>Target Group</th>
							<th>Training Month</th>
							<th>Training Year</th>
							<th>Training Name</th>
							<th>Description</th>
							<th>Grade</th>
							<th>Agency</th>
							<th>Training Spell</th>
							<th>Preferred Location</th>
							<th>No. Of Stakeholders</th>
							<th>No. Of Day Needed</th>
							<th>Hours per Day</th>
							<th>Total Hours</th>
							<th>Tentative Start Date</th>
							<th>Tentative End Date</th>
							<th>Training Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
   
<script>
    // Declare the editTraining function in the global scope
    function editTraining(training) {
    	
    	 var isConfirmed = confirm("Are you sure you want to edit this training?");

 	    // Proceed with deletion only if the user confirms
 	    if (isConfirmed) {
        // Construct the URL with parameters
        var editUrl = "editTrainingPage.jsp" +
            "?refplannerid=" + training.refplannerid +
            "&tsubject=" + (training.tsubject) +
            "&tcategory=" + (training.tcategory) +
            "&tmode=" + (training.tmode) +
            "&ttargetgroup=" + (training.ttargetgroup) +
            "&tmonth=" + (training.tmonth) +
            "&tyear=" + (training.tyear) +
            "&tname=" + (training.tname) +
            "&tdescription=" + (training.tdescription) +
            "&tgrade=" + (training.tgrade) +
            "&tagency=" + (training.tagency) +
            "&tspell=" + (training.tspell) +
            "&preferdlocation=" + (training.preferdlocation) +
            "&numberofstakeholder=" + (training.numberofstakeholder) +
            "&numberdayneeded=" + (training.numberdayneeded) +
            "&thoursperday=" + (training.thoursperday) +
            "&totalhours=" + (training.totalhours) +
            "&trainingregstartdt=" + (training.trainingregstartdt) +
            "&trainingregenddt=" + (training.trainingregenddt) +
            "&tstatus=" + (training.tstatus);
 
        // Redirect to the edit page
        window.location.href = editUrl;
    }
    }
 
   
        // Execute the function on page load
        fetchDataAndDisplay();
 
        function fetchDataAndDisplay() {
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/getdata",
                dataType: "json",
                success: function (data) {
                    displayTrainingData(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to fetch training data");
                }
            });
        }
 
        function displayTrainingData(data) {
            var trainings = data;
            var tableBody = $("#trainingTable tbody");
 
            // Clear existing rows
            tableBody.empty();
 
            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = $("<tr></tr>");
                row.append("<td class='serial-column'>"+ (i + 1) + "</td>");
                row.append("<td>" + training.refplannerid + "</td>");
                row.append("<td>" + training.tsubject + "</td>");
                row.append("<td>" + training.tcategory + "</td>");
                row.append("<td>" + training.tmode + "</td>");
                row.append("<td>" + training.ttargetgroup + "</td>");
                row.append("<td>" + training.tmonth + "</td>");
                row.append("<td>" + training.tyear + "</td>");
                row.append("<td>" + training.tname + "</td>");
                row.append("<td>" + training.tdescription + "</td>");
                row.append("<td>" + training.tgrade + "</td>");
                row.append("<td>" + training.tagency + "</td>");
                row.append("<td>" + training.tspell + "</td>");
                row.append("<td>" + training.preferdlocation + "</td>");
                row.append("<td>" + training.numberofstakeholder + "</td>");
                row.append("<td>" + training.numberdayneeded + "</td>");
                row.append("<td>" + training.thoursperday + "</td>");
                row.append("<td>" + training.totalhours + "</td>");
                row.append("<td>" + training.trainingregstartdt + "</td>");
                row.append("<td>" + training.trainingregenddt + "</td>");
                row.append("<td>" + training.tstatus + "</td>");
 
                row.append("<td><button class='btn btn-primary btn-sm edit-button' onclick='editTraining(" + JSON.stringify(training) + ")'>Edit</button><button class='btn btn-danger btn-sm'   onclick='deleteTraining(" + training.refplannerid + ")'>Delete</button></td>");
 
                tableBody.append(row);
            }
        }
 
        // Sample functions for edit and delete
        function deleteTraining(refplannerid) {
        	var isConfirmed = confirm("Are you sure you want to delete this training?");

            // Proceed with deletion only if the user confirms
            if (isConfirmed) {
            // Make an AJAX request to the delete endpoint
            
            $.ajax({
                type: "POST",
                url: "/TTSS03/api/deactivate/" + refplannerid,
                success: function (response) {
                    toastr.success("Training deleted successfully");
                    // Reload or update the data after deletion
                    fetchDataAndDisplay();
                },
                error: function (xhr, status, error) {
                    toastr.error("Failed to delete training: " + error);
                }
            });
        }
        }
   
</script>
 
 
 
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Toastr CSS and JS links go here -->
</body>
</html>