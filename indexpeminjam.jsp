<%-- 
    Document   : indexpeminjam
    Created on : Feb 7, 2022, 9:47:08 PM
    Author     : Ella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">    
                <%@include file="sidebarpeminjam.html"%>
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