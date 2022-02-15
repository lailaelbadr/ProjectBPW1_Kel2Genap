<%-- 
    Document   : controlapprove
    Created on : Feb 9, 2022, 5:15:15 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            String status=request.getParameter("status");
            String kode_peminjaman=request.getParameter("kode_peminjaman");
           if (request.getParameter("simpan").equalsIgnoreCase("Simpan")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                        Statement st = con.createStatement();
                        String sql="UPDATE peminjaman SET status='" + status + "'where kode_peminjaman='"+kode_peminjaman+"'";
                        st.executeUpdate(sql);
                    response.sendRedirect("approve.jsp");
                } catch (Exception e) {
                    out.print(e);
                    out.print("Gagal Mengubah");
                }
            }
        %>
    </body>
</html>
