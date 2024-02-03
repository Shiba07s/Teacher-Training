<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<style>
/* Remove date format from input */
input[type="date"]:required:invalid::-webkit-datetime-edit {
	color: transparent;
	font-size: 15px;
}

input[type="date"]:focus::-webkit-datetime-edit {
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
	padding: 60px;
}

.containerr {
	position: "fixed";
	top: 140px;
}

iframe {
	overflow: hidden;  
        border: none; 
        height: 100%;	
}
</style>
</head>
<body>
	<div class="row">

		<!-- ##################  Card-1  #######################  -->
		<div class="col-md-6 containerr" text-center>
			<button onclick="hitApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body" id="adminId"
						style="background-image: linear-gradient(to top, #1d852e, #84eb44); color: white; float: right; margin-left: 120px;">
						<h3 style="position: absolute">Waiting For Approval</h3>
						<p id="waitingForApprovalCount"
							style="margin: 50px; font-size: 20px;"></p>
					</div>
				</div>
			</button>
		</div>

		<!--  ##################  Card-2  #######################  -->
		<div class="col-md-6 containerr">
			<button onclick="approvedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background-image: linear-gradient(to top, #0077bd, #8ac6d1); color: white; float: right; margin-right: 80px;">
						<h3 class="card-title" style="position: absolute">Approved
							Trainees</h3>
						<p id="approvedCount" style="margin: 50px; font-size: 20px;"></p>

					</div>
				</div>
			</button>
		</div>

		<!--	##################  Card-3  #######################  -->

		<div class="col-md-6 containerr">
			<button onclick="rejectedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background: linear-gradient(to top, #ff0000, #ff0000); color: white; float: right; margin-left: 120px;">
						<h3 class="card-title" style="position: absolute">Reject
							Trainees</h3>
						<p id="rejectedCount" style="margin: 50px; font-size: 20px;"></p>

					</div>
				</div>
			</button>
		</div>

		<!--	##################  Card-4  #######################  -->

		<div class="col-md-6 containerr">
			<button onclick="nominatedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background-image: linear-gradient(to top, #800080, #ff69b4); color: white; float: right; margin-right: 80px;">
						<h3 class="card-title" style="position: absolute">Nomination</h3>

						<p id="approvedCount" style="margin: 50px; font-size: 20px;"></p>

					</div>
				</div>
			</button>
		</div>
	</div>
	<script>
    window.onload = function () {
        fetch('/TTSS03/api/count-waiting-for-approval')
            .then(response => response.json())
            .then(data => {
                console.log("API response:", data);
                document.querySelector('#waitingForApprovalCount').textContent = JSON.stringify(data);
            })
            .catch(error => console.error('Error fetching data:', error));

        fetch('/TTSS03/api/count-approved')
            .then(response => response.json())
            .then(approvedData => {
                console.log("API response:", approvedData);
                document.querySelector('#approvedCount').textContent = JSON.stringify(approvedData);
            })
            .catch(error => console.error('Error fetching data:', error));
    
        fetch('/TTSS03/api/count-rejected')
            .then(response => response.json())
            .then(rejectedData => {
                console.log("API response:", rejectedData);
                document.querySelector('#rejectedCount').textContent = JSON.stringify(rejectedData);
            })
            .catch(error => console.error('Error fetching data:', error));
    };
</script>


	<script>
    function countApi() {
        // Make an AJAX request to get the count
        $.ajax({
            type: 'GET',
            url: '/TTSS03/api/count-waiting-for-approval',
            success: function (response) {
                // Update the card body with the count
                $('#approvalCount').text('Count: ' + response);
                $('#additionalCount').text('Additional Count: ' + (response * 2)); // Replace this with your logic for additional count
            },
            error: function (error) {
                console.error('Error fetching count:', error);
                // Handle the error as needed
            }
        });
    }
</script>


	<script>
		function hitApi() {
			window.location.href = "/TTSS03/Admin_approval.jsp";
		}
		function approvedApi() {
			window.location.href = "/TTSS03/ApprovedTrainings.jsp";
		}
		function rejectedApi() {
			window.location.href = "/TTSS03/RejectedTrainings.jsp";
		}
		function nominatedApi() {
			window.location.href = "/TTSS03/NominatedTraineeNotification.jsp";
		}
	</script>
	<!-- Include other content for the Dashboard tab as needed -->
	<!-- ... -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>