<%-- 
    Document   : ViewDataLab
    Created on : Feb 11, 2022, 2:15:12 AM
    Author     : Ella
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from datalab");


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
                        <h1 class="h3 mb-0 text-gray-800">Data Lab</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">Lab</li>
                        </ol>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 mb-4">
                            <!-- Simple Tables -->
                            <div class="card">
                                <div class="table-responsive">
                                    <table class="table align-items-center table-flush">
                                        <thead class="thead-light">
                                        <div class="card-footer bg-whitesmoke text-right">
                                            <a href="InsertDataLab.jsp"><button type="button" class="btn btn-primary" style="">Insert Data</button></a>
                                        </div>
                                        <tr>
                                            <th>kode_peminjaman</th>
                                            <th>NIP / NIM</th>
                                            <th>Nama</th>
                                            <th>Keterangan</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <% while (rs.next()) {%>
                                            <tr>
                                                <td><%=rs.getString("no_ruangan")%></td>
                                                <td><%=rs.getString("nip")%></td>
                                                <td><%=rs.getString("nama")%></td>
                                                <td><%=rs.getString("keterangan_ruangan")%></td>
                                                <td>
                                                    <a href="UpdateDataLab.jsp?no_ruangan=<%=rs.getString("no_ruangan")%>"><button type="button" class="btn btn-success" style="">Update</button></a><a href="DeleteDataLab.jsp?no_ruangan=<%=rs.getString("no_ruangan")%>"><button type="button" class="btn btn-danger" style="">Delete</button></a>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
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
                    <!--Row-->
                    <%@include file="footer.html"%>
                    <!-- Scroll to top -->
                    <a class="scroll-to-top rounded" href="#page-top">
                        <i class="fas fa-angle-up"></i>
                    </a>
                    <script src="../assets/vendor/jquery/jquery.min.js"></script>
                    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
                    <script src="../assets/js/ruang-admin.min.js"></script>

                    </body>
                    </html>
