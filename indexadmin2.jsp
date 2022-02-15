<%-- 
    Document   : indexadmin2
    Created on : Feb 11, 2022, 7:42:04 AM
    Author     : Ella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Peminjaman Lab JTI - Login</title>
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/ruang-admin.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">    
                <%@include file="sidebaradmin2.html"%>
                <!-- Container Fluid-->
                <div class="container-fluid" id="container-wrapper">
                    <div class="row">
                        <%
                            try {
                                Connection con = connection.getConnection();
                                Statement stat = con.createStatement();
                                String query = "select dl.no_ruangan,dl.nama,ail.email"
                                        + " from datalab dl,ail where dl.nip=ail.nip"
                                        + " order by dl.no_ruangan asc";
                                ResultSet rs = stat.executeQuery(query);
                                while (rs.next()) {%>
                        <div class="col-sm-3">
                            <a href="lab.jsp?lab=<%=rs.getString(1)%>">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
                                        <h1 class="m-0 font-weight-bold text-success">Lab <%=rs.getString(1)%></h1>
                                    </div>
                                    <div class="card-body bg-gray-400">
                                        <%=rs.getString(2)%><br>
                                        <%=rs.getString(3)%>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%  }
                                rs.close();
                                stat.close();
                                con.close();
                            } catch (SQLException e) {
                                out.println(e);
                            }
                        %>
                    </div>
                    <!-- Footer -->
                    <%@include file="footer.html" %>
                    <a class="scroll-to-top rounded" href="#page-top">
                        <i class="fas fa-angle-up"></i>
                    </a>
                    <script src="../assets/vendor/jquery/jquery.min.js"></script>
                    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
                    <script src="../assets/js/ruang-admin.min.js"></script>

                    </body>
                    </html>