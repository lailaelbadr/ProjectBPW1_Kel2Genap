<%-- 
    Document   : hapusblacklist
    Created on : Feb 10, 2022, 12:17:47 PM
    Author     : Ella
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String kode_pemblokiran = request.getParameter("kode_pemblokiran");
        try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                    Statement st = con.createStatement();
                    String sql = "delete from pemblokiran where kode_pemblokiran = '"+kode_pemblokiran+"'";
                    st.executeUpdate(sql);
                    response.sendRedirect("blacklistAIL.jsp");
                } catch (Exception e) {
                    out.print(e);
                    out.print("Gagal Mengubah");
                }
        %>
    </body>
</html>
