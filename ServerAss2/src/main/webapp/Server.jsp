<%@page import= "java.sql.*" %>
<%@page import= "java.io.*" %>
<html>
    <head><title>IMDBS</title></head>
    <body>
        <%
            try{
           Connection con = null;
           Statement stmt= null;
           ResultSet rs = null;
           //Loading Driver
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           //creating connection with database
           con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ibdms_server?zeroDateTimeBehavior=CONVERT_TO_NULL","root","password");
           stmt=con.createStatement();
           rs=stmt.executeQuery("select *from id");
           %>
           <table border="1">
               <tr>
                   <td>id</td>
                   <td>name</td>
                   <td>xpos</td>
                   <td>ypos</td>
               </tr>
               <%
                   while(rs.next())
                   {
               %>
               
                   <td><%=rs.getString(1)%></td>
                   <td><%=rs.getString(2)%></td>
                   <td><%=rs.getString(3)%></td>
                   <td><%=rs.getString(4)%></td>
                <%   }
               %>
           </table>   
           <%
            }
        catch(Exception e){
            out.println("Unable to connect");
            }
            %>
    </body>
</html>