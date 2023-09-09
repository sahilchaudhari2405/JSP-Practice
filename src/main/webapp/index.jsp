<!DOCTYPE html>
<html>
<head>
    <title>Form Example</title>
</head>
<body>
    <h1>Employee Information</h1>
    <form id="employeeForm" action="connect.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br><br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required><br><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>

        <button type="submit">Submit</button>
        <button type="button" id="clearButton">Clear</button>
         <jsp:include page="display.jsp" />
    </form>

    <script>
        // JavaScript function to clear the form
        document.getElementById("clearButton").addEventListener("click", function() {
            document.getElementById("employeeForm").reset();
        });
    </script>
</body>
</html>
