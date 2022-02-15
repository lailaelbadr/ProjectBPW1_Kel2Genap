<%-- 
    Document   : editapprove
    Created on : Feb 9, 2022, 4:04:22 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
            String kode_peminjaman = request.getParameter("kode_peminjaman");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from peminjaman where kode_peminjaman='" + kode_peminjaman + "'");


        %>
        <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body id="page-top">
            <div id="wrapper">
                <div id="content-wrapper" class="d-flex flex-column">    
                    <%@include file="sidebaradmin.html"%>
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Approval</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                                <li class="breadcrumb-item">Peminjaman</li>
                                <li class="breadcrumb-item active" aria-current="page">Data Peminjaman</li>
                            </ol>
                        </div>
                        <form action="controlapprove.jsp" method="Post">
                            <div class="row">
                                <div class="col-lg-12 mb-4">
                                    <!-- Simple Tables -->
                                    <div class="card">
                                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Approval</h6>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table align-items-center table-flush">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Kode Peminjaman</th>
                                                        <th>No Induk</th>
                                                        <th>Nama</th>
                                                        <th>Ruang</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% while (rs.next()) {%>
                                                    <tr>
                                                        <td><input type="text" name="kode_peminjaman" value="<%=rs.getString("kode_peminjaman")%>"/></td>
                                                        <td><%=rs.getString("no_induk")%></td>
                                                        <td><%=rs.getString("nama_peminjam")%></td>
                                                        <td><%=rs.getString("no_ruangan")%></td> 
                                                        <td>
                                                            <select name="status" class="form-control" id="status" >
                                                                <option value="Diterima">Disetujui</option>
                                                                <option value="Ditolak">Ditolak</option>
                                                            </select>
                                                        </td>


                                                        <td>

                                                            <button  class="btn btn-primary" type="submit" name="simpan" value="Simpan">Simpan</button>
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                                </tbody>
                                                </form>
                                                <%
                                                        rs.close();
                                                        st.close();
                                                        con.close();
                                                        //} catch (SQLException ex) {
                                                        //  out.print("Gagal Koneksi");
                                                    } catch (Exception ex) {
                                                        out.print(ex.getMessage());
                                                    }
                                                %>
                                            </table>

                                        </div>

                                        <div class="card-footer"></div>

                                    </div>
                                </div>
                            </div>
                            </body>
                            </html>
