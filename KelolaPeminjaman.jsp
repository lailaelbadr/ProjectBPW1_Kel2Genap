<%-- 
    Document   : approve
    Created on : Feb 8, 2022, 12:02:10 PM
    Author     : Ella
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String no_ruangan = request.getParameter("no_ruangan");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "genap";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
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
                        <h1 class="h3 mb-0 text-gray-800">Kelola Peminjaman</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">Peminjaman</li>
                            <li class="breadcrumb-item active" aria-current="page">Kelola Peminjaman</li>
                        </ol>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <form action="KelolaGoip.jsp" method="POST">
                                <table class="table table-bordered table-md">
                                    <tr>
                                        <th>Nomor Ruangan</th>
                                        <th></th>
                                        <th>NIP</th>
                                        <th></th>
                                        <th>Status</th>
                                        <th>Aksi</th>
                                        <th>Keterangan</th>
                                    </tr>
                                    <%
                                        try {
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");
                                            statement = connection.createStatement();
                                            String sql = "select * from kelola_peminjaman";
                                            resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                    %>
                                    <tr>
                                        <td><%=resultSet.getString("no_ruangan")%></td>
                                        <td><input type="hidden" class="form-control" name="no_ruangan" value="<%=resultSet.getString("no_ruangan")%>"/></td>
                                        <td><%=resultSet.getString("nip")%></td>
                                        <td></td>

                                        <td><input type="text"  class="form-control" name="status" value="<%=resultSet.getString("status")%>"/>
                                        <td class="col-sm-2"><button type="submit" name="simpan" value="Simpan" class="btn btn-success">Submit</button>&emsp;&emsp;&ensp;&nbsp;&ensp;<button type="reset" name="batal" class="btn btn-danger">Batal</button></td>
                                        <td><%=resultSet.getString("keterangan_ruangan")%></td>
                                    </tr>
                                    <%
                                            }
                                            connection.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
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
