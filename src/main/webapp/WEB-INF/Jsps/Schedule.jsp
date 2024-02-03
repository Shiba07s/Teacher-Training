<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sample JSP Form</title>
</head>
<body>
    <h1>Sample JSP Form</h1>

    <form action="test" method="post">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required>
        <br><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required>
        <br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="4" cols="50" required></textarea>
        <br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>