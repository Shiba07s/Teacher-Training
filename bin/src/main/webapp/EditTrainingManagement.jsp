<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
 
        h1 {
            text-align: center;
            margin-top: 20px;
        }
 
        div {
            margin: 10px 0;
        }
 
        label {
            display: block;
            margin-bottom: 5px;
        }
 
        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
 
        button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
 
        button:hover {
            background-color: #45a049;
        }
    </style>
    <meta charset="ISO-8859-1">
    <title>Edit Training</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
   function getUrlParameter(name) {
       name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
       var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
       var results = regex.exec(location.search);
       return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
   }
    $(document).ready(function () {
        // Function to get URL parameters by name
        
 
        // Get field values from URL parameters
        var managementcode = getUrlParameter("management_code");
    	editManagement(managementcode);
 
        // Set initial values in the input fields
        
 
        // Event handler for Save button
        $("#saveButton").click(function () {
            // Get modified data from input fields
            var modifiedmanagementcode = $("#managementcode").val();
            var modifiedmanagementname = $("#managementname").val();
            var modifiedStatus = $("#status").val();
            
            
         // Validate management name
            if (modifiedmanagementname.trim() === "") {
                alert("Management Name is required");
                return; // Stop further execution if validation fails
            }
 
            // Perform AJAX request to update the data
            $.ajax({
                type: "PUT",  // Assuming you are using PUT method for updates
                url: "/api/updateTrainingManagement/" + modifiedmanagementcode,
                data: {
                	management_name: modifiedmanagementname
                },
                success: function (response) {
                    console.log("Management Type updated successfully");
                    alert("Management Type updated successfully");
                    window.location.href = "/TrainingManagement.jsp";
 
                },
                error: function (xhr, status, error) {
                    console.error("Failed to update training: " + error);
                    alert("Failed to update Management: " + error);
                }
            });
        });
        
        function editManagement(managementcode){
        	
        	$.ajax({
                type: "GET",  // Assuming you are using PUT method for updates
                url: "/api/getbymanagementCodeid/" + managementcode,

                success: function (data) {
                	console.log(data);
                	$("#managementcode").val(data.management_code);
                    $("#managementname").val(data.management_name);
                    $("#status").val(data.status);
 
                },
                error: function (xhr, status, error) {
                    console.error("Failed to update training: " + error);
                    alert("Failed to update Management: " + error);
                }
            });
        	
        	
        }
 
        // Event handler for Exit button
        $("#exitButton").click(function () {
            window.location.href = "/TrainingManagement.jsp";
        });
    });
</script>
 
</head>
<body>
    <h1>Edit Training Spell</h1>
    <div>
        <label for="managementcode">TrainingManagement code:</label>
        <input type="text" id="managementcode" readonly>
    </div>
    <div>
        <label for="managementname">TrainingManagement Name:</label>
        <input type="text" id="managementname">
    </div>
    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" readonly>
    </div>
    <button id="saveButton">Save</button>
    <button id="exitButton">Exit</button>
</body>
</html>
 