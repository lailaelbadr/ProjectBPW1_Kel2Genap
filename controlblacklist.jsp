<%-- 
    Document   : controlblacklist
    Created on : Feb 10, 2022, 9:50:15 AM
    Author     : Ella
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String kode_pemblokiran = request.getParameter("kode_pemblokiran");
            String kode_pengembalian = request.getParameter("kode_pengembalian");
            String no_induk = request.getParameter("no_induk");
            if (request.getParameter("blokir").equalsIgnoreCase("Blokir")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                    Statement st = con.createStatement();
                    String sql = "INSERT into pemblokiran (kode_pemblokiran, kode_pengembalian, no_induk) values (null, '"+kode_pengembalian+"', '"+no_induk+"') ";
                    st.executeUpdate(sql);
                    response.sendRedirect("blacklistAIL.jsp");
                } catch (Exception e) {
                    out.print(e);
                    out.print("Gagal Mengubah");
                }
            }
            
        %>
    </body>