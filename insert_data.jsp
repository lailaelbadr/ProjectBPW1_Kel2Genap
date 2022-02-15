<%-- 
    Document   : insert_data
    Created on : Feb 9, 2022, 1:28:53 AM
    Author     : M Fikri
--%>

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
            String nip = request.getParameter("nip");
            String nama = request.getParameter("nama");
            String keterangan_ruangan = request.getParameter("keterangan_ruangan");

            if (request.getParameter("SimpanData").equals("Simpan")) {
                try {
                    Koneksi konek = new Koneksi();
                    Connection con = konek.bKoneksi();
                    Statement st = con.createStatement();
                    String sql = "INSERT INTO datalab (no_ruangan,nip,nama,keterangan_ruangan)"
                            + "values('" + no_ruangan + "','" + nip + "','" + nama + "','" + keterangan_ruangan +"')";

                    st.executeUpdate(sql);
                    response.sendRedirect("ViewDataLab.jsp");
                } catch (Exception e) {
                    out.print(e);
                    out.print("Gagal Menambahkan");
                }
            }
        %>
    </body>
</html>
