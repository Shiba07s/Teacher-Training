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
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous" />
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<style>
body {
	font-size: 14px;
}

 .required-field {
        color: red; /* Set the color of the star to red or any other color you prefer */
        margin-left: 5px; /* Adjust the spacing between the label and the star */
    }

</style>
</head>

<body>
	<!-- Traning Schudule Form -->
	
	<div class="container tab-content" id="tab2"
		style="position: relative; right: -10px; height: 100%; width: 150%">
		
		<!-- Form Start -->
		
		<div class="mt-1">
			<b>Apply Training</b>
		</div>

		<div class="container mt-2">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="mb-2 col-5">
							<label for="exampleFormControlInput1"
								class="form-label text-danger"> *Government or Treasury
								Employee: </label>
						</div>
						<div class="mb-2 col-1">
							<input type="radio" name="options" value="enable"
								id="enableRadio" onclick="showForm1()" /> Yes
						</div>
						<div class="mb-2 col-2">
							<input type="radio" name="options" value="disable"
								id="disableRadio" onclick="showForm2()" /> No
						</div>
					</div>
					<form id="form1">
						<div id="formm1">
							<div class="row mt-3">
								<div class="mb-2 col-3">
									<label for="treasuryId1" class="form-label">Treasury Id</label>
									<input type="text" class="form-control" id="treasuryId1"
										disabled readonly style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="participantName" class="form-label">Participant
										Name</label> <input type="text" class="form-control"
										id="participantName" readonly disabled style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="schoolComplexId" class="form-label">School
										Complex Id</label> <input type="text" class="form-control"
										id="schoolComplexId" readonly disabled style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="district" class="form-label">Working
										District </label> <input type="text" class="form-control"
										id="district" readonly disabled style="font-size: 13px" />
								</div>
							</div>
							<div class="row">
								<div class="mb-2 col-3">
									<label for="email" class="form-label">Email</label> <input
										type="Email" class="form-control" id="email" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Mobile </label> <input
										type="text" class="form-control" id="mobile" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Workplace </label> <input
										type="text" class="form-control" id="workplace" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Father Name </label> <input
										type="text" class="form-control" id="fathername" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">DOB </label> <input
										type="text" class="form-control" id="dob" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Marital Status </label>
									<input type="text" class="form-control" id="maritalstatus"
										 disabled readonly style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Religion </label> <input
										type="text" class="form-control" id="religion" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Mother Tounge </label> <input
										type="text" class="form-control" id="mothertounge" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Adhaar No </label> <input
										type="text" class="form-control" id="adhaarno" readonly disabled
										style="font-size: 13px" />
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Disability </label> <input
										type="text" class="form-control" id="disability" readonly disabled
										style="font-size: 13px" />
								</div>
							</div>
						</div>
						<div id="form2" style="display: none">
							<div class="row mt-3">
								<div class="mb-2 col-3">
									<label for="cfmsid" class="form-label">CFMS Id</label> <input
										type="text" class="form-control" id="cfmsid"  style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="teachername" class="form-label">Teacher
										Name</label> <input type="text" class="form-control"
										id="teachername"  style="font-size: 13px" disabled  Readonly />
								</div>
								<div class="mb-2 col-3">
									<label for="schoolComplexId" class="form-label">School Complex
										Code</label> <input type="text" class="form-control"
										id="schoolcomplexid"  style="font-size: 13px" disabled  Readonly />
								</div>
								<div class="mb-2 col-3">
									<label for="district" class="form-label">Working
										District </label> <input type="text" class="form-control"
										id="districtname"  style="font-size: 13px" disabled  Readonly/>
								</div>
							</div>
							<div class="row">
								<div class="mb-2 col-3">
									<label for="email" class="form-label">Email</label> <input
										type="Email" class="form-control" id="mail" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Mobile </label> <input
										type="text" class="form-control" id="mobile1" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Workplace </label> <input
										type="text" class="form-control" id="workingplace" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Father Name </label> <input
										type="text" class="form-control" id="fathername1" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">DOB </label> <input
										type="text" class="form-control" id="dob1" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Marital Status </label>
									<input type="text" class="form-control" id="maritalstatus1"
										 style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Religion </label> <input
										type="text" class="form-control" id="religion" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Mother Tounge </label> <input
										type="text" class="form-control" id="mothertounge" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Adhaar No </label> <input
										type="text" class="form-control" id="adhaarno1" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
								<div class="mb-2 col-3">
									<label for="mobile" class="form-label">Disability </label> <input
										type="text" class="form-control" id="disability1" 
										style="font-size: 13px" disabled  Readonly/>
								</div>
							</div>
						</div>

						<div class="mb-2 col-5">
							<label for="tenable" id="tenable" class="form-label text-danger">
								*Have you attened any Traning before: </label>
						</div>
						<div class="mb-2 col-1">
							<input type="radio" name="options" value="enable"
								id="enableRadioTrani" onclick="showForm()"
								style="font-size: 13px" /> Yes
						</div>
						<div class="mb-2 col-2">
							<input type="radio" name="options" value="disable"
								id="disableRadioTrani" onclick="hideForm()"
								style="font-size: 13px" /> No
						</div>
						<div id="formContainer">
							<div id="trainingForm" class="hidden"
								style="border: 1px solid #ccc; padding: 20px; border-radius: 8px;">
								<!-- Training Form -->
								<div class="row mt-3">
									<div class="form-group col-md-3">
										<div class="form-group" id="trainingName">
    <label for="resource">Training Name:<span class="required-field">*</span></label>
    <div>
        <div class="dropdown-container">
            <select id="trainingDropdown" class="form-control1" required onclick="showotherfield()">
                <!-- Add your dropdown options here -->
                <option value="NA">--Select--</option>
                
            </select>
        </div>
    </div>
</div>
</div>

									<div id="otherField" class="hidden">
										<label for="otherTraining">Specify Other Training:<span class="required-field">*</span></label> <input
											type="text" id="otherTraining" name="otherTraining" />
									</div>
									<div class="mb-2 col-3">
										<label for="trainingMode">Training Mode:<span class="required-field">*</span></label> 
								 <div class="dropdown-container">
										
										<select
											id="trainingMode" class="form-control1"
											style="font-size: 13px">
											<option value="NA">--Select Mode--</option>
											<option value="Online">Online</option>
											<option value="Offline">Offline</option>
											<!-- Add more options as needed -->
										</select>
										</div>
									</div>
									<div class="mb-2 col-3">
										<label for="resourceType">Resource Type:<span class="required-field">*</span></label>
										  <div class="dropdown-container">
										
										 <select
											id="resourceType" class="form-control1"
											style="font-size: 13px">
											<option value="NA">--Select ResourceType--</option>
											<option value="Mandal">Mandal Level Trainer</option>
											<option value="Divisional Level RPs">Divisional Level RPs</option>
											<option value="Master Resource Person/KRPs/SRPs">Master Resource Person/KRPs/SRPs</option>
											<option value="DRPs">DRPs</option>
											<option value="Teachers">Teachers</option>
											<!-- Add more options as needed -->
										</select>
<!-- 										     <div class="dropdown-symbol">&#9660;</div> -->
										</div>
									</div>
									<div class="mb-2 col-3">
										<label for="state">State:<span class="required-field">*</span></label>
											  <div class="dropdown-container">
										
										 <select id="state"
											class="form-control1" style="font-size: 13px">
											<option value="NA">--Select State--</option>
											<option value="andhra_pradesh">Andhra Pradesh</option>
											<option value="arunachal_pradesh">Arunachal Pradesh
											</option>
											<option value="assam">Assam</option>
											<option value="bihar">Bihar</option>
											<option value="chhattisgarh">Chhattisgarh</option>
											<option value="goa">Goa</option>
											<option value="gujarat">Gujarat</option>
											<option value="haryana">Haryana</option>
											<option value="himachal_pradesh">Himachal Pradesh</option>
											<option value="jharkhand">Jharkhand</option>
											<option value="karnataka">Karnataka</option>
											<option value="kerala">Kerala</option>
											<option value="madhya_pradesh">Madhya Pradesh</option>
											<option value="maharashtra">Maharashtra</option>
											<option value="manipur">Manipur</option>
											<option value="meghalaya">Meghalaya</option>
											<option value="mizoram">Mizoram</option>
											<option value="nagaland">Nagaland</option>
											<option value="odisha">Odisha</option>
											<option value="punjab">Punjab</option>
											<option value="rajasthan">Rajasthan</option>
											<option value="sikkim">Sikkim</option>
											<option value="tamil_nadu">Tamil Nadu</option>
											<option value="telangana">Telangana</option>
											<option value="tripura">Tripura</option>
											<option value="uttar_pradesh">Uttar Pradesh</option>
											<option value="uttarakhand">Uttarakhand</option>
											<option value="west_bengal">West Bengal</option>
											<!-- Add more options as needed -->
										</select>
<!-- 										       <div class="dropdown-symbol">&#9660;</div> -->
										</div>
									</div>

									<div class="mb-2 col-3">
										<label for="numberOfDays">Number of Days:<span class="required-field">*</span></label> <input
											type="text" id="numberOfDays" name="numberofdays"
											class="form-control1" required style="font-size: 13px" /> <span
											id="numberofdaysError" class="error"></span>
									</div>

								</div>

								<!-- Add more form fields as needed -->
							</div>
						</div>
					</form>
				</div>
				<div class="mb-2 col-1" id="btn_plus_minus" style="display: none;">

					<button type="button" id="addFormButton"
						 onclick="addForm()">+</button>
					<button type="button" id="removeFormButton" onclick="removeForm()">-</button>

				</div>
			</div>
			<button type="submit" class="btn btn-primary" id="formSubmitButton"
				style="font-size: 14px" >Submit</button>
		</div>
	</div>
	
	
	
    
	
	
	
	<script>
		$.ajax({
			url : "/TTSS03/api/previousTrainings",
			//url: "/TTSS03/TTSS03/api/search/resource",
			type : "GET",
			dataType : "json",
			success : function(data) {
				var resDropdown = $("#trainingDropdown");
				resDropdown.empty();
				resDropdown.append($("<option>").val("NA").text(
				"----Select Training Name----"));
				$.each(data, function(index, item) {
					var optionText = item.trainingname;
					resDropdown.append($("<option>").val(item.trainingname)
							.text(optionText));
				});
			},
			error : function(error) {
				console.log("Error fetching venue data:", error);
			},
		});
	</script>

	<script>
		// Retrieve the treasuryId from session storage
		var treasuryId = sessionStorage.getItem("treasuryId");
		// Check if treasuryId is present in session storagevar

		function showForm1() {
			const form1 = document.getElementById("formm1");
			const form2 = document.getElementById("form2");
			form2.style.display = "none";
			form1.style.display = "block";
			if (treasuryId) {
				// Use the retrieved treasuryId in the AJAX request
				$.ajax({
					type : "GET",
					url : "/TTSS03/api/findteacher?treasuryid=" + treasuryId,
					//url: "/TTSS03/TTSS03/TTSS03/api/findteacher?treasuryid=" + treasuryId,
					dataType : "json",
					success : function(response) {
						var treasury_id = response[0].treasuryid;
						var participant_name = response[0].teacher_name;
						var school_complex_id = response[0].complex_code;
						var wrkdistrict = response[0].districtnamewrk;
						var email = response[0].email;
						var mobile = response[0].mobilenumberteacher;
						var gender = response[0].gender;
						var designation = response[0].designation;
						var workplace = response[0].workplace;
						var fathername = response[0].fathername;
						var dob = response[0].dob;
						var maritalstatus = response[0].maritalstatus;
						var religion = response[0].religion;
						var mothertounge = response[0].mothertongue;
						var adharno = response[0].aadhar;
						var disability = response[0].disability;

						$("#treasuryId1").val(treasury_id);
						$("#participantName").val(participant_name);
						$("#schoolComplexId").val(school_complex_id);
						$("#district").val(wrkdistrict);
						$("#email").val(email);
						$("#mobile").val(mobile);
						$("#gender").val(gender);
						$("#designation").val(designation);
						$("#workplace").val(workplace);
						$("#fathername").val(fathername);
						$("#dob").val(dob);
						$("#maritalstatus").val(maritalstatus);
						$("#religion").val(religion);
						$("#adhaarno").val(adharno);
						$("#mothertounge").val(mothertounge);
						$("#disability").val(disability);
					},
					error : function(error) {
						console.log("Error:", error);
					},
				});
			} else {
				console.log("Treasury Id not found in session storage");
				// Handle the case where treasuryId is not present in session storage
			}
		}
	</script>
<script>
    // Assuming cfmsId is a variable holding the value you want to pass to the API
   // var cfmsId = 14030407;
    //var cfmsId = document.getElementById("cfmsid").value;
    var cfmsId = sessionStorage.getItem("cfmsId");


    // Get references to the radio buttons and forms
    const yesRadio = document.getElementById("enableRadio");
    const noRadio = document.getElementById("disableRadio");

    function showForm2() {
        const form1 = document.getElementById("formm1");
        const form2 = document.getElementById("form2");
        form2.style.display = "block";
        form1.style.display = "none";

        $.ajax({
            type: "GET",
            url: "/TTSS03/api/privateteacher?cfms_id=" + cfmsId,
            dataType: "json",
            success: function (response) {
                $("#cfmsid").val(response.cfms_id);
                $("#teachername").val(response.teacher_name);
                $("#schoolcomplexid").val(response.complex_code);
                $("#districtname").val(response.district_name);
                $("#mail").val(response.email_id);
                $("#mobile1").val(response.mobileno_teacher);
                $("#gender1").val(response.gender);
                $("#workingplace").val(response.workplace);
                $("#fathername1").val(response.father_name);
                $("#dob1").val(response.dob);
                $("#adhaarno1").val(response.aadhar_no);
                $("#maritalstatus1").val(response.marital_status);
                $("#disability1").val(response.disability);
                // Add more fields as needed
            },
            error: function (error) {
                console.log("Error:", error);
            },
        });
    }
</script>

	
	<script>
		function showotherfield() {

			var trainingDropdown = document.getElementById("trainingDropdown");
			var otherField = document.getElementById("otherField");

			if (trainingDropdown.options[trainingDropdown.selectedIndex].text === "OTHER*") {
				//alert("other selected");
				otherField.classList.remove("hidden");
			} else {
				otherField.classList.add("hidden");
			}
		}
	</script>

	<script>
		function showForm() {
			document.getElementById("trainingForm").classList.remove("hidden");
			document.getElementById("enableRadioTrani").checked = true;
			document.getElementById("disableRadioTrani").checked = false;
			document.getElementById("btn_plus_minus").style.display = "block";
			console.log("yes:"
					+ document.getElementById("enableRadioTrani").checked);
		}

		function hideForm() {
			// document.getElementById('trainingForm').classList.add('hidden');
			document.getElementById("disableRadioTrani").checked = true;
			document.getElementById("enableRadioTrani").checked = false;
			console.log("no:"
					+ document.getElementById("disableRadioTrani").checked)
			$("#trainingForm").addClass("hidden");
			document.getElementById("btn_plus_minus").style.display = "none";

			// Hide cloned forms
			for (var i = 1; i <= clonedForms; i++) {
				$("#trainingForm_" + i).addClass("hidden");
			}
		}
		var clonedForms = 0;

		function addForm() {
			clonedForms++;

			// Clone the form
			var clonedForm = $("#trainingForm").clone();

			// Update IDs and make them unique
			var newId = "trainingForm_" + clonedForms;
			clonedForm.attr("id", newId);

			// Clear values in the cloned form
			clonedForm.find('input[type="text"]').val("");
			clonedForm.find("select").prop("selectedIndex", 0);

			// Hide the otherField in the cloned form
			clonedForm.find('#otherField').addClass("hidden");

			// Append the cloned form to the container
			clonedForm.appendTo("#formContainer");

			// Add an event listener to the cloned form's trainingDropdown
			clonedForm.find('#trainingDropdown').on('change', function() {
				var otherField = clonedForm.find('#otherField');
				if (this.options[this.selectedIndex].text === "OTHER*") {
					otherField.removeClass("hidden");
				} else {
					otherField.addClass("hidden");
				}
			});
		}

		function removeForm() {
			if (clonedForms > 0) {
				// Remove the last added form
				$("#trainingForm_" + clonedForms).remove();
				clonedForms--;

			}
		}
	</script>

	<script>
		var isApiCallInProgress = false;
		
		 $(document).ready(function () {
	            $("#formSubmitButton").on("click", function (event) {
	                event.preventDefault();
	                fun();
	            });
		 });
            
            
		var treasuryId = sessionStorage.getItem("treasuryId");
		var urlParams = new URLSearchParams(window.location.search);
		var refPlannerId = urlParams.get("ref_planner_id");
		var venueId = urlParams.get("venue_id");
		
		
// 		function validateForm() {
//             // Get form elements
//             var trainingName = document.getElementById('trainingDropdown');
//             var trainingMode = document.getElementById('trainingMode');
//             var resourceType = document.getElementById('resourceType');
//             var state = document.getElementById('state');
//             var numberOfDays = document.getElementById('numberOfDays');
//             var otherTraining = document.getElementById('otherTraining');
            
//             // Reset error messages
//             //document.getElementById('numberofdaysError').innerHTML = '';

//             // Validate Training Name (Dropdown or Other Training)
//             if (trainingName.value === 'NA' && document.getElementById('otherField').classList.contains('hidden')) {
//                 alert('Please select a valid Training Name or specify Other Training.');
//                 return false;
//             }
           
//             // Validate Training Mode
//             if (trainingMode.value === 'NA') {
//                 alert('Please select a valid Training Mode.');
//                 return false;
//             }

//             // Validate Resource Type
//             if (resourceType.value === 'NA') {
//                 alert('Please select a valid Resource Type.');
//                 return false;
//             }

//             // Validate State
//             if (state.value === 'NA') {
//                 alert('Please select a valid State.');
//                 return false;
//             }

//             // Validate Number of Days
//             if (numberOfDays.value.trim() === '' || isNaN(numberOfDays.value)) {
//                 alert('Please enter a valid number of days.');
//                 return false;
//             }

//             return true;
//         }
		
// 		 function validateAndSubmit() {
//              if (validateForm()) {
//                  fun();
//              }
//          }
		

		function fun() {

			if (document.getElementById("enableRadioTrani").checked) {
						
				saveTraining();
				processData();
				
				
				var formDataArray = [];

				var formDataOriginal = {
					treasuryid : treasuryId,
					trainingname : $("#trainingForm #trainingDropdown").val(),
					trainingmode : $("#trainingForm #trainingMode").val(),
					resourcetype : $("#trainingForm #resourceType").val(),
					state : $("#trainingForm #state").val(),
					numberofdays : $("#trainingForm #numberOfDays").val(),
					othertraining : $("#trainingForm #otherTraining").val(),
				};

				formDataArray.push(formDataOriginal);

				for (var i = 1; i <= clonedForms; i++) {
					var formData2 = {

						treasuryid : treasuryId,

						trainingname : $(
								"#trainingForm_" + i + " #trainingDropdown")
								.val(),

						trainingmode : $(
								"#trainingForm_" + i + " #trainingMode").val(),

						resourcetype : $(
								"#trainingForm_" + i + " #resourceType").val(),

						state : $("#trainingForm_" + i + " #state").val(),

						numberofdays : $(
								"#trainingForm_" + i + " #numberOfDays").val(),
						othertraining : $(
								"#trainingForm_" + i + " #otherTraining").val(),
					};

					formDataArray.push(formData2);
				}

				$
						.ajax({
							type : "POST",
							url : "/TTSS03/api/save/previoustrainings",
							contentType : "application/json",
							data : JSON.stringify(formDataArray),
							success : function(secondResponse) {
								console
										.log(
												"Second POST request (save/previoustrainings) successful:",
												secondResponse);
							},
							error : function(xhr, status, error) {
								console
										.error(
												"Second POST request (save/previoustrainings) error:",
												error);
							},
							complete : function() {
								// Reset the flag after the second API call is complete (success or error)
								isApiCallInProgress = false;
							},
						});

			} else if (document.getElementById("disableRadioTrani").checked) {
				//alert("NO SELECTED"+document.getElementById("disableRadioTrani").checked);
				saveTraining();
				processData();

			} else {
				// Radio button is not checked. Skipping the second request.
				console
						.log("Radio button is not checked. Skipping the second request.");

				// Reset the flag since the second API call won't be made
				isApiCallInProgress = false;
			}
		}

		function saveTraining() {
			// Implement your saveTraining logic here
			console.log("Calling saveTraining API");
			// Example: $.ajax({ ... });
			var formData = {
				treasuryid : treasuryId,
				ref_planner_id : refPlannerId,
				venueid : venueId,
			};

			$.ajax({
				type : "POST",
				url : "/TTSS03/api/savetrainings",
				contentType : "application/json",
				data : JSON.stringify(formData),
				success : function(response) {
					console.log("POST request successful:", response);
					alert("Training Applied successfully!");
					setTimeout(function() {
						window.location.href = '/TTSS03/ApplyTraining.jsp'; // Replace with your target page
					}, 1000);
				},
				error : function(xhr, status, error) {
					console.error("POST request error:", error);
				},
				complete : function() {
					// Reset the flag after the API call is complete (success or error)
					isApiCallInProgress = false;
				},
			});
		}

		// Function to call ProcessData API
		function processData() {
			// Implement your processData logic here
			console.log("Calling ProcessData API");
			// Example: $.ajax({ ... });
			// Call processData API after savetrainings API success
			$
					.ajax({
						type : "POST",
						url : "/TTSS03/api/processData1234",
						data : {
							treasuryId : treasuryId,
							ref_planner_id : refPlannerId,
							venueid : venueId
						},
						success : function(additionalResponse) {
							console
									.log(
											"Additional POST request (processData) successful:",
											additionalResponse);

							// Handle the response of the additional request if needed
						},
						error : function(xhr, status, error) {
							console
									.error(
											"Additional POST request (processData) error: ",
											error);
							// Handle errors for the additional request
						},
					});
		}
		 

		
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>