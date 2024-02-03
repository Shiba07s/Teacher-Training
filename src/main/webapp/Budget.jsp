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
<!-- <div>
     <label for="displayVendor">Fetched Vendor Information:</label>
    <div id="displayVendor"></div>
</div> -->
			
			<h4>Choose Components:</h4>
			
<div id="componentsContainer" class="column">
</div>
 
 
 
 
 
			<!-- Add more checkboxes as needed -->
 
			<button type="button" id="submit" onclick="showTable()">Submit</button>
		</form>
	</div>
 
	<table id="resultTable" style="display: none;">
    <tr>
        <th>Training</th>
        <th>Option</th>
        <th>Limit</th>
        <th>Quantity</th>
        <th>Price per Unit</th>
        <th>Total Amount</th>
    </tr>
<!--     Table rows will be dynamically added here using JavaScript -->
</table>
 
<table id="vendorTable"  style="display: none;">
    <tr>
        <th>SL No</th>
        <th>Vendor Name</th>
        <th>Approved Rate</th>
        <th>Unit</th>
        <th>Vendor Price</th>
        <th>No. Of Day Needed</th>
        <th>Total Amount</th>
    </tr>
</table>
<table id="tadaTable"  style="display: none;">
    <tr>
        <th>SL No</th>
        <th>Budgeted year</th>
        <th>Trainees Role </th>
        <th>Expense Type</th>
        <th>Approved Rate</th>
<!--         <th>HM nos</th> -->
<!--         <th>Teacher nos</th> -->
<!--         <th>HM Price</th> -->
<!--         <th>Teacher Price</th> -->
        <th>Total Amount</th>
    </tr>
</table>
 
<script>
function showTable() {
    // document.getElementById("submit").disabled = true;
    var selectedTraining = document.getElementById("trainingDropdown").value;
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
                        "<td>" + selectedTraining + "</td>" +
                        "<td>" + option + "</td>" +
                        "<td>" + resourceInfo[1] + "</td>" + // Assuming the limit is in the second element of the inner array
                        "<td><input type='text' class='quantity' name='quantity'></td>" +
                        "<td><input type='text' class='pricePerUnit' name='pricePerUnit' oninput='calculateTotal(this)'></td>" +
                        "<td><input type='text' class='totalAmount' name='totalAmount' readonly></td>" +
                        "</tr>";
                    // Append the row to the table
                    document.getElementById("resultTable").innerHTML += row;
                } else {
                    console.error('Resource information not found for', option);
                }
            });
 
            // Show the table
            document.getElementById("resultTable").style.display = "table";
        })
        .catch(error => console.error('Error fetching resource information:', error));
}
 
    function calculateTotal(input) {
        var row = input.closest("tr");
        var quantity = row.querySelector(".quantity").value;
        var pricePerUnit = input.value;
        var totalAmount = quantity * pricePerUnit;
 
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
   <script>
 
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
                url: "/api/components",
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
                    
                    // Update the value of the vendor field
                    vendorField.value = data[0].tagency;
                    
                    var startdate=new Date(data[0].training_start_dt);
                    var enddate=new Date(data[0].training_end_dt);
                    
                    var duration = (enddate - startdate) / (1000 * 60 * 60 * 24);
                    console.log(duration);
				
                   
                    
                     (duration);
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
  function displayTable(data,duration) {
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
	    actualRateInput.addEventListener('input', calculateTotalAmount);
	    noOfDaysNeededInput.addEventListener('input', calculateTotalAmount);
 
	    // Display the table
	    document.getElementById("vendorTable").style.display = "table";
 
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