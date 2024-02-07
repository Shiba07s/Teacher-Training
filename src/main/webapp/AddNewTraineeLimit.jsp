<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Component Resource Limit</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <style>
        body {
            display: flex;
            justify-content: center;
        }

        form {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .form-column {
            float: left;
            width: 45%;
            margin-right: 5%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .invalid-feedback {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .buttons {
            text-align: center;
            clear: both;
            margin-top: 15px;
            border: none;
            cursor: pointer;
        }

        button {
            width: 120px;
            padding: 10px;
            border: none;
            cursor: pointer;
            background-color: #4caf50;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container" align="center">
        <h1>Add Component Resource Limit</h1>
        <form id="addSessionForm" class="text-left">
            <div class="form-row">
                <div class="form-column">
                    <label for="expense">Expense Type:</label>
                    <select id="expense" placeholder="Select Vendor Name" required></select>
                    <label for="Trainee">Trainee Role:</label>
                    <input type="text" id="Trainee" required>
                </div>
                <div class="form-column">
                    <label for="budgeted_year">Budgeted Year</label>
                    <input type="text" id="budgeted_year" placeholder="Enter Budgeted year">
                    <label for="unit">Unit:</label>
                    <select id="unit" placeholder="Options" required>
                        <option value="Per day">Per Day</option>
                        <option value="lumpsum">LumpSum</option>
                    </select>
                </div>
                <div class="form-column">
                     <label for="approved_rate">Approved Rate:</label>
                    <input type="text" id="approved_rate" required>
                    </div>
                 <div class="buttons">
                    <button type="button" class="btn btn-primary" id="saveButton">Save</button>
                    &nbsp;
                    <button type="button" class="btn btn-danger" onclick="closeForm()" id="exitButton">Close</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            // Fetch vendor data on page load
            fetchVendorData();

            $('#saveButton').click(function() {
                if (validateForm()) {
                    saveComponentData();
                }
            });

            $('#expense').change(function() {
                var selectedOption = $('#expense').find(':selected');
                var additionalData = selectedOption.data('byear');
                $("#budgeted_year").val(additionalData);
            });

            window.closeForm = function() {
                window.location.href = '${pageContext.request.contextPath}/TraineeLimit.jsp';
            };
        });

        function fetchVendorData() {
            $.ajax({
                url: '${pageContext.request.contextPath}/api/head/getall',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    var dropdown = $('#expense');
                    dropdown.empty();
                    dropdown.append('<option value="" selected disabled>Select Expense Type</option>');
                    $.each(data, function(index, item) {
                        dropdown.append($('<option>', {
                            value: item.tcnames,
                            text: item.tcnames,
                            'data-byear': item.budgetedYear
                        }));
                    });
                },
                error: function(error) {
                    console.error('Error fetching vendor data:', error);
                }
            });
        }

        function saveComponentData() {
            var formData = {
            	expenseType: $("#expense").val(),
            	approvedRate: $("#approved_rate").val(),
                traineeRole: $("#Trainee").val(),
                budgetedYear: $("#budgeted_year").val(),
                unit: $("#unit").val(),
            };

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/api/create/traineeLimit',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    console.log(response);
                    toastr.success('Saved successfully');
                    setTimeout(function() {
                        window.location.href = '${pageContext.request.contextPath}/TraineeLimit.jsp';
                    }, 1000);
                },
                error: function(xhr, status, error) {
                    console.error('API request error: ' + error);
                    toastr.error('Failed to save data');
                }
            });
        }

        function validateForm() {
            // Add your validation logic here
            return true; // Return true if form is valid, false otherwise
        }
    </script>

</body>
</html>
