<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link href="css/style2.css" rel="stylesheet" />
</head>
<body>
    <form style="width: 350px;">
      <div class="main">
        <div class="heading">
        <h3>School Complex Data Tracking</h3>
        </div>
        <div>
        <label>Enter <b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>Mandal Name<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>Please enter the Complex Name<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>Please enter the Complex Code 11 digits only<b style="color: red">*</b></label>
        <input type="number" placeholder="enter your answer..."/>
        </div>
        <div>
        <label>Please enter the Complex HM name<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>Please enter the Complex HM Contact Number<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>Please enter the Complex HM Contact Number<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
        <label>School Complex Meeting - Types of Complex Meeting <b style="color: red">*</b> </label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
          <label for="meeting">Please select the type of School <br/>Complex Meeting you are conducting :<b style="color: red">*</b></label>
          <select id="" name="meeting" required>
            <option value="Primary">Primary</option>
            <option value="Subject">Subject</option>
            <option value="Sports">Sports</option>

            <option value="School Heads">School Heads</option>
          </select>
        </div>
        <div>
          <label for="subject">Please select the subject/domain you are dealing <br/>during the School Complex Meeting :<b style="color: red">*</b></label>
          <select id="" name="subject" required>
            <option value="Telugu">Telugu</option>
            <option value="Hindi">Hindi</option>
            <option value="Mathematics">Mathematics</option>
            <option value="English">English</option>
            <option value="Biological Science (BS)">Biological Science (BS)</option>
            <option value="Physical Science (PS)">Physical Science (PS)</option>
            <option value="Social Science">Social Science</option>
            <option value="Physical Education">Physical Education</option>
            <option value="Primary School Subjects">Primary School Subjects</option>
            <option value="School Heads Monthly Meeting">School Heads Monthly Meeting</option>
            <option value="Sports Teachers Complex Meeting">Sports Teachers Complex Meeting</option>
          </select>
        </div>
        <div>
          <label>Please enter the number of teachers attached to the complex<b style="color: red">*</b></label>
          <input type="text" placeholder="your answer..."/>
          </div>
        
        <div>
        <label>Please enter the number of teachers <br/>attending the complex meeting.Only digits<b style="color: red">*</b></label>
        <input type="number" placeholder="your answer..."/>
        </div>
         <div>
          <label for="month">Did you receive this month's agenda ? <b style="color: red">*</b></label>
          <select id="" name="month" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
          </select>
        </div>
        <div>
          <label for="monthly">Did you attend monthly orientation meeting on agenda?<b style="color: red">*</b></label>
          <select id="" name="monthly" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
          </select>
        </div>
        <div>
          <label for="resource">Necessary digital resources required to conduct <br/>the sessions in Agenda items are available.<b style="color: red">*</b></label>
          <select id="" name="resource" required>
            <option value="Yes, all material was available">Yes, all material was available</option>
            <option value="Partial Material was Available">Partial Material was Available</option>
            <option value="No Material Available">No Material Available</option>
            <option value="Not Applicable">Not Applicable</option>
          </select>
        </div>
         <div>
        <label>Any highlights/remarks on the Complex Meeting - Please suggest<b style="color: red">*</b></label>
        <input type="text" placeholder="your answer..."/>
        </div>
        <div>
         <label for="fileInput">Please upload an image of the signed attendance sheet.<b style="color: red">*</b></label>
        <input type="file" id="fileInput" name="uploadedFile">
        </div>
         <div>
         <label for="fileInput">Please upload an image of the school complex classroom.<b style="color: red">*</b></label>
        <input type="file" id="fileInput" name="uploadedFile">
        </div>
        <div class="heading">
        <button type="submit">Submit</button>
      </div>
    </div>
    </form>
</body>
</html>