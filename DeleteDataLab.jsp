<%-- 
    Document   : DeleteDataLab
    Created on : Feb 9, 2022, 1:43:54 PM
    Author     : M Fikri
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="KoneksiTable.Koneksi" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String no_ruangan = request.getParameter("no_ruangan");

            String host = "jdbc:mysql://localhost:3306/genap";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(host, "root", "");
                if (conn != null) {
                    if (no_ruangan != null) {
                        Statement st = conn.createStatement();
                        st.executeUpdate("DELETE FROM datalab WHERE no_ruangan = '" + no_ruangan + "'");
                        response.sendRedirect("ViewDataLab.jsp");
                    }
                } else {
                    out.println("Gagal Menghapus!!");
                }
            } catch (SQLException ex) {
                out.print("Gagal Koneksi");
            } catch (Exception ex) {
                out.print(ex.getMessage());
            }
        %>
    </body>
</html>
