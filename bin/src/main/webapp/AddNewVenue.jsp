<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Venue</title>
  
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
    select {
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
    <h2>Add Venue</h2>
 
    <label for="vname">Venue Name:</label>
    <input type="text" id="vname" placeholder="Enter venue name" required>
    
     <label for="vstate">Venue State:</label>
    <input type="text" id="vstate" placeholder="Enter state" required>
 
      <label for="vdistrict">Venue District:</label>
      <select id="vdistrict" placeholder="Enter district" required></select>
 
  <label for="vmandal">Venue Mandal:</label>
      <select id="vmandal" placeholder="Enter mandal" required></select>
 
  <label for="vlocation">Venue Location :</label>
    <input type="text" id="vlocation"  required>
 
  <label for="vcapacity">Venue Capacity:</label>
    <input type="text" id="vcapacity"  required>
 
  <label for="vaddress">Venue Address:</label>
    <input type="text" id="vaddress"  required>
 
  <label for="landmark">Landmark:</label>
    <input type="text" id="landmark"  required>
 
  <label for="vtype">Venue Type:</label>
    <input type="text" id="vtype"  required>
 
  <label for="coordinatorname">Venue Co-Ordinator Name:</label>
    <input type="text" id="coordinatorname"  required>
 
  <label for="coordinatormobile">Venue Co-Ordinator Mobile:</label>
    <input type="text" id="coordinatormobile"  required>
 
  <label for="coordinatoremail">Venue Co-Ordinator Email:</label>
    <input type="text" id="coordinatoremail"  required>
 
  <label for="maplocation">Map Location:</label>
    <input type="text" id="maplocation"  required>
 
 
 
 
    <div class="button-container">
      <button type="button" class="save-button" onclick="saveVenue()">Save</button>
      <button type="button" class="close-button" onclick="closeForm()">Close</button>
    </div>
  </div>
  </form>
<script>
$(document).ready(function () {
     function validateForm() {
       // Add validation for other fields if needed
       var vname = $("#vname").val();
       var vstate = $("#vstate").val();
       var vmandal = $("#vmandal").val();
       var vdistrict = $("#vdistrict").val();
       var vlocation = $("#vlocation").val();
       var vcapacity = $("#vcapacity").val();
       var vaddress = $("#vaddress").val();
       var landmark = $("#landmark").val();
       var vtype = $("#vtype").val();
       var coordinatorname = $("#coordinatorname").val();
       var coordinatormobile = $("#coordinatormobile").val();
       var coordinatoremail = $("#coordinatoremail").val();
       var maplocation = $("#maplocation").val();
 
       if (vname.trim() === "") {
         toastr.error("Venue Name is required");
         return false;
       }
       if (vstate.trim() === "") {
           toastr.error("Venue State is required");
           return false;
         }
       if (vmandal.trim() === "") {
           toastr.error("Venue Mandal is required");
           return false;
         }
       if (vdistrict.trim() === "") {
           toastr.error("Venue District is required");
           return false;
         }
       if (vlocation.trim() === "") {
           toastr.error("Venue Location is required");
           return false;
         }
       if (vcapacity.trim() === "") {
           toastr.error("Venue Capacity is required");
           return false;
         }
       if (vaddress.trim() === "") {
           toastr.error("Venue Address is required");
           return false;
         }
       if (landmark.trim() === "") {
           toastr.error("Venue landmark is required");
           return false;
         }
       if (vtype.trim() === "") {
           toastr.error("Venue Type is required");
           return false;
         }
       if (coordinatorname.trim() === "") {
           toastr.error("Venue coordinatorname is required");
           return false;
         }
       if (coordinatormobile.trim() === "") {
           toastr.error("Venue coordinatormobile is required");
           return false;
         }
       if (coordinatoremail.trim() === "") {
           toastr.error("Venue coordinatoremail is required");
           return false;
         }
       if (maplocation.trim() === "") {
           toastr.error("Venue maplocation is required");
           return false;
         }
  
       return true;
     }
 
 
      window.saveVenue = function () {
        if (validateForm()) {
          // Collect form data and create a JSON object
          var formData = {
            vname: $("#vname").val(),
            vstate: $("#vstate").val(),
            vmandal: $("#vmandal").val(),
            vdistrict: $("#vdistrict").val(),
            vlocation: $("#vlocation").val(),
            vcapacity: $("#vcapacity").val(),
            vaddress: $("#vaddress").val(),
            landmark: $("#landmark").val(),
            vtype: $("#vtype").val(),
            vcontactname: $("#coordinatorname").val(),
            vcontactno: $("#coordinatormobile").val(),
            vcontactmailid: $("#coordinatoremail").val(),
            maplocation: $("#maplocation").val(),
          };
 
          // Make a POST request to the api/create/venue endpoint
          $.ajax({
            type: "POST",
            url: "/api/create/venue",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
              console.log(response);
              toastr.success("Venue saved successfully");
              window.location.href = "/VenueSetUp.jsp";
            },
            error: function (xhr, status, error) {
              console.error("API request error: " + error);
              toastr.error("Failed to save venue data");
            },
          });
        }
 
        // Prevent the default form submission
        return false;
      };
 
      window.closeForm = function () {
        // Redirect to venueSetUp.jsp
        window.location.href = "/VenueSetUp.jsp";
      };
    });
  </script>
  
  
  <script>
  
 
  var districtDropdownPopulated = false;
  var mandalDropdownPopulated = false;
 
  // Variables to store fetched data
  var districtData;
  var mandalData;
 
  // Function to fetch districts
  function fetchDistricts() {
    if (!districtDropdownPopulated) {
      $.ajax({
        url: '/api/search/district',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
          const districtDropdown = $('#vdistrict');
          districtDropdown.append('<option value="" selected disabled>Select District</option>');
 
          data.forEach(district => {
            const option = $('<option></option>');
            option.val(district);
            option.text(district);
            districtDropdown.append(option);
          });
 
          districtDropdownPopulated = true;
          districtData = data;
        },
        error: function (error) {
          console.error('Error fetching district data:', error);
        }
      });
    }
  }
 
  // Function to fetch mandals
  function fetchMandals(selectedDistrict) {
    $.ajax({
      url: '/api/mandal?district=' + selectedDistrict,
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        const mandalDropdown = $('#vmandal');
        mandalDropdown.html('<option value="" selected disabled>Select Mandal</option>');
 
        data.forEach(mandal => {
          const option = $('<option></option>');
          option.val(mandal);
          option.text(mandal);
          mandalDropdown.append(option);
        });
 
        mandalData = data;
      },
      error: function (error) {
        console.error('Error fetching mandal data:', error);
      }
    });
  }
 
  // Fetch districts on document load
  $(document).ready(function () {
    fetchDistricts();
  });
 
  // Attach event listener to district dropdown
  $(document).on('change', '#vdistrict', function () {
    const selectedDistrict = $(this).val();
    if (selectedDistrict) {
      fetchMandals(selectedDistrict);
    }
  });
</script>
  
</body>
</html>