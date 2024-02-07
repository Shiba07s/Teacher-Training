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
        <form id="addSessionForm" class="text-left" onsubmit="return saveForm()">
            <div class="form-row">
                <div class="form-column">
                    <label for="resources">Resources:</label>
                    <select id="resources" placeholder="Enter Resources" required></select>
                    <label for="approved_rate">Approved_rate:</label>
                    <input type="text" id="approved_rate" required>
                </div>
                <div class="form-column">
                    <label for="budgeted_year">Budgeted_year</label>
                    <input type="text" id="budgeted_year" placeholder="Enter Budgeted year" readonly>
                    <label for="unit">Unit:</label>
                    <select id="unit" placeholder="Options" required>
                        <option value="Per day">Per Day</option>
                        <option value="lumpsum">LumpSum</option>
                    </select>
                </div>
                <div class="buttons">
                    <button type="submit" class="btn btn-primary" id="saveButton">Save</button>
                    &nbsp;
                    <button type="button" class="btn btn-danger" onclick="closeForm()" id="exitButton">Close</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            fetchResourse();
            $('#resources').change(function() {
                var selectedOption = $('#resources').find(':selected');
                const additionalData = selectedOption.data('byear');
                $("#budgeted_year").val(additionalData);
            });

            window.saveForm = function(){
                addComponentData();
                return false;  // Prevent the default form submission
            }

            window.closeForm = function() {
                window.location.href = "${pageContext.request.contextPath}/ComponentLimit.jsp";
            }
        });

        function fetchResourse() {
            $.ajax({
                url: '${pageContext.request.contextPath}/api/getallcomponents',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    const districtDropdown = $('#resources');
                    districtDropdown.append('<option value="" selected disabled>Select Resourse</option>');
                    $.each(data, function(index, item) {
                        districtDropdown.append($('<option>', {
                            value: item.resources,
                            text: item.resources,
                            'data-byear': item.budgeted_year
                        }));
                    });
                },
                error: function (error) {
                    console.error('Error fetching district data:', error);
                }
            });
        }

        function addComponentData() {
            var formData = {
                resources: $("#resources").val(),
                approved_rate: $("#approved_rate").val(),
                budgeted_year: $("#budgeted_year").val(),
                unit: $("#unit").val(),
            };

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/api/savecomponentlimit",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function(response) {
                    console.log(response);
                    toastr.success("saved successfully");
                    setTimeout(function(){
                        window.location.href = "${pageContext.request.contextPath}/ComponentLimit.jsp";
                    }, 1000);
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to save data");
                }
            });

            return false;  // Prevent the default form submission
        }
    </script>

</body>
</html>
