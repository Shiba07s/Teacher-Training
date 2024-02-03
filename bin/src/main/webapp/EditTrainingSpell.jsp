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
   function saveSpell(spellcode){
	   var modifiedUid = $("#spellcode").val();
       var modifiedSpell = $("#spell").val();
       var modifiedStatus = $("#status").val();
       
       
    // Validate trainingspell
       if (modifiedSpell.trim() === "") {
           alert(" Training spell field is mandatory ");
           return; // Stop further execution if validation fails
       }

       // Perform AJAX request to update the data
       $.ajax({
           type: "PUT",  // Assuming you are using PUT method for updates
           url: "/api/updateTrainingSpell/" + modifiedUid,
           data: {
               spell: modifiedSpell
           },
           success: function (response) {
               console.log("Spell updated successfully");
               alert("Spell updated successfully");
               window.location.href = "/TrainingSpell.jsp";

           },
           error: function (xhr, status, error) {
               console.error("Failed to update training: " + error);
               alert("Failed to update spell: " + error);
           }
       });
   }
   function editSpell(spellcode){
	   $.ajax({
           type: "GET",  // Assuming you are using PUT method for updates
           url: "/api/getbyspellid/" + spellcode,
           success: function (data) {
        	   $("#spellcode").val(data.spellcode);
               $("#spell").val(data.spell);
               $("#status").val(data.status);
           },
           error: function (xhr, status, error) {
               console.error("Failed to update training: " + error);
               alert("Failed to update spell: " + error);
           }
       });
   }
    $(document).ready(function () {
        // Function to get URL parameters by name
        

        // Get field values from URL parameters
        var spellcode = getUrlParameter("spellcode");
		editSpell(spellcode);
        // Set initial values in the input fields
        

        // Event handler for Save button
        $("#saveButton").click(function () {
            // Get modified data from input fields
           saveSpell(spellcode);
        });

        // Event handler for Exit button
        $("#exitButton").click(function () {
            window.location.href = "/TrainingSpell.jsp";
        });
    });
</script>

</head>
<body>
    <h1>Edit Training Spell</h1>
    <div>
        <label for="spellcode">Spell Code:</label>
        <input type="text" id="spellcode" readonly>
    </div>
    <div>
        <label for="spell">Spell:</label>
        <input type="text" id="spell">
    </div>
    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" readonly>
    </div>
    <button id="saveButton">Save</button>
    <button id="exitButton">Exit</button>
</body>
</html>

