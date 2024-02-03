<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Training Selection</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 20px;
}
 
.container {
	max-width: 700px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
 
label {
/* 	display: block; */
	margin-bottom: 10px;
	font-weight: bold;
	margin-right: 10px;
}
 
select, input {
/* 	width: 100%; */
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
		margin-right: 10px;
	
}
 
/* input[type="checkbox"] {
/* 	margin-right: 5px;
/* } */
 
button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
 
button:hover {
	background-color: #45a049;
}
 
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}
 
th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}
 
.row {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 16px;
}
 
/* Style for each column */
.column {
	flex: 1;
	margin-bottom: 16px;
}
    #resultTable,
        #vendorTable,
        #teacherTable,
        #tadaTable {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
 
        #resultTable th,
        #resultTable td,
        #vendorTable th,
        #vendorTable td,
        #teacherTable th,
        #teacherTable td,
        #tadaTable th,
        #tadaTable td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
</head>
<body>
	<div class="container">
		<form id="trainingForm" action="#" method="post">
			<label for="trainingDropdown">Select Training:</label>
			 <select
				id="trainingDropdown"   onchange="search()">
				
				<!-- Add more training options as needed -->
			</select>
			
			<div>
    <label for="vendorInput">Vendor For This Training :</label>
    <input type="text" id="vendor" >
</div>
 
<div>
    <label for="venueInput">Venue For This Training:</label>
    <input type="text" id="venue" >
</div>

<div>
    <label for="venuename">Venue Name This Training:</label>
    <input type="text" id="venuename" >
</div>
<div style="display: none;">
    <label for="venueInput">Training Id:</label>
    <input type="text" id="trainingId" >
</div>

			
			<h4>Choose Components:</h4>
			
<div id="componentsContainer" class="column">
</div>
 
 
			<button type="button" id="submit" onclick="showTable()">Set Actual Price </button>
		</form>
		
		
	</div>
<h2 id="resultHeading" style="display: none;">Training Results</h2>
	<table id="resultTable" style="display: none;">
    <tr>
        
        <th>Components</th>
        <th>Limit</th>
        <th>Quantity</th>
        <th>Price per Unit</th>
        
        <th>Total Amount</th>
        <th>Unit</th>
    </tr>
    <!-- Table rows will be dynamically added here using JavaScript -->
</table>
	<h2 id="vendorHeading" style="display: none;">Vendor Information</h2>
<table id="vendorTable"  style="display: none;">
    <tr>
        <th>SL No</th>
        <th>Vendor Name</th>
        <th>Approved Price</th>
        <th>Unit</th>
        <th>Vendor Price</th>
        <th>No. Of Day Needed</th>
        <th>Total Amount</th>
    </tr>
</table>
 
 


			
<div id="count" class="column" style="display: none;">
<h4>No of HM and Teachers Applied For This Training</h4>


			<div>
			    <label for="hm">HM For This Training:</label>
			    <input type="text" id="hm" >
			</div>
			
			
			<div>
			    <label for="teacher">Teachers For This Training:</label>
			    <input type="text" id="teacher" >
			</div>
			
			<div>
			    <label for="total">Total Participants For This Training:</label>
			    <input type="text" id="total" >
			</div>

</div>

<table id="tadaTable"  style="display: none;">
    <tr>
        <th>SL No</th>
        <th>Budgeted year</th>
        <th>Trainees Role </th>
        <th>Expense Type</th>
        <th>Approved Rate</th>
        <th>Unit</th>
        
        <th>Actual Price</th>
        <th>No of Teacher/HM</th>
        <th>Total Amount</th>
    </tr>
</table>
 
 
<script>



function fetchTraineeLimits() {
    const trainingId = $('#trainingDropdown').val();
    const venueId = $('#venue').val();

    // Declare countofhm outside the loop to make it accessible in the broader scope
    var countofhm;

    $.ajax({
        type: 'GET',
        url: '/api/traineeLimit',
        success: function (data) {
            const table = document.getElementById('tadaTable');
            table.innerHTML = '';

            const headingsRow = table.insertRow();
            const headings = ['SL No', 'Budgeted Year', 'Trainee Role', 'Expense Type', 'Approved Rate', 'Actual Price', 'Total Amount','No. Of HM/Teacher','Unit'];

            headings.forEach(function (heading) {
                const headingCell = headingsRow.insertCell();
                headingCell.textContent = heading;
            });

            const NoofhmteacherCells = []; // Array to store cells

            data.forEach(function (traineeLimit, index) {
                const row = table.insertRow();

                const slnoCell = row.insertCell(0);
                const budgetedYearCell = row.insertCell(1);
                const traineeRoleCell = row.insertCell(2);
                const expenseTypeCell = row.insertCell(3);
                const approvedRateCell = row.insertCell(4);

                const actualPriceCell = row.insertCell(5);
                const actualPriceInput = document.createElement('input');
                actualPriceInput.type = 'text';
                actualPriceInput.name = 'actualPrice';
                actualPriceInput.addEventListener('input', function() {
                    calculateTotalAmount(traineeLimit);
                });
                actualPriceCell.appendChild(actualPriceInput);

                const totalAmountCell = row.insertCell(6);
                const NoofhmteacherCell = row.insertCell(7);
                const unitCell = row.insertCell(8);

                NoofhmteacherCells.push(NoofhmteacherCell); // Add to array

                slnoCell.textContent = index + 1;
                budgetedYearCell.textContent = traineeLimit.budgetedYear;
                traineeRoleCell.textContent = traineeLimit.traineeRole;
                expenseTypeCell.textContent = traineeLimit.expenseType;
                approvedRateCell.textContent = traineeLimit.approvedRate;
                unitCell.textContent = traineeLimit.unit;

//                 // Set the value of NoofhmteacherCell based on the trainee role
//                 if (traineeLimit.traineeRole.toLowerCase() === 'hm') {
//                     NoofhmteacherCell.textContent = countofhm.hm;
//                 } else if (traineeLimit.traineeRole.toLowerCase() === 'teacher') {
//                     NoofhmteacherCell.textContent = countofhm.teacher;
//                 } else {
//                     NoofhmteacherCell.textContent = ''; // Handle other cases
//                 }

                function calculateTotalAmount(currentTraineeLimit) {
                    const actualPrice = parseFloat(actualPriceInput.value) || 0;
                    const hmValue = parseFloat(document.getElementById('hm').value) || 0;
                    const teacherValue = parseFloat(document.getElementById('teacher').value) || 0;

                    let totalAmount;

                    if (currentTraineeLimit.traineeRole.toLowerCase() === 'hm') {
                        totalAmount = actualPrice * hmValue;
                    } else if (currentTraineeLimit.traineeRole.toLowerCase() === 'teacher') {
                        totalAmount = actualPrice * teacherValue;
                    } else {
                        totalAmount = 0; // Default value if not HM or Teacher
                    }

                    totalAmountCell.textContent = totalAmount;

                    // Set the value of NoofhmteacherCell using the array
                    NoofhmteacherCells[index].textContent = (currentTraineeLimit.traineeRole.toLowerCase() === 'hm')
                        ? countofhm.hm
                        : (currentTraineeLimit.traineeRole.toLowerCase() === 'teacher')
                            ? countofhm.teacher
                            : '';
                }
            });

            // Fetch data from the second API for HM and Teacher counts
            $.ajax({
                type: 'GET',
                url: '/api/teacherCounts?refPlannerId=' + trainingId + '&venueId=' + venueId,
                success: function (teacherCountData) {
                    // Get the div elements by their IDs
                    const hmDiv = document.getElementById('hm');
                    const teacherDiv = document.getElementById('teacher');
                    const totalDiv = document.getElementById('total');

                    // Set the values from the API response
                    hmDiv.value = teacherCountData.HM;
                    teacherDiv.value = teacherCountData.Teachers;

                    // Calculate and set the total value
                    const totalParticipants = parseInt(teacherCountData.HM) + parseInt(teacherCountData.Teachers);
                    totalDiv.value = totalParticipants;

                    // Set countofhm using the API response
                    countofhm = {
                        hm: teacherCountData.HM,
                        teacher: teacherCountData.Teachers
                    };

                    // Set the value of NoofhmteacherCell for each row
                    NoofhmteacherCells.forEach(function (cell, index) {
                        const currentTraineeLimit = data[index];
                        cell.textContent = (currentTraineeLimit.traineeRole.toLowerCase() === 'hm')
                            ? countofhm.hm
                            : (currentTraineeLimit.traineeRole.toLowerCase() === 'teacher')
                                ? countofhm.teacher
                                : '';
                    });
                },
                error: function (error) {
                    console.error('Error fetching teacher counts data:', error);
                }
            });
        },
        error: function (error) {
            console.error('Error fetching trainee limit data:', error);
            alert('Error fetching trainee limit data. Please try again.');
        }
    });
}


 
function showTable() {
    var selectedTrainingDropdown = document.getElementById("trainingDropdown");
    var selectedTrainingOption = selectedTrainingDropdown.options[selectedTrainingDropdown.selectedIndex];
    var selectedTraining = {
        text: selectedTrainingOption.text,
        value: selectedTrainingOption.value
    };
    var selectedOptions = getSelectedOptions();

    // Fetch limits from API
    fetch('api/resources-and-rates?resourceNames=' + selectedOptions.join(','))
        .then(response => response.json())
        .then(data => {
            // Create a table row for each selected option
            selectedOptions.forEach(function (option) {
                // Find the resource information for the current option
                const resourceInfo = data.find(resource => resource[0] === option);

                if (resourceInfo) {
                    var row = "<tr>" +
                        "<td>" + option + "</td>" +
                        "<td>" + resourceInfo[1] + "</td>" +
                        "<td><input type='text' class='quantity' name='quantity'></td>" +
                        "<td><input type='text' class='pricePerUnit' name='pricePerUnit' oninput='calculateTotal(this, \"" + resourceInfo[2] + "\")'></td>" +
                        "<td><input type='text' class='totalAmount' name='totalAmount' readonly></td>" +
                        "<td>" + resourceInfo[2] + "</td>" +
                        "</tr>";
                    // Append the row to the table
                    document.getElementById("resultTable").innerHTML += row;
                } else {
                    console.error('Resource information not found for', option);
                }
            });

            // Show the table
            document.getElementById("resultTable").style.display = "table";
            document.getElementById("vendorTable").style.display = "table";
            document.getElementById("tadaTable").style.display = "table";
            document.getElementById("post").style.display = "block";

        })
        .catch(error => console.error('Error fetching resource information:', error));
}

function calculateTotal(input, unit) {
    var row = input.closest("tr");
    var quantity = row.querySelector(".quantity").value;
    var pricePerUnit = input.value;
    var totalAmount;

    // Check if the unit is "per day"
    if (unit.toLowerCase() === "per day") {
        totalAmount = quantity * pricePerUnit;
    } else {
        totalAmount = pricePerUnit;
    }

    // Set the calculated total amount in the corresponding field
    row.querySelector(".totalAmount").value = totalAmount;
}

    function getSelectedOptions() {
        var options = document.querySelectorAll('input[type="checkbox"]:checked');
        var selectedOptions = [];
 
        options.forEach(function (option) {
            selectedOptions.push(option.value);
        });
 
        return selectedOptions;
    }
    
   
 
    </script>
    			<button type="button" id="post" onclick="postdata()" style="display: none;">Submit </button>
    
   <script>
   
   function postdata() {
	    // Declare modifiedPostData at the beginning
	    let modifiedPostData;

	    // Get values from input fields
	    const trainingId = document.getElementById('trainingDropdown').value;
	    //const trainingname = document.getElementById('trainingDropdown').textContent;
	    const trainingname = trainingDropdown.options[trainingDropdown.selectedIndex].text;


	    //const vendor = document.getElementById('vendor').value;
	    const venueId = document.getElementById('venue').value;
	    const venueName = document.getElementById('venuename').value;

	    // Get data from the resultTable
	    const resultTableData = getTableValues('resultTable');

	    // Get data from the vendorTable
	    const vendorTableData = getTableValues('vendorTable');

	    // Get data from the tadaTable
	    const tadaTableData = getTableValues('tadaTable');

	    const mappedResultTableData = resultTableData.map(item => {
	        console.log('Mapped Result Table Item:', item);
	        return {
	            tcname: item['components'] || '',
	            estimatedbudget: item['limit'] || 0,
	            frequency: item['quantity'] || 0,
	            amount: item['price per unit'] || 0,
	            sanctionedbudget: item['total amount'] || 0,
	            unit: item['unit'] || ''
	        };
	    });

	    // Mapping logic for vendorTableData
	    const mappedVendorTableData = vendorTableData.map(item => {
	        console.log('Mapped Vendor Table Item:', item);
	        return {
	            tcname: item['vendor name'] || '',
	            estimatedbudget: item['approved price'] || 0,
	            frequency: item['no. of day needed'] || 0,
	            amount: item['vendor price'] || 0,
	            sanctionedbudget: item['total amount'] || 0,
	            unit: item['unit'] || ''
	        };
	    });

	    // Mapping logic for tadaTableData
	    const mappedTadaTableData = tadaTableData.map(item => {
	        console.log('Mapped TADA Table Item:', item);
	        return {
	            tcname: item['expense type'] || '',
	            estimatedbudget: item['approved rate'] || 0,
	            frequency: item['no. of hm/teacher'] || 0,
	            amount: item['actual price'] || 0,
	            sanctionedbudget: item['total amount'] || 0,
	            traineerole: item['trainee role'] || '',
	            unit: item['unit'] || ''

	        };
	    });
	    // Now construct the final postData object
	   modifiedPostData = 
//     trainingId: trainingId,
//     budgetedyear: "23-24",
//     venue: venue,
    [
    	 ...mappedResultTableData,
         ...mappedVendorTableData,
         ...mappedTadaTableData
    ];


	    console.log(modifiedPostData);

	    // Make a POST request to your API endpoint
	    $.ajax({
	        type: 'POST',
	        url: '/api/save/bdgtmapping?trainingid=' + trainingId + '&trainingname=' + trainingname + '&budgetedyear=23-24'+'&venueid='+ venueId + '&vname='+venueName,
	        contentType: 'application/json',
	        data: JSON.stringify(modifiedPostData),
	       
	        success: function (response) {
	            console.log('POST request successful:', response);
	            alert("Budget Mapping for" +trainingname+"Successfully")
	        },
	        error: function (error) {
	            console.error('Error making POST request:', error);
	        }
	    });
	}

	function getTableValues(tableId) {
	    const table = document.getElementById(tableId);
	    const data = [];

	    // Iterate through rows (skip the first row with headers)
	    for (let i = 1; i < table.rows.length; i++) {
	        const row = table.rows[i];
	        const rowData = {};

	        // Iterate through cells
	        for (let j = 0; j < row.cells.length; j++) {
	            const cell = row.cells[j];
	            const columnName = table.rows[0].cells[j].textContent.trim();

	            // Check if the cell contains an input field
	            const inputField = cell.querySelector('input');
	            if (inputField) {
	                rowData[columnName.toLowerCase()] = inputField.value.trim();
	            } else {
	                rowData[columnName.toLowerCase()] = cell.textContent.trim();
	            }
	        }

	        data.push(rowData);
	    }

	    return data;
	}

    
  		$(document).ready(function() {
            // Fetch training names from the API endpoint
            $.ajax({
                type: "GET",
                url: "/api/scheduledTrainings1",
                success: function(data) {
                    const trainingDropdown = $("#trainingDropdown");
                    trainingDropdown.append('<option value="" disabled selected>Select a Training</option>'); // Clear previous content
 
                    $.each(data, function(index, training) {
                        trainingDropdown.append($('<option>', {
                            value: training.ref_planner_id,
                            text: training.tname
                        }));
                    });
                },
                error: function(error) {
                    console.error('Error fetching training data:', error);
                }
            });
            
            
            
            $.ajax({
                type: "GET",
                url: "/api/component/components",
                success: function (data) {
                    // Assuming data is an array of objects, each representing a component
                    const componentsContainer = document.getElementById('componentsContainer');
 
                    data.forEach(function (component, index) {
                        // Create a new checkbox element
                        const checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.id = 'option' + (index + 1); // Generate a unique ID for each checkbox
                        checkbox.name = 'components';
                        checkbox.value = component.resources; // Assuming the 'name' property in your API represents the component name
 
                        // Create a label for the checkbox
                        const label = document.createElement('label');
                        label.htmlFor = 'option' + (index + 1);
                        label.appendChild(document.createTextNode(component.resources)); // Display the component name as the label text
 
                        // Create a div to hold the checkbox and label
                        const div = document.createElement('div');
                        div.appendChild(checkbox);
                        div.appendChild(label);
 
                        // Append the div to the componentsContainer
                        componentsContainer.appendChild(div);
                    });
                },
                error: function (error) {
                    console.error('Error fetching component details:', error);
                    alert('Error fetching component details. Please try again.');
                }
            });
 
        });
        function search() {
            const selectedTrainingId = document.getElementById('trainingDropdown').value;
 
            // Fetch training details from the API
            $.ajax({
                type: "GET",
                url: "/api/scheduledTrainingsbyid?ref_planner_id=" + selectedTrainingId,
                success: function (data) {
                    // Assuming data[0].tagency contains the vendor information for the first item
                    const vendorField = document.getElementById('vendor');
                    const venueField = document.getElementById('venue');
                    const venuenameField = document.getElementById('venuename');
                    
                    // Update the value of the vendor field
                    vendorField.value = data[0].tagency;
                    venueField.value=data[0].venue_id;
                    venuenameField.value=data[0].venue_name;
                    var startdate=new Date(data[0].training_start_dt);
                    var enddate=new Date(data[0].training_end_dt);
                    
                    var duration = (enddate - startdate) / (1000 * 60 * 60 * 24);
                    console.log(duration);
				
                   
                    
                    searchVendor(duration);
                    fetchTraineeLimits();
                },
                error: function (error) {
                    console.error('Error fetching training details:', error);
                    alert('Error fetching training details. Please try again.');
                }
            });
        }
        
        // Your existing JavaScript code here
    let slnoCounter = 1;
 
  function searchVendor(duration) {
    const selectedVendor = document.getElementById('vendor').value;
    
    console.log(selectedVendor);
    
    $.ajax({
        type: "GET",
        url: "/api/vendors?vendorName=" + selectedVendor,
        success: function (data) {
            // Assuming data[0].tagency contains the vendor information for the first item
            const vendorField = document.getElementById('displayVendor');
 
            // Update the value of the vendor field
            //vendorField.textContent = data.approvedrate ? data.approvedrate : 'No vendor information found';
 
            displayTable(data,duration);
 
        },
        error: function (error) {
            console.error('Error fetching vendor details:', error);
            alert('Error fetching vendor details. Please try again.');
        }
    });
}
  function displayTable(data, duration) {
	    // Assuming you have a table with the id "vendorTable"
	    const table = document.getElementById('vendorTable');

	    // Create a new row
	    const row = table.insertRow();

	    // Add cells to the row
	    const slnoCell = row.insertCell(0);
	    const vendorNameCell = row.insertCell(1);
	    const approvedRateCell = row.insertCell(2);
	    const unitCell = row.insertCell(3);
	    const actualRateCell = row.insertCell(4);
	    const noOfDaysNeededCell = row.insertCell(5);
	    const totalAmountCell = row.insertCell(6);

	    // Populate cells with data
	    slnoCell.textContent = slnoCounter++;
	    vendorNameCell.textContent = data.vendorName;
	    approvedRateCell.textContent = data.approvedrate;
	    unitCell.textContent = data.unit;

	    // Create an input field for the Actual Rate cell
	    const actualRateInput = document.createElement('input');
	    actualRateInput.type = 'text';
	    actualRateInput.name = 'actualRate';
	    actualRateCell.appendChild(actualRateInput);

	    // Create an input field for the No of Days Needed cell
	    const noOfDaysNeededInput = document.createElement('input');
	    noOfDaysNeededInput.type = 'text';
	    noOfDaysNeededInput.name = 'noOfDaysNeeded';
	    noOfDaysNeededInput.readOnly = true;
	    noOfDaysNeededCell.appendChild(noOfDaysNeededInput);

	    // Set the value of the No of Days Needed field
	    noOfDaysNeededInput.value = duration;

	    // Create an input field for the Total Amount cell
	    const totalAmountInput = document.createElement('input');
	    totalAmountInput.type = 'text';
	    totalAmountInput.name = 'totalAmount';
	    totalAmountInput.readOnly = true; // Set it to readonly
	    totalAmountCell.appendChild(totalAmountInput);

	    // Attach an event listener to calculate the total amount when either the Actual Rate or No of Days Needed changes
	    actualRateInput.addEventListener('input', function () {
	        // Check if the unit is "per day" before calling calculateTotalAmount
	        if (data.unit.toLowerCase() === 'per day') {
	            calculateTotalAmount();
	        } else {
	            // If unit is not "per day," set the total amount equal to the actual rate
	            totalAmountInput.value = actualRateInput.value;
	        }
	    });

	    noOfDaysNeededInput.addEventListener('input', function () {
	        // Check if the unit is "per day" before calling calculateTotalAmount
	        if (data.unit.toLowerCase() === 'per day') {
	            calculateTotalAmount();
	        }
	    });

	    // Display the table
	   // document.getElementById("vendorTable").style.display = "table";

	    // Function to calculate the total amount based on the Actual Rate and No of Days Needed
	    function calculateTotalAmount() {
	        const actualRate = parseFloat(actualRateInput.value) || 0;
	        const noOfDaysNeeded = parseFloat(noOfDaysNeededInput.value) || 0;
	        const totalAmount = actualRate * noOfDaysNeeded;
	        totalAmountInput.value = totalAmount;
	    }
	}

    </script>
 
</body>
</html>