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
	padding: 80px;
}

.containerr {
	position: "fixed";
	top: 140px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-6 containerr" text-center>

			<button onclick="hitApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">

				<div>

					<div class="card-body custom-card-body" id="adminId"
						style="background-image: linear-gradient(to top, #1d852e, #84eb44); color: white; float: right; margin-left: 120px;">

						<h3 style="position: absolute">Waiting For Approval</h3>

					</div>

				</div>

			</button>

		</div>



		<div class="col-md-6 containerr">

			<button onclick="approvedApi()" class="card-link"
				style="background: none; border: none; padding: 0; font: inherit; cursor: pointer;">

				<div>

					<div class="card-body custom-card-body"
						style="background-image: linear-gradient(to top, #0077bd, #8ac6d1); color: white; float: right; margin-right: 80px;">

						<h3 class="card-title" style="position: absolute">Approved
							Training</h3>

					</div>

				</div>

			</button>

		</div>

	</div>



	<script>
		function hitApi() {

			window.location.href = "/Admin_approval.html";

		}
	</script>

	<script>
		function approvedApi() {

			window.location.href = "/ApprovedTrainings.html";

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>

</body>

</html>