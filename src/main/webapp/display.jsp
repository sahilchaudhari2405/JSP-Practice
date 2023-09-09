<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Display Data</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/data";
    String username = "root";
    String password = "Sahil@101202";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
        Statement statement = connection.createStatement();


        String selectQuery = "SELECT * FROM datastore";
        ResultSet resultSet = statement.executeQuery(selectQuery);


        out.println("<h1>Database</h1>");
        out.println("<table border='1'>");
        out.println("<tr><th>Name</th><th>Last Name</th><th>Age</th><th>Department</th><th>Email</th></tr>");

        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String lastName = resultSet.getString("last_name");
            int age = resultSet.getInt("age");
            String department = resultSet.getString("department");
            String email = resultSet.getString("email");

            out.println("<tr><td>" + name + "</td><td>" + lastName + "</td><td>" + age + "</td><td>" + department + "</td><td>" + email + "</td>");
            out.println("</tr>");

        }

        out.println("</table>");

        resultSet.close();
        statement.close();
        connection.close();


    } catch (ClassNotFoundException | SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
