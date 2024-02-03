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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- Add this script tag after including Toastr CSS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<!-- Core theme CSS (includes Bootstrap)-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
	<link href="css/styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Add this in the head section of your HTML file -->

	<link rel="stylesheet" type="text/css"
		href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>






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
</head>
<body>
	<div id="page-content-wrapper">
		<script>
			$(document).ready(function () {
				$.ajax({
					type: "GET",
					url: "/api/rejected-data",
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
					// Clear existing rows
					tableBody.empty();
					for (var i = 0; i < data.length; i++) {
						var trainings = data[i];
						var row = $("<tr></tr>");
		                row.append("<td class='serial-column'>" + (i + 1) + "</td>");
						row.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + trainings.treasuryid + '" data-ref_planner_id="' + trainings.ref_planner_id + '"></td>');
						row.append("<td>" + trainings.treasuryid + "</td>");
						row.append("<td>" + trainings.ref_planner_id + "</td>");
						//console.log(trainings);
						row.append("<td>" + trainings.mobilenumberteacher + "</td>");
						row.append("<td>" + trainings.teacher_name + "</td>");
						row.append("<td>" + trainings.designation + "</td>");

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
						//row.append("<td>" + age + " years</td>");
						row.append("<td>" + trainings.resourcetype + "</td>");
						row.append("<td>" + trainings.district_name + "</td>");
						row.append("<td>" + trainings.school_code + "</td>");
						row.append("<td>" + trainings.tname + "</td>");
						row.append("<td>" + trainings.tmode + "</td>");
						row.append("<td>" + trainings.tdescription + "</td>");
						row.append("<td>" + trainings.venue_name + ','+"<br>"+trainings.vaddress + "</td>");						row.append("<td>" + trainings.applydateandtime + "</td>");
						row.append("<td>" + trainings.appliedtype + "</td>");
						row.append("<td>" + trainings.remarks + "</td>");
						var button = $('<button class="btn btn-primary">Previous Trainings</button>');
						button.click(function() {
						window.location.href = "/TrainingInformation.jsp?treasuryId="+ trainings.treasuryid;
											
								});
						var buttonCell = $("<td></td>").append(button);
						row.append(buttonCell);
						tableBody.append(row);
					}
				}
			});
	 
		</script>

		<div class="maindiv">
			<div class="content">
				<div class="formheading">
					<h1 class="h2">Rejected Trainees</h1>
				</div>
				<div class="table-container">
					<table id="AdminId">
						<thead>
							<tr>
								<th>Sl No</th>
								<th>Action</th>
								<th>Treasury Id</th>
								<th>Ref Planner Id</th>
								<th>Mobile No</th>
								<th>Teacher Name</th>
								<th>Designation</th>
								<th>Age as per the DOB</th>
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
								<th>Previous Trainings</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="fixed-buttons">
			<button class="btn btn-success" id="approveButton" onclick="showRejectModal()">Approve</button>
		<!-- 	<button class="btn btn-danger" id="cancelButton" onclick="rejectTraining()"> Reject </button>    -->
		</div>
		 <div id="rejectModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeRejectModal()">&times;</span>
            <label for="approveReason">Reason for Approval:</label>
            <textarea id="approveReason" name="rejectReason" rows="4" cols="50" required></textarea><br>
            <div id="new">
               <!--   <button class="btn btn-danger" onclick="rejectTraining()">Cancel</button>  -->
                <button id="submitRejectButton" class="btn btn-danger" onclick="submitFormWithValidation()">Submit</button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Your existing script -->
    <script>
    toastr.options = {
        "positionClass" : "toast-top-right",
        "showDuration" : "300",
        "hideDuration" : "1000",
        "timeOut" : "5000",
        "extendedTimeOut" : "1000",
    };
 
    function showRejectModal() {
        var selectedCheckboxes = $('.approveCheckbox:checked');
 
        if (selectedCheckboxes.length > 0) {
            var selectedCheckbox = selectedCheckboxes.first();
            var treasuryId = selectedCheckbox.attr('data-treasuryid');
            var refPlannerIds = selectedCheckbox.attr('data-ref_planner_id');
            
            console.log(treasuryId);
            console.log(refPlannerIds);
 
            // Set the selected details in the modal
            $('#approveReason').val('');
            $('#rejectModal').attr('data-treasuryid', treasuryId);
            $('#rejectModal').attr('data-ref_planner_id', refPlannerIds);
 
            document.getElementById('rejectModal').style.display = 'block';
        } else {
            console.log('No checkbox selected');
            toastr.warning('Please Select A Checkbox');
        }
    }
 
    function closeRejectModal() {
        document.getElementById('rejectModal').style.display = 'none';
    }
 
    function cancelReject() {
        closeRejectModal();
    }
 
    function submitFormWithValidation() {
        var treasuryId = $('#rejectModal').attr('data-treasuryid');
        console.log(treasuryId);
        var refPlannerIds = $('#rejectModal').attr('data-ref_planner_id');
        console.log(refPlannerIds);
        var secondlevelapproval = $('#approveReason').val();
 
        $.ajax({
            type: 'PUT',
            url: '/api/remarks-approval',
            data: {
                treasuryId: treasuryId,
                refPlannerIds: refPlannerIds,
                secondlevelapproval: secondlevelapproval
            },
            success: function(response) {
                console.log('Training Rejected Successfully:', response);
                toastr.success('Training Rejected Successfully');
 
                closeRejectModal();
 
                setTimeout(function() {
                    window.location.href = '/Admin_approval.jsp';
                }, 1000);
            },
            error: function(error) {
                console.error('Error For Training Rejected:', error);
                toastr.error('Error For Training Rejected');
            }
        });
    }
    </script>
		<!-- Bootstrap core JS-->

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->

		<script src="js/scripts.js"></script>
</body>

</html>