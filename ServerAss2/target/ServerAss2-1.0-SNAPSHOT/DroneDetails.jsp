<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<html>
<head>
    <title>Drone Details</title>
    <style>
 table {
            border-collapse: collapse;
            width: 100%;
            table-layout: fixed;
        }
        
        th, td {
            text-align: left;
            padding: 8px;
            width: 50%; /* Adjust the width as needed */
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        function goBack() {
            history.back();
        }
    </script>    
</head>
<body>
    <h3>Drone Details from MySQL</h3>
    <table>
       <tr>
            <th>ID</th>
            <th>Name</th>
            <th>X Position</th>
            <th>Y Position</th>     
        </tr>

    <% 
    try {
        // Step 1: Load and register the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Step 2: Create a connection to the MySQL database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ibdms_server", "root", "password");

        // Step 3: Execute a SQL query
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM drone";
        ResultSet rs = stmt.executeQuery(sql);

        // Step 4: Iterate over the result set and display the data
        while (rs.next()) {
            // Assuming your table has columns named "column1" and "column2"
            String column1 = rs.getString("id");
            String column2 = rs.getString("name");
            String column3 = rs.getString("xpos");
            String column4 = rs.getString("ypos");


            // Display the data in an HTML table
            %>
                <tr>
                    <td><%= column1 %></td>
                    <td><%= column2 %></td>
                    <td><%= column3 %></td>
                    <td><%= column4 %></td>
                </tr>
            <%
        }

        // Step 5: Close the database connection and other resources
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    </table>
    <button onclick="goBack()">Go Back</button>
</body>
</html>
