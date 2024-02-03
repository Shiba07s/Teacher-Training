<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Training Category</title>
  
  <!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f4f4f4;
    }
 
    .container {
      max-width: 400px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
 
    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
 
    input {
      width: 100%;
      padding: 8px;
      margin-bottom: 20px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
 
    .button-container {
      display: flex;
      justify-content: space-between;
    }
 
    button {
      flex: 1;
      padding: 10px;
      cursor: pointer;
      border: none;
      border-radius: 5px;
      font-weight: bold;
    }
 
    .save-button {
      background-color: #008CBA;
      color: white;
      margin-right: 10px;
    }
 
    .close-button {
      background-color: #f44336;
      color: white;
      margin-left: 10px;
    }
 
    button:hover {
      opacity: 0.8;
    }
  </style>
</head>
<body>
<form id="addSessionForm" onsubmit="return saveGroup()">
 
  <div class="container">
    <h2>Add Resource</h2>
    <div>
    <label for="resource">Resource type:</label>
    <input type="text" id="resource" placeholder="Enter resourcetype" required>
     <p id="pname" style="color: red;"></p>
    </div>
 
    <div class="button-container">
      <button type="button" class="save-button" onclick="saveGroup()">Save</button>
      <button type="button" class="close-button" onclick="closeForm()">Close</button>
    </div>
  </div>
  </form>
<script>
        $(document).ready(function() {
            function validateForm() {
                var attendgrade = $("#resource").val();
                 
 
                if (attendgrade.trim() === "") {
                    document.getElementById("pname").innerHTML = "Training Grade is required";
                    return false;
                } else {
                    document.getElementById("pname").innerHTML = "";
                    return true;
                }
 
               
            }
 
            window.saveGroup = function() {
                if (validateForm()) {
                    // Collect form data and create a JSON object
                    var formData = {
                    		resourcetype : $("#resource").val()
                        
                    };
 
                    // Make a POST request to the api/savedata endpoint
                    $.ajax({
                        type : "POST",
                        url : "/api/create/resourceType",
                        contentType : "application/json",
                        data : JSON.stringify(formData),
                        success : function(response) {
                            console.log(response);
                            toastr.success("New Resource type saved successfully");
                            setTimeout(function(){
                            window.location.href = "/ResourceType.jsp";
                        },1000)
                        },
                        error : function(xhr, status, error) {
                            console.error("API request error: " + error);
                            toastr.error("Failed to save training data");
                        }
                    });
                }
 
                // Prevent the default form submission
                return false;
            }
            window.closeForm = function() {
                // Redirect to session.jsp
                window.location.href = "/ResourceType.jsp";
            }
        });
    </script>
  
</body>
</html>