<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Training</title>
</head>
<body>
    <h1>Edit Training</h1>

    <%-- Retrieve parameters from the request --%>
    <% String refplannerid = request.getParameter("refplannerid"); %>
    <% String tsubject = request.getParameter("tsubject"); %>
    <% String tcategory = request.getParameter("tcategory"); %>
    <%-- Add similar lines for other parameters --%>

    <form action="updateTraining" method="post">
        <input type="hidden" name="refplannerid" value="<%= refplannerid %>">
        
        <label for="tsubject">Training Subject:</label>
        <input type="text" id="tsubject" name="tsubject" value="<%= tsubject %>"><br>

        <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        
         <label for="tcategory">Training Category:</label>
        <input type="text" id="tcategory" name="tcategory" value="<%= tcategory %>"><br>
        

        <%-- Add similar lines for other form fields --%>

        <button type="submit">Update</button>
        <button type="button" onclick="cancelUpdate()">Cancel</button>
    </form>

    <script>
        function cancelUpdate() {
            // Redirect back to the original page or perform any other cancel action
            window.location.href = "originalPage.jsp";
        }
    </script>
</body>
</html>
