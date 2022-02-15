<%-- 
    Document   : KelolaGoip
    Created on : Feb 10, 2022, 3:23:35 PM
    Author     : A S U S
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
            String no_ruangan=request.getParameter("no_ruangan");
           if (request.getParameter("simpan").equalsIgnoreCase("Simpan")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                        Statement st = con.createStatement();
                        String sql="UPDATE kelola_peminjaman SET status='" + status + "'where no_ruangan='"+no_ruangan+"'";
                        st.executeUpdate(sql);
                    response.sendRedirect("KelolaPeminjaman.jsp");
                } catch (Exception e) {
                    out.print(e);
                    out.print("Gagal Mengubah");
                }
            }
        %>
    </body>
</html>
