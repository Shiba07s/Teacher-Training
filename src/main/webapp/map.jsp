<!DOCTYPE html>
<html lang="en">
 
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Mapping Details</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f2f2f2;
  }
 
  #content {
    width: 60%;
    margin: 2rem auto;
    padding: 1rem;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
 
  h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #3366cc;
  }
 
  form {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0;
  }
 
  label {
    font-size: 12px;
    display: block;
    margin-bottom: 8px;
    color: #333;
  }
 
  input,
  select {
    display: block;
    width: 100%;
    padding: 12px;
    font-size: 1rem;
    border-radius: 4px;
    border: 1px solid #ccc;
    margin-bottom: 16px;
    box-sizing: border-box;
  }
 
  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.2rem;
    width: 100%;
  }
 
  input[type="submit"]:hover {
    background-color: #45a049;
  }
 
  .row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 16px;
  }
 
  .column {
    flex: 1;
    margin-bottom: 16px;
  }
 
  /* Custom styles for CC Fields */
  #additionalFieldsContainer ,
  #ccFieldsContainer ,
  #accFieldsContainer,
  #rpFieldsContainer,
  #ppFieldsContainer,
  #osFieldsContainer
  
  
  {
    display: flex;
    align-items: center;
    margin-bottom: 16px;
  }
 
#additionalFieldsContainer input ,
#ccFieldsContainer input ,
#accFieldsContainer input,
#rpFieldsContainer input,
#ppFieldsContainer input,
#osFieldsContainer input
 
{
    /* Your custom styles go here */
    width: 100%; /* Adjust the width based on your requirement */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    
    display: block;
     
    margin-bottom: 16px;
    box-sizing: border-box;
    /* Add more styles as needed */
  }
 
  /* Add your custom styles for labels here */
  #additionalFieldsContainer label,
  #ccFieldsContainer label,
   #accFieldsContainer label,
   #rpFieldsContainer label,
   #ppFieldsContainer label,
   #osFieldsContainer label
    {
    /* Your custom styles go here */
/*     display: block; /* Display labels as block elements */ */
    margin-bottom: 8px;
    font-weight: bold;
    color: #3366cc; /* Adjust the color based on your preference */
    /* Add more styles as needed */
  }
 
  /* Add your custom styles for the submit button here */
  #submitbtn {
    /* Your custom styles go here */
    background-color: #4CAF50;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.2rem;
    width: 100%;
    margin-top: 20px; /* Add margin to separate the submit button */
  }
 
  #submitbtn:hover {
    background-color: #45a049;
  }
</style>
 
 
</head>
 
<body>
 
  <h2>Edit Mapping Details</h2>
 
  <form action="#" method="post" id="editMapping">
  
  <div id="dynamicFieldsContainer"></div>
 
 
		<div class="row">
			<div class="column">
				<div id="additionalFieldsContainer">
					<!-- Group name will be dynamically added -->
				</div>
			</div>
		</div>
		<div class="row">
      <div class="column">
        <div id="ccFieldsContainer">
          <h3>CC Fields</h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="accFieldsContainer">
          <h3>ACC Fields</h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="rpFieldsContainer">
          <h3>RP Fields</h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="ppFieldsContainer">
          <h3>PP Fields</h3>
        </div>
      </div>
    </div>
 
    <div class="row">
      <div class="column">
        <div id="osFieldsContainer">
          <h3>OS Fields</h3>
        </div>
      </div>
    </div>
 
    <input type="submit" id="submitbtn" value="Update">
  </form>
 
 
    <script>
    $(document).ready(function () {
      editVenue();
 
      $('#submitbtn').click(function (event) {
        event.preventDefault();
        addData();
      });
      function addData() {
          var venueId = getUrlParameter('slno');
		    var username = sessionStorage.getItem("username");

          $.ajax({
              type: 'GET',
              url: '/api/mapping/data?mappingcode=' + venueId,
              dataType: 'json',
              success: function (existingData) {
                  var formData = {
                      slno: existingData[0].slno,
                      trainingid: existingData[0].trainingid,
                      trainingname: existingData[0].trainingname,
                      venueid: existingData[0].venueid,
                      venuename: existingData[0].venuename,
                      modifiedby:username
                      
                  };
  					//
                  var fieldPrefixes = ['cc', 'acc', 'rp', 'pp', 'os'];
   
                  fieldPrefixes.forEach(function (prefix) {
                      $('#' + prefix + 'FieldsContainer input').each(function () {
                          var inputId = $(this).attr('id');
                          var inputValue = $(this).val();
                          console.log(inputValue);
                          if (existingData[0][inputId]) {
                              var existingArray = existingData[0][inputId].split(',');
                              console.log(existingArray);
   
                              existingArray.forEach(function(existingValue, index) {
                              	//console.log(existingValue,index)
                                  if (existingValue.trim() !== inputValue.trim()) {
                                  	//console.log("HI",index,existingArray[index],inputValue.trim());
                                      existingArray[index] = inputValue.trim();
     
                                  }
                              	
                              });
                             // console.log(existingArray);
                              //inputValue = existingArray.join(',');
                             // console.log(inputValue);
                          }
   
                          // Use the inputId as the key for the formData object
                          // If the key already exists, concatenate the values with a comma
                              if (formData[inputId]) {
                                  formData[inputId] += ',' + inputValue.trim();
                              } else {
                                  // If the field is not present in formData, set the inputValue directly
                                  formData[inputId] = inputValue.trim();
                              }
                      });
                  });
   
                  // Convert formData to JSON string
                  var formDataJson = JSON.stringify(formData);
                  console.log(formData);
   
                 // Now you have the formDataJson, you can proceed with the AJAX call to update the data
                  $.ajax({
                      type: 'PUT',
                      url: '/api/updateMapping/' + venueId,
                      contentType: 'application/json',
                      data: formDataJson,
                      success: function (response) {
                          toastr.success(response);
                          // Redirect immediately after successful AJAX request
                          window.location.href = '/mastermapping2.jsp';
                      },
                      error: function () {
                          alert('Error updating data.');
                      }
                  });
              },
              error: function (xhr, status, error) {
                  console.error('Error fetching venue data:', xhr.responseText);
                  alert('Error fetching venue data. Please check the console for details.');
              }
          });
        }

      function getUrlParameter(name) {
        name = name.replace(/[[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
      }
 
      function editVenue() {
        var mappingcode = getUrlParameter('slno');
 
        if (mappingcode) {
          $.ajax({
            type: 'GET',
            url: '/api/mapping/data?mappingcode=' + mappingcode,
            dataType: 'json',
            success: function (data) {
              if (data && data.length > 0) {
                var firstRecord = data[0];
                
                var dynamicFieldsContainer = $('#dynamicFieldsContainer');
                
                //dynamicFieldsContainer.append('<label for="' + key + '">' + key + '</label>');
				createFieldsForGroup(firstRecord, 'slno', 'additionalFieldsContainer');
                createFieldsForGroup(firstRecord, 'trainingid', 'additionalFieldsContainer');
                createFieldsForGroup(firstRecord, 'trainingname', 'additionalFieldsContainer');
                createFieldsForGroup(firstRecord, 'venueid', 'additionalFieldsContainer');
                createFieldsForGroup(firstRecord, 'venuename', 'additionalFieldsContainer');
                createFieldsForGroup(firstRecord, 'cc', 'ccFieldsContainer');
                createFieldsForGroup(firstRecord, 'acc', 'accFieldsContainer');
                createFieldsForGroup(firstRecord, 'rp', 'rpFieldsContainer');
                createFieldsForGroup(firstRecord, 'pp', 'ppFieldsContainer');
                createFieldsForGroup(firstRecord, 'os', 'osFieldsContainer');
              } else {
                console.error('No data found in the response.');
                alert('No data found in the response.');
              }
            },
            error: function (xhr, status, error) {
              console.error('Error fetching venue data:', xhr.responseText);
              alert('Error fetching venue data. Please check the console for details.');
            }
          });
        } else {
          // Handle the case where Venue ID is not provided in the URL
          // alert('Venue ID not provided in the URL.');
        }
      }
 
      function createFieldsForGroup(record, prefix, containerId) {
          var dynamicFieldsContainer = $('#' + containerId);
 
          $.each(record, function (key, value) {
              if (key.startsWith(prefix)) {
                  // Create a container for the label and input
                  var fieldContainer = $('<div class="field-container"></div>');
 
                  // Add the label
                  fieldContainer.append('<label for="' + key + '">' + key + '</label>');
 
                  if (value !== null) {
                      if (typeof value === 'string' && value.includes(',')) {
                          var valuesArray = value.split(',');
                          $.each(valuesArray, function (index, val) {
                           
                              // Create separate input containers for each value in the array
                              var inputContainer = $('<div class="input-container"></div>');
                              inputContainer.append('<input type="text" id="' + key + '" value="' + val.trim() + '">');
                              fieldContainer.append(inputContainer);
                          });
                      } else {
                          // Create a single input container
                          var inputContainer = $('<div class="input-container"></div>');
                          inputContainer.append('<input type="text" id="' + key + '" value="' + value + '">');
                          fieldContainer.append(inputContainer);
                      }
                  } else {
                      // Create an empty input container
                      var inputContainer = $('<div class="input-container"></div>');
                      inputContainer.append('<input type="text" id="' + key + '" value="">');
                      fieldContainer.append(inputContainer);
                  }
 
                  // Append the entire field container to the main container
                  dynamicFieldsContainer.append(fieldContainer);
              }
          });
      }
    });
  </script>  
</body>
 
</html>