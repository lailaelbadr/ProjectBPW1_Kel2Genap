<%-- 
    Document   : index
    Created on : Feb 6, 2022, 10:57:26 AM
    Author     : HP-OMEN
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.connection" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="img/logo/logo.png" rel="icon">
        <title>Lab ${param.lab}<</title>
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/ruang-admin.min.css" rel="stylesheet">
    </head>
    <a href="indexadmin.jsp"></a>
    <body>


        <%@include file="sidebaradmin.html"%>
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <div class="row align-items-center">
                    <div class="col-sm">
                        <a href="indexadmin.jsp"><img src="1904658-arrow-arrow-left-change-direction-left-next-undo_122508.png"></a>
                    </div>
                    <h1 class="mb-0 text-gray-900">
                        <select class="select2-single form-control" name="ruang" id="select2Single" onchange="location = this.value;">
                            <option value="${param.lab}">Lab ${param.lab}</option>
                            <% try {
                                    String value = request.getParameter("lab");
                                    Connection cn = connection.getConnection();
                                    Statement cr = cn.createStatement();
                                    String sl = "select no_ruangan from datalab "
                                            + "where no_ruangan <> '" + value + "' order by no_ruangan asc";
                                    ResultSet rt = cr.executeQuery(sl);
                                    while (rt.next()) {%>
                            <option value="lab.jsp?lab=<%=rt.getString(1)%>">Lab <%=rt.getString(1)%></option>
                            <%  }
                                    rt.close();
                                    rt.close();
                                    rt.close();
                                } catch (SQLException e) {
                                    out.println(e);
                                }%>
                        </select>
                    </h1>
                </div>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="indexadmin.jsp">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Lab ${param.lab}</li><br>
                </ol>
            </div>


            <!--Row-->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
                            <h3 class="m-0 font-weight-bold text-warning">Jadwal Peminjaman</h3>
                        </div>
                        <div class="card-body">
                            <%
                                SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
                                SimpleDateFormat uy = new SimpleDateFormat("hh:mm");
                                String value = request.getParameter("lab");
                                try {
                                    Connection ck = connection.getConnection();
                                    Statement su = ck.createStatement();
                                    String sql = "select nama_peminjam,level,tanggal_mulai,tanggal_akhir,"
                                            + "jam_mulai,jam_selesai,keperluan,kode_peminjaman,"
                                            + "no_induk,no_telp,tanggal_peminjaman,email from peminjaman "
                                            + "where no_ruangan='" + value + "' and status='disetujui' "
                                            + "order by tanggal_peminjaman desc";
                                    ResultSet st = su.executeQuery(sql);
                                    while (st.next()) {%>
                            <div class="col">
                                <a href="modal.jsp?&lab=${param.lab}&no=<%=st.getString(8)%>">
                                    <div class="card mb-4">
                                        <div class="card-body text-gray-700">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <h6 class="m-0 font-weight-bold"><%=st.getString(1)%></h6><hr>
                                                    Level       : <%=st.getString(2)%><br>
                                                    Keperluan   : <%=st.getString(7)%>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="text-right">
                                                        <br><br>
                                                        <%=ft.format(st.getDate(3))%> - <%=ft.format(st.getDate(4))%><br>
                                                        Pukul <%=uy.format(st.getTime(5))%> - <%=uy.format(st.getTime(6))%> WIB
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <%  }
                                    st.close();
                                    su.close();
                                    ck.close();
                                } catch (SQLException e) {
                                    out.println(e);
                                }%>
                        </div>
                    </div>
                </div>
                <div class="col-lg">
                    <div class="card mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
                            <h3 class="m-0 font-weight-bold text-warning">Jadwal Praktikum</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="praktikum.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="footer.html"%>
            <!-- Scroll to top -->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <script src="../assets/vendor/jquery/jquery.min.js"></script>
            <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../assets/js/ruang-admin.min.js"></script>
            <script src="../assets/vendor/chart.js/Chart.min.js"></script>
            <script src="../assets/js/demo/chart-area-demo.js"></script>  
    </body>
</html>

