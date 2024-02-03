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
        var resourcecode = getUrlParameter("resourcecode");
        editResource(resourcecode);

        

        // Event handler for Save button
        $("#saveButton").click(function () {
            // Get modified data from input fields
            var modifiedresourcecode = $("#resourcecode").val();
            var modifiedresource = $("#resourcetype").val();
            var modifiedStatus = $("#status").val();
            
            
            // Validate Resource type
            if (modifiedresource.trim() === "") {
                alert("Resource Type is required");
                return; // Stop further execution if validation fails
            }

            // Perform AJAX request to update the data
            $.ajax({
                type: "PUT",  // Assuming you are using PUT method for updates
                url: "/api/updateResourceType/" + modifiedresourcecode,
                data: {
                    resourcetype: modifiedresource
                },
                success: function (response) {
                    console.log("Resource Type updated successfully");
                    alert("Resource Type updated successfully");
                    window.location.href = "/ResourceType.jsp";

                },
                error: function (xhr, status, error) {
                    console.error("Failed to update training: " + error);
                    alert("Failed to update spell: " + error);
                }
            });
        });
        
        
        function editResource(resourcecode){
        	$.ajax({
                type: "GET",  // Assuming you are using PUT method for updates
                url: "/api/getReesourceCodeByid/" + resourcecode,

                success: function (data) {
                	console.log(data);
                	// Set initial values in the input fields
                    $("#resourcecode").val(data.resourcecode);
                    $("#resourcetype").val(data.resourcetype);
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
            window.location.href = "/ResourceType.jsp";
        });
    });
</script>

</head>
<body>
    <h1>Edit Training Spell</h1>
    <div>
        <label for="resourcecode">ResourceType code:</label>
        <input type="text" id="resourcecode" readonly>
    </div>
    <div>
        <label for="resourcetype">Resource Type:</label>
        <input type="text" id="resourcetype">
    </div>
    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" readonly>
    </div>
    <button id="saveButton">Save</button>
    <button id="exitButton">Exit</button>
</body>
</html>

