<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Form Processing</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String lastName = request.getParameter("lastName");
    int age = Integer.parseInt(request.getParameter("age"));
    String department = request.getParameter("department");
    String email = request.getParameter("email");

    String url = "jdbc:mysql://localhost:3306/data";
    String username = "root";
    String password = "Sahil@101202";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
        Statement statement = connection.createStatement();


        String insertQuery = "INSERT INTO datastore (name, last_name, age, department, email) " +
                             "VALUES ('" + name + "', '" + lastName + "', " + age + ", '" + department + "', '" + email + "')";


        int rowsAffected = statement.executeUpdate(insertQuery);

                statement.close();
                connection.close();

                if (rowsAffected > 0) {
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("<p>Failed to insert data.</p>");
                }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
