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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
.custom-card-body {
    background-color: #f8f9fa;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    padding: 15px;
    height: 140px;
}
.custom-card-body h3 {
    font-size: 16px;
    letter-spacing: 0.3px;
    margin: 0;
    font-weight: bold;
}
.custom-card-body p {
    font-size: 36px;
    font-weight: bold;
}
.custom-card-body span {
    font-size: 32px;
    line-height: 20px;
    display: inline-block;
    background: #ffffff7a;
    padding: 5px 9px;
    border-radius: 48px;
    margin-bottom: 7px;
    height: 50px;
    width: 50px;
    line-height: 41px;
}
button.card-link {
    width: 100%;
    margin-bottom: 15px;
}
</style>
</head>
<body>
	<div class="row" style="margin: 0;">
 
		<!-- ##################  Card-1  #######################  -->
		<div class="col-md-3" text-center>
			<button onclick="hitApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body" id="adminId"
						style="background-image: linear-gradient(to top, #ffc376, #ffae8e); color: white; float: right;">
						<span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span>
						<h3>Waiting For Approval</h3>
						<p id="waitingForApprovalCount"></p>
					</div>
				</div>
			</button>
		</div>
 
		<!--  ##################  Card-2  #######################  -->
		<div class="col-md-3">
			<button onclick="approvedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background-image: linear-gradient(to top, #70bb7c, #a2ffae); color: white; float: right;">
						<span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span>
						<h3 class="card-title">Approved
							Trainees</h3>
						<p id="approvedCount"></p>
 
					</div>
				</div>
			</button>
		</div>
 
		<!--	##################  Card-3  #######################  -->
 
		<div class="col-md-3">
			<button onclick="rejectedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background: linear-gradient(to top, #d95757, #ffc4a7); color: white; float: right;">
						<span><i class="fa fa-times-circle-o" aria-hidden="true"></i></span>
						<h3 class="card-title">Reject
							Trainees</h3>
						<p id="rejectedCount"></p>
 
					</div>
				</div>
			</button>
		</div>
 
		<!--	##################  Card-4  #######################  -->
 
		<div class="col-md-3">
			<button onclick="nominatedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background-image: linear-gradient(to top, #0077bd, #8ac6d1); color: white; float: right;">
						<span><i class="fa fa-hand-rock-o" aria-hidden="true"></i></span>
						<h3 class="card-title">Nomination</h3>
 
						<p id="approvedCount"></p>
 
					</div>
				</div>
			</button>
		</div>
		
			<!--	##################  Card-6  #######################  -->
 
		<div class="col-md-3">
			<button onclick="secondApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">
				<div>
					<div class="card-body custom-card-body"
						style="background: linear-gradient(to top, #11f0e8,#11f0e8); color: white; float: right; margin-left: 120px;">
						<span><i class="fa fa-hand-rock-o" aria-hidden="true"></i></span>
						<h3 class="card-title"> Budget Approval
							 </h3>
						<p id="rejectedCount"></p>
 
					</div>
				</div>
			</button>
		</div>
	</div>
	<script>
    window.onload = function () {
        fetch('${pageContext.request.contextPath}/api/count-waiting-for-approval')
            .then(response => response.json())
            .then(data => {
                console.log("API response:", data);
                document.querySelector('#waitingForApprovalCount').textContent = JSON.stringify(data);
            })
            .catch(error => console.error('Error fetching data:', error));
 
        fetch('${pageContext.request.contextPath}/api/count-approved')
            .then(response => response.json())
            .then(approvedData => {
                console.log("API response:", approvedData);
                document.querySelector('#approvedCount').textContent = JSON.stringify(approvedData);
            })
            .catch(error => console.error('Error fetching data:', error));
    
        fetch('${pageContext.request.contextPath}/api/count-rejected')
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
            url: '${pageContext.request.contextPath}/api/count-waiting-for-approval',
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
			window.location.href = "${pageContext.request.contextPath}/Admin_approval.jsp";
		}
		function approvedApi() {
			window.location.href = "${pageContext.request.contextPath}/ApprovedTrainings.jsp";
		}
		function rejectedApi() {
			window.location.href = "${pageContext.request.contextPath}/RejectedTrainings.jsp";
		}
		function nominatedApi() {
			window.location.href = "${pageContext.request.contextPath}/NominatedTraineeNotification.jsp";
		}
		function secondApi() {
			window.location.href = "${pageContext.request.contextPath}/budgetsecondlevelapproval.jsp";
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