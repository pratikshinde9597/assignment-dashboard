<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String message = request.getParameter("message");

// Connect to MySQL database
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/contact", "root", "Pratik@1234");

// Insert form data into database
String sql = "INSERT INTO contact_us (name, email, message) VALUES (?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, name);
stmt.setString(2, email);
stmt.setString(3, message);
stmt.executeUpdate();

// Close database connection
stmt.close();
conn.close();

// Redirect to thank you page
response.sendRedirect("thank_you.jsp");
%>
