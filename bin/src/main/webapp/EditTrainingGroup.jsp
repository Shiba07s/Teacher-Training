
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
    <title>Edit Training Group</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
   function getUrlParameter(name) {
       name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
       var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
       var results = regex.exec(location.search);
       return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
   }
   function saveGroupData(group_id){
	   var modifiedUid = $("#groupCode").val();
       var modifiedGroup = $("#targetgroup").val();
       var modifiedStatus = $("#status").val();
       
    // Validate training group
       if (modifiedGroup.trim() === "") {
           alert(" Target Group field can not be empty");
           return; // Stop further execution if validation fails
       }

       // Perform AJAX request to update the data
       $.ajax({
           type: "PUT",  // Assuming you are using PUT method for updates
           url: "/api/updateTrainingGroup/" + group_id,
           data: {
               targetgroup: modifiedGroup
           },
           success: function (response) {
               console.log("Group updated successfully");
               alert("Group updated successfully");
               window.location.href = "/TrainingGroup.jsp";

           },
           error: function (xhr, status, error) {
               console.error("Failed to update training: " + error);
               alert("Failed to update Group: " + error);
           }
       });
   }
   function editGroup(group_id){
	   $.ajax({
           type: "GET",  // Assuming you are using PUT method for updates
           url: "/api/getbygroupid/" + group_id,
           success: function (data) {
        	   console.log(data)
        	   $("#groupCode").val(data.group_id);
               $("#targetgroup").val(data.targetgroup);
               $("#status").val(data.status);
           },
           error: function (xhr, status, error) {
               console.error("Failed to update training: " + error);
               alert("Failed to update Group: " + error);
           }
       });
   }
    $(document).ready(function () {
        var group_id = getUrlParameter("group_id");
		editGroup(group_id);
 
        // Set initial values in the input fields
        
 
        // Event handler for Save button
        $("#saveButton").click(function () {
            // Get modified data from input fields
            saveGroupData(group_id)
        });
 
        // Event handler for Exit button
        $("#exitButton").click(function () {
            window.location.href = "/TrainingGroup.jsp";
        });
    });
</script>
 
</head>
<body>
    <h1>Edit Training Group</h1>
    <div>
        <label for="spellcode">TrainingGroup Code:</label>
        <input type="text" id="groupCode" readonly>
    </div>
    <div>
        <label for="targetgroup">Target Group:</label>
        <input type="text" id="targetgroup">
    </div>
    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" readonly>
    </div>
    <button id="saveButton">Save</button>
    <button id="exitButton">Exit</button>
</body>
</html>
 