<%-- 
    Document   : logbookAIL
    Created on : Feb 13, 2022, 9:55:02 AM
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
        ResultSet rs = st.executeQuery("select * from form_logbook where nama_anggota = '' and kondisi_ruangan = '' ");


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
                <%@include file="sidebaradmin2.html"%>
                <!-- Container Fluid-->
                <div class="container-fluid" id="container-wrapper">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">History Logbook</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">History</li>
                            <li class="breadcrumb-item active" aria-current="page">Logbook</li>
                        </ol>
                    </div>

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
                                                <th>Kode Pengembalian</th>
                                                <th>Kode Peminjaman</th>
                                                <th>NIP / NIM</th>
                                                <th>Nama Anggota</th>
                                                <th>Kondisi Ruang</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% while (rs.next()) {%>
                                            <tr>
                                                <td><%=rs.getString("kode_pengembalian")%></td>
                                                <td><%=rs.getString("kode_peminjaman")%></td>
                                                <td><%=rs.getString("no_induk")%></td>
                                                <td><%=rs.getString("nama_anggota")%></td>
                                                <td><%=rs.getString("kondisi_ruangan")%></td>
                                                <td>
                                                    <a href="tambahblacklist.jsp?kode_pengembalian=<%=rs.getString("kode_pengembalian")%>"><span class="btn btn-primary">Detail</span></a>
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