<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload Page</title>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            padding: 40px;
            font-family: 'Times New Roman', Times, serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #007bff;
        }
        .btn-download {
            margin-top: 20px;
            background-color: #17a2b8;
            color: #fff;
            border: none;
        }
        .btn-download:hover {
            background-color: #138496;
        }
        .file-upload {
            margin-top: 20px;
        }
        .upload-btn {
            margin-top: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
        }
        .upload-btn:hover {
            background-color: #218838;
        }
        .instructions {
            margin-top: 20px;
            font-style: italic;
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">File Upload Page</h2>
    
    <!-- Step 1: Download Template -->
    <div id="step1">
        <h4>Step 1: Download the Excel File</h4>
        <div class="col-md-4">
            <a href="${pageContext.request.contextPath}/academic calender upload file.xlsx" download class="btn btn-info btn-download">Download Template</a>
        </div>
    </div>

    <!-- Step 2: Fill Data -->
    <div id="step2">
        <h4>Step 2: Fill Data in the Downloaded Excel File</h4>
        <p class="instructions">Fill in the necessary data in the downloaded Excel file.</p>
      
        <div class="col-md-4 file-upload">
            <div class="form-group">
                <label for="file" style="width: 213%;">Choose File (Upload That Excel format):</label>
                <input type="file" class="form-control-file" style="width: 350%;" id="file" name="file">
            </div>
            <button type="submit" id="uploadBtn" class="btn btn-primary upload-btn" style="width: 145%;" onclick="uploadFile()">Upload Training Calendar Data</button>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    var $j = jQuery.noConflict();

    $j(document).ready(function() {
        uploadFileOnReady();
    });

    function uploadFileOnReady() {
        console.log("Document ready. You can add your initialization logic here.");
    }

    function uploadFile() {
        var fileInput = document.getElementById('file');
        var file = fileInput.files[0];

        var formData = new FormData();
        formData.append('file', file);

        $j.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/upload',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);
                alert(response);
            },
            error: function(error) { 
                console.error(error);
                alert('File upload failed. Please try again.');
            }
        });
    }
</script>


  
<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
</body>
</html>
