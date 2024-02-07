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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- xlsx.full.min.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>

<!-- Bootstrap JavaScript with Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />


</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">
                <img src="./assets/loggoo.png"  width="110" height="68">
            </div>
            <div class="list-group list-group-flush">
               <!--    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab1')">Dashboard</a>  -->
                <a class="list-group-item list-group-item-action list-group-item-light p-3" id="trId" href="#!"
                    onclick="showTab('tab2')">Apply Traning</a>
                 <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab3')" id="mytrainings">My Traning</a>    
                <!-- Master Setup  menu -->
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom" style="width: 180%;" >
                <div class="container-fluid">
                    <div  id="sidebarToggle" >
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span>
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <h1 class="nav-link ms-auto text-center text-info w-100" style="
                          position: relative;
                          top:-30px;
                          right: -200px;
                          font-size: 25px;
                        justify-content: center;
                        margin-top: 40px;
 
                        color: blue;">Teacher Training Support System</h1> <br>
                         <h2 class="nav-link ms-auto text-center text-info w-100" style=" position: relative;
                         top:10px;
                         right: 330px;
                         font-size: 25px;
                       justify-content: center;
                       margin-top: 40px;
                       color:red;">Govt Of AndhraPradesh</h2>
 
                       
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                           
                            <li class="nav-item dropdown">
                               
                                   <img  src="./assets/logo.png" width="80" height="68"/>
                               
                             
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <!-- ######################### View Achedemic calender #################### -->
           <!--    <div class="container mt-2 tab-content" id="tab1">


                <div class=""><b>Dashboard</b>
                </div>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/2.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 1</h5>
                                        <p class="card-text">Some quick example text for Card 1.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
            
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/3.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 2</h5>
                                        <p class="card-text">Some quick example text for Card 2.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
            
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/1.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 3</h5>
                                        <p class="card-text">Some quick example text for Card 3.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
            
                        <div class="col-md-6">
                            <a href="#" class="card-link">
                                <div class="card">
                                    <img src="../images/2.jpg" class="card-img-top" alt="Placeholder Image">
                                    <div class="card-body">
                                        <h5 class="card-title">Card 4</h5>
                                        <p class="card-text">Some quick example text for Card 4.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="row mt-2">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional
                                    content
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident rem laboriosam
                                    deserunt vel ex. Ipsum, perspiciatis. Nulla impedit animi inventore odit sit iure
                                    ex? Praesentium aspernatur ratione autem sint error..</p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Special title treatment</h5>
                                <p class="card-text">With supporting text below as a natural lead-in to additional
                                    content.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione nisi, alias cum
                                    dolorum minus quidem eius ab placeat quod! Quibusdam saepe culpa accusamus, nam
                                    ratione voluptate vel? Minus, aliquid illum?
                                </p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>   -->


            <!-- Traning Schudule Form -->
<div class="container tab-content" id="tab2" style="width: 180%">
    <div class="mt-1"><b></b></div>
    <div class="card mt-2">
        <div class="table-responsive">
            <table class="table table-hover" id="trainingTable">
                <thead>
                    <tr>
                        <th>Reference Id</th>
                        <th>Training Name</th>
                        <th>Training Mode</th>
                        <th>Training description</th>
                        <th>App start to end</th>
                        <th>Venue Details</th>
                        <th>Co-ordinater Details</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
 <script>
    $(document).ready(function() {
        $("#trId").click(function () {
            $.ajax({
                type: "GET",
                url: "/TTSS03/api/scheduledTrainings",
                dataType: "json",
                success: function(data) {
                    displayTrainingData(data);
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });

        function displayTrainingData(data) {
            var trainings = data;
            trainings.reverse();
            
            var table = document.getElementById("trainingTable");

            table.innerHTML = "<tr><th>Reference Id</th><th>Training Name</th><th>Training Mode</th><th>Description</th><th>App start to end</th><th>Map Location</th><th>Co-ordinater Details</th><th>Action</th></tr>";

            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = table.insertRow(i + 1);

                row.insertCell(0).innerHTML = training.ref_planner_id;
                row.insertCell(1).innerHTML = training.tname;  
                row.insertCell(2).innerHTML = training.tmode;
                row.insertCell(3).innerHTML = training.tdescription;
                row.insertCell(4).innerHTML = training.apply_start_dt;
                row.insertCell(5).innerHTML = training.location;
                row.insertCell(6).innerHTML = training.coordinatorname;

                var applyNowButton = document.createElement("button");
                applyNowButton.textContent = "Apply Now";
                applyNowButton.className = "btn btn-success";

                // Use a function to capture the correct ref_planner_id
                applyNowButton.onclick = createApplyButtonClickHandler(training.ref_planner_id);

                var actionCell = row.insertCell(7);
                actionCell.appendChild(applyNowButton);
            }
        }

        // Function to create a closure and capture the correct ref_planner_id
        function createApplyButtonClickHandler(refPlannerId) {
            return function () {
                // Pass the ref_planner_id to the next page
                redirectToApplyPage(refPlannerId);
            };
        }

        // Function to redirect to the apply_training.html page with the ref_planner_id parameter
        function redirectToApplyPage(refPlannerId) {
            window.location.href = "./apply_traning.html?ref_planner_id=" + refPlannerId;
        }
    });
</script>


			

            <!-- ################view Tranning  ######################### -->
            <div class="container mt-2 tab-content" id="tab3" style="display: none; width: 180%;">

                <div class="card mt-2">
                    <div class="card-header"><b>My Trainings </b></div>
                    <div class="card-body">
                        <div id="myTrainings"></div>
                         <div class="table-responsive">
            <table class="table table-hover" id="mytraining">
                <thead>
                    <tr>
                        <th>Treasury Id</th>
                        <th>Training Name</th>
                        <th>Training Mode</th>
                        <th>Training description</th>
                        <th>Training start to end date</th>
                        <th>Venue Name</th>
                        <th>Venue Address</th>
                        <th>Venue Contact</th>
                        <th>Trainer Name</th>
                        
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
      </div>
    </div>
 </div>
 	<script>
 	
 	
    $(document).ready(function () {
        $("#mytrainings").click(function () {
           var urlParams = new URLSearchParams(window.location.search);
            var searchTerm = urlParams.get('treasuryId');
            console.log(searchTerm);

            $.ajax({
                type: "GET",
                url: "/TTSS03/api/mytrainings?treasuryId=" +searchTerm,
                dataType: "json",
                success: function (data) {
                	console.log(data);
                    displayTrainingData(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                }
            });
        });
 
        function displayTrainingData(data) {
            var trainings = data;
            trainings.reverse();
            var tableBody = $("#mytraining tbody");  // Corrected this line

            // Clear existing rows
            tableBody.empty();

            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = $("<tr></tr>");

                row.append("<td>" + training.treasuryid + "</td>");
                row.append("<td>" + training.tname + "</td>");
                row.append("<td>" + training.tmode + "</td>");
                row.append("<td>" + training.tdescription + "</td>");
                row.append("<td>" + training.startdate + " to " + training.enddate + "</td>");
                row.append("<td>" + training.vname + "</td>");
                row.append("<td>" + training.vaddress + "</td>");
                row.append("<td>" + training.vcontact + "</td>");
                row.append("<td>" + training.trainername + "</td>");

                tableBody.append(row);
            }
        }
    });
 	</script>                

            <!--  script for show hide-->
            <script>
                function showTab(tabId) {
                    var tabs = document.querySelectorAll('.tab-content');
                    for (var i = 0; i < tabs.length; i++) {
                        tabs[i].style.display = 'none';
                    }

                    var tabToShow = document.getElementById(tabId);
                    if (tabToShow) {
                        tabToShow.style.display = 'block';
                    }
                }
            </script>


            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
</body>

</html>