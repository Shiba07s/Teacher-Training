<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Training Application Form</title>
</head>
<body>
<h2>Training Application Form</h2>
<form action="submit_application" method="post">
<div>
<label for="treasuryId">TREASURY ID:</label>
<input type="text" id="treasuryId" name="treasuryId" required>
</div>
<div>
<label for="participantName">Participant Name:</label>
<input type="text" id="participantName" name="participantName" required>
</div>
<div>
<label for="schoolComplexId">School Complex ID:</label>
<input type="text" id="schoolComplexId" name="schoolComplexId" required>
</div>
<div>
<label for="email">Email:</label>
<input type="email" id="email" name="email" required>
</div>
<div>
<label for="mobile">Mobile:</label>
<input type="tel" id="mobile" name="mobile" required>
</div>
<div>
<label for="trainingBefore">Have you attended any training before?</label>
<input type="radio" id="trainingBeforeYes" name="trainingBefore" value="yes">
<label for="trainingBeforeYes">Yes</label>
<input type="radio" id="trainingBeforeNo" name="trainingBefore" value="no">
<label for="trainingBeforeNo">No</label>
</div>
<div>
<label for="trainingName">Training Name:</label>
<input type="text" id="trainingName" name="trainingName">
</div>
<div>
<button type="submit">Submit Application</button>
</div>
</form>
</body>
</html>