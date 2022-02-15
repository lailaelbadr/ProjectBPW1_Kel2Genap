<%-- 
    Document   : edit_pembatalan
    Created on : Feb 7, 2022, 8:37:13 PM
    Author     : HP-OMEN
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String no_induk = request.getParameter("no_induk");
            String status = request.getParameter("status");
            String host = "jdbc:mysql://localhost:3306/genap";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(host, "root", "");
                if (conn != null) {
                    if (no_induk != null) {
                        Statement st = conn.createStatement();
                        st.executeUpdate("UPDATE peminjaman SET status='dibatalkan' WHERE no_induk = '" + no_induk + "'");
                        response.sendRedirect("pembatalan.jsp");
                    }
                } else {
                    response.sendRedirect("gagalSimpanPeminjaman.jsp");
                }
            } catch (SQLException ex) {
                out.print("Gagal Koneksi");
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
        %>

    </body>
</html>
