<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Training Support System</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
    $(document).ready(function () {
        $("#scheduleButton").click(function () {
            var trainingRefId = $("#trainingReferenceId").val();
            var tvenueId = $("#venueId").val();
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
            var astartDate = $("#appStartDate").val();
            var aendDate = $("#appEndDate").val();
            var tstartDate = $("#trainingStartDate").val();
            var tendDate = $("#trainingEndDate").val();

            // Construct the formData object
            var formData = {
                ref_planner_id: trainingRefId,
                venue_id: tvenueId,
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
                training_end_dt: tendDate
            };

            var jsonString = JSON.stringify(formData);


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
                dataType: "json",
                success: function (response) {
                    var tmonth = response[0].tmonth;
                    var tyear = response[0].tyear;
                    var tname = response[0].tname;
                    var tdescription = response[0].tdescription;
                   
                    var tmode = response[0].tmode;
                    //var tmodule = response[0].tmodule;
                    var tgrade = response[0].tgrade;
                    var tagency = response[0].tagency;
 
                   
 
                    $("#trainingMonth").val(tmonth);
                    $("#trainingYear").val(tyear);
                    $("#trainingName").val(tname);
                    $("#description").val(tdescription);
                   
                    $("#trainingMode").val(tmode);
                    //$("#module").val(tmodule);
                    $("#grade").val(tgrade);
                    $("#agency").val(tagency);
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
                    dataType: "json",
                    success: function (response) {
                        var vid = response[0].vid;

                        var vmandal = response[0].vmandal;
                        var vstate = response[0].vstate;
                        var vdistrict = response[0].vdistrict;
                        var vlocation = response[0].vlocation;
                        var vcontactname = response[0].vcontactname;
                        var vcontactno = response[0].vcontactno;
                        var vcontactmailid = response[0].vcontactmailid;
                        
                        $("#venueId").val(vid);
                        $("#mandal").val(vmandal);
                        $("#state").val(vstate);
                        $("#district").val(vdistrict);
                        $("#mapLocation").val(vlocation);
                        $("#coordinatorName").val(vcontactname);
                        $("#mobile").val(vcontactno);
                        $("#email").val(vcontactmailid);
                         

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
                $('#mapLocation').val('');
                $('#coordinatorName').val('');
                $('#mobile').val('');
                $('#email').val('');
            }
        });
    });

</script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
 
        .container {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 30px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 700px;
        }
 
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
 
        .form-group {
            margin-bottom: 15px;
        }
 
        label {
            font-weight: bold;
        }
 
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
 
        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>TEACHER TRAINING SUPPORT SYSTEM</h2>
        
        <form action="" method="post" id="scheduleForm">
            <div class="form-group">
                <label for="trainingReferenceId">Training ReferenceId:</label>
                <input type="text" class="form-control" id="trainingReferenceId" name="trainingReferenceId" placeholder="Enter Training ReferenceId..." required>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="searchButton">Search</button>
            </div>
            <div class="form-group">
			    <label for="venue">Venue Name:</label>
			    <select id="venueDropdown" class="form-control"></select>
            </div>
            
          <div class="form-group" style="display: none;">
    <label for="venue">Venue Id:</label>
    <input type="text" class="form-control" id="venueId" name="venueId"  required>
</div>
           
 
            <div class="form-group">
                <label for="trainingMode">Training Mode:</label>
                <input type="text" id="trainingMode" name="trainingMode" placeholder="Enter Training Mode..." required>
            </div>
 
            <div class="form-group">
                <label for="trainingMonth">Training Month:</label>
                <input type="text" id="trainingMonth" name="trainingMonth" placeholder="Enter Training Month..." required>
            </div>
 
            <div class="form-group">
                <label for="trainingYear">Training Year:</label>
                <input type="text" id="trainingYear" name="trainingYear" placeholder="Enter Training Year..." required>
            </div>
 
            <div class="form-group">
                <label for="trainingName">Training Name:</label>
                <input type="text" id="trainingName" name="trainingName" placeholder="Enter Training Name..." required>
            </div>
 
            
 
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" placeholder="Enter Description..." required>
            </div>
 
            <div class="form-group">
                <label for="grade">Grade:</label>
                <input type="text" id="grade" name="grade" placeholder="Enter Grade..." required>
            </div>
 
            <div class="form-group">
                <label for="agency">Agency:</label>
                <input type="text" id="agency" name="agency" placeholder="Enter Agency..." required>
            </div>
            <div class="form-group">
			    <label for="mapLocation">Map Location:</label>
			    <input type="text" id="mapLocation" name="mapLocation" placeholder="Enter Map Location..." required>
			</div>
			<div class="form-group">
			    <label for="coordinatorName">Coordinator Name:</label>
			    <input type="text" id="coordinatorName" name="coordinatorName" placeholder="Enter Coordinator Name..." required>
			</div>
			
			<div class="form-group">
			    <label for="email">Email:</label>
			    <input type="email" id="email" name="email" placeholder="Enter Email..." required>
			</div>
			
			<div class="form-group">
			    <label for="mobile">Mobile:</label>
			    <input type="tel" id="mobile" name="mobile" placeholder="Enter Mobile..." required>
			</div>
			
			<div class="form-group">
			    <label for="state">State:</label>
			    <input type="text" id="state" name="state" placeholder="Enter State..." required>
			</div>
			
			<div class="form-group">
			    <label for="district">District:</label>
			    <input type="text" id="district" name="district" placeholder="Enter District..." required>
			</div>
			
			<div class="form-group">
			    <label for="mandal">Mandal:</label>
			    <input type="text" id="mandal" name="mandal" placeholder="Enter Mandal..." required>
			</div>
            <div class="form-group">
                <label for="appStartDate">Application Start Date:</label>
                <input type="date" id="appStartDate" name="appStartDate" required>
            </div>
 
            <div class="form-group">
                <label for="appEndDate">Application End Date:</label>
                <input type="date" id="appEndDate" name="appEndDate" required>
            </div>
            <div class="form-group">
                <label for="trainingEndDate">Training Start Date:</label>
                <input type="date" id="trainingStartDate" name="trainingStartDate" required>
            </div>
            <div class="form-group">
                <label for="trainingEndDate">Training End Date:</label>
                <input type="date" id="trainingEndDate" name="trainingEndDate" required>
            </div>
           <button type="submit" id="scheduleButton">Submit</button>
        </form>
    </div>
 
    ${msg}
</body>
</html>