

<%-- 
    Document   : pembatalan
    Created on : Feb 6, 2022, 10:55:13 AM
    Author     : HP-OMEN
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String host = "jdbc:mysql://localhost:3306/genap";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        String query = "select * from peminjaman where no_induk='2055301011' and status = 'pengajuan'";
        Statement stmt = conn.createStatement();
        ResultSet rs = null;
        rs = stmt.executeQuery(query);


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>        
        <%@include file="sidebarpeminjam.html"%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Pembatalan</h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                    <li class="breadcrumb-item">Peminjaman</li>
                    <li class="breadcrumb-item active" aria-current="page">Pembatalan</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-lg-12 mb-4">
                    <!-- Simple Tables -->
                    <div class="card">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Pembatalan</h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush">
                                <thead class="thead-light">
                                    <tr>
                                        <th>NIP / NIM</th>
                                        <th>Nama</th>
                                        <th>Ruang</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rs.next()) {%>
                                    <tr>
                                        <td><%=rs.getString("no_induk")%></td>
                                        <td><%=rs.getString("nama_peminjam")%></td>
                                        <td><%=rs.getString("no_ruangan")%></td>
                                        <td><span class="badge badge-info"><%=rs.getString("status")%></span></td>
                                        <td>
                                            <a href="delete_pengajuan.jsp?no_induk=<%=rs.getString("no_induk")%>"><span class="btn btn-primary">Batal</span></a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                                <%
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (SQLException ex) {
                                        out.print("Gagal Koneksi");
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
