<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>TTSS</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/js/bootstrap.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">
                <img src="./assets/logo.png" width="30" height="30">
            </div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab1')">Dashboard</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab2')">Apply Traning</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!"
                    onclick="showTab('tab3')">View Traning</a>
                <!-- Master Setup  menu -->
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <div class="container-fluid">
                    <div id="sidebarToggle">
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                        <div style="width: 35px; height: 5px; background-color: black; margin: 6px 0;"></div>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span>
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <a class="nav-link ms-auto text-center text-info" href="#!"> Teacher Traning Support System</a>
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path fill-rule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#!">Profile</a>
                                    <a class="dropdown-item" href="#!">Setting</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#!">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <!-- ######################### View Achedemic calender #################### -->
            <div class="container mt-2 tab-content" id="tab1" style="display: none;">


                <div class=""><b>Dashboard</b>
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


            </div>

            <!-- Traning Schudule Form -->
            <div class="container tab-content " id="tab2" >
                <!-- Form Start  -->
                <div class="mt-1"><b>Apply Traning</b>
                </div>
                

                <div class="container mt-2">
                    <div class="card">
                        <div class="card-body">
                        <div class="row">
                            <div class="mb-2 col-5">
                                <label for="exampleFormControlInput1" class="form-label text-danger">
                                    *Goverment or Treasury Employee: </label>
                            </div>
                            <div class="mb-2 col-1">
                            <input type="radio" name="options" value="enable" id="enableRadio"> Yes
                            </div>
                            <div class="mb-2 col-2">
                                <input type="radio" name="options" value="disable" id="disableRadio"> No
                            </div>
                            
                        </div>
                        <form>
                            <div class="row mt-3">
                                <div class="mb-2 col-3">
                                    <label for="targetField" class="form-label">Treasury
                                        Id</label>
                                        <input type="text" class="form-control" id="targetField" placeholder="jhon" disabled>
                                    <!-- <input type="input" class="form-control"
                                        id="exampleFormControlInput1" placeholder="jhon@example.com"> -->
                                </div>
                                <div class="mb-2 col-3">
                                    <label for="exampleFormControlInput1" class="form-label">Participant
                                        Name</label>
                                    <input type="input" class="form-control"
                                        id="exampleFormControlInput1" placeholder="Jhon Doe">
                                </div>
                                <div class="mb-2 col-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">School
                                        Complex Id</label>
                                    <input type="input" class="form-control"
                                        id="exampleFormControlInput1" placeholder="11089">
                                </div>
                            </div>
                            <div class="row">
                                <div class="mb-2 col-3">
                                    <label for="exampleFormControlInput1" class="form-label">Email</label>
                                    <input type="Email" class="form-control"
                                        id="exampleFormControlInput1" placeholder="jhon@example.com">
                                </div>
                                <div class="mb-2 col-3">
                                    <label for="exampleFormControlInput1" class="form-label">Mobile
                                        </label>
                                    <input type="input" class="form-control"
                                        id="exampleFormControlInput1" placeholder="99999999">
                                </div>
                                
                            </div>
                            <div class="row mt-2">

                                <div class="mb-2 col-5">
                                    <label for="tenable" class="form-label text-danger">
                                        *Have you attened any Traning before: </label>
                                </div>
                                <div class="mb-2 col-1">
                                <input type="radio" name="options" value="enable" id="enableRadioTrani"> Yes
                                </div>
                                <div class="mb-2 col-2">
                                    <input type="radio" name="options" value="disable" id="disableRadioTrani"> No
                                </div>
                            </div>

                            <div class="mb-2 col-3">
                                    <!-- <label for="tenable">Traning Name(if Attened):</label> -->
                                    <input type="text" id="tenable"  class="form-control" placeholder="Type something here" disabled>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                   </div>
                   </div>
                </div>    
                
                <!-- For *Goverment or Treasury Employee: -->
                <script>
                    // Get the radio buttons and the target field for *Goverment or Treasury Employee:
                    const enableRadio = document.getElementById('enableRadio');
                    const disableRadio = document.getElementById('disableRadio');
                    const targetField = document.getElementById('targetField');
            
                    // Add event listeners to the radio buttons
                    enableRadio.addEventListener('click', function () {
                        targetField.disabled = false;
                    });
            
                    disableRadio.addEventListener('click', function () {
                        targetField.disabled = true;
                    });
                </script>

                <!-- for  tranning -->

                <script>
                    // Get the radio buttons and the target field
                    const enableRadiot = document.getElementById('enableRadioTrani');
                    const disableRadiot = document.getElementById('disableRadioTrani');
                    const targetFieldt = document.getElementById('tenable');
            
                    // Add event listeners to the radio buttons
                    enableRadiot.addEventListener('click', function () {
                        targetFieldt.disabled = false;
                    });
            
                    disableRadiot.addEventListener('click', function () {
                        targetFieldt.disabled = true;
                    });
                </script>
                

            </div>


            <!-- ################view Tranning  ######################### -->
            <div class="container mt-2 tab-content" id="tab3" style="display: none;">

                <div class="card mt-2">
                    <div class="card-header"><b>View Traning</b></div>
                    <div class="card-body">
                        <div id="viewTraning"></div>
                    </div>
                </div>
            </div>
            <script>
                // Replace 'example.xlsx' with the path to your Excel file
                var excelFileURL = './file.xlsx';

                fetch(excelFileURL)
                    .then(function (response) {
                        return response.arrayBuffer();
                    })
                    .then(function (data) {
                        var workbook = XLSX.read(data, { type: 'array' });

                        // Assuming you want to display the first sheet's data
                        var firstSheetName = workbook.SheetNames[0];
                        var worksheet = workbook.Sheets[firstSheetName];
                        var excelData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

                        // Display the Excel data
                        var tableHTML = '<table class="table table-striped table-bordered">';
                        for (var i = 0; i < excelData.length; i++) {
                            tableHTML += '<tr>';
                            for (var j = 0; j < excelData[i].length; j++) {
                                tableHTML += '<td>' + excelData[i][j] + '</td>';
                            }
                            tableHTML += '</tr>';
                        }
                        tableHTML += '</table>';

                        document.getElementById('viewTraning').innerHTML = tableHTML;
                    })
                    .catch(function (error) {
                        console.error('Error loading Excel file:', error);
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