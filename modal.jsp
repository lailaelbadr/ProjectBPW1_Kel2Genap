<%-- 
    Document   : modal
    Created on : Feb 9, 2022, 5:25:13 PM
    Author     : ASUS ViviBook
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="db.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <%@include file="link.jsp" %>
    </head>
    <body>
    <body id="page-top" class="sidebar-toggled">
        <div id="wrapper">
            <%@include file="sidebar.html" %>
            <div class="container-fluid" id="container-wrapper">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <div class="row align-items-center">
                        <div class="col-sm">
                            <a href="lab.jsp?lab=${param.lab}"><img src="img/1904658-arrow-arrow-left-change-direction-left-next-undo_122508.png"></a>
                        </div>
                    </div>

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active"><a href="lab.jsp?lab=${param.lab}">Lab ${param.lab}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Detail</li><br>
                    </ol>
                </div>
                <%
                    SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat uy = new SimpleDateFormat("hh:mm");
                    String ve = request.getParameter("lab");
                    String vl = request.getParameter("no");
                    try {
                        Connection ck = connection.getConnection();
                        Statement su = ck.createStatement();
                        String sql = "select nama_peminjam,level,tanggal_mulai,tanggal_akhir,"
                                + "jam_mulai,jam_selesai,keperluan,kode_peminjaman,"
                                + "no_induk,no_telp,tanggal_peminjaman,email from peminjaman "
                                + "where kode_peminjaman='" + vl + "'";
                        ResultSet st = su.executeQuery(sql);
                        while (st.next()) {%>
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-center">
                                <h3 class="m-0 font-weight-bold text-warning">Detail Peminjaman</h3>
                            </div>
                            <form>
                                <div class="card-body">
<!--                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="1">Kode Peminjaman</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="kp" value="<%=st.getString(8)%>" readonly>
                                        </div>
                                    </div>-->
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="2">Nama Peminjam</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="np" value="<%=st.getString(1)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="3">No Induk</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="ni" value="<%=st.getString(9)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="4">Email</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="em" value="<%=st.getString(12)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="5">No Telepon</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="nt" value="<%=st.getString(10)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="6">Level</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="lvl" value="<%=st.getString(2)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="7">Tanggal Pengajuan</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="tp" value="<%=st.getString(11)%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center" id="simple-date4">
                                        <div class="col-sm-4">
                                            <label for="8" class="col-form-label">Tanggal Peminjaman</label>
                                        </div>
                                        <div class="col-sm-7 input-daterange input-group">
                                            <input type="text" class="input-sm form-control" name="start_tgl" value="<%=ft.format(st.getDate(3))%>" readonly>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">to</span>
                                            </div>
                                            <input type="text" class="input-sm form-control" name="end_tgl" value="<%=ft.format(st.getDate(4))%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="9" class="col-form-label">Jam Peminjaman</label>
                                        </div>
                                        <div class="col-sm-7 input-group clockpicker" id="clockPicker2">
                                            <input type="text" class="input-sm form-control" name="start_jam" value="<%=uy.format(st.getTime(5))%>" readonly>                     
                                            <div class="input-group-append">
                                                <span class="input-group-text">to</span>
                                            </div> 
                                            <input type="text" class="input-sm form-control" name="end_jam" value="<%=uy.format(st.getTime(6))%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-4">
                                            <label for="10">Keperluan</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="kpln" value="<%=st.getString(7)%>" readonly>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="card-footer">

                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="footer.html" %>
            </div>
            <%@include file="script.jsp" %>
        </div>
        <%  }
                st.close();
                su.close();
                ck.close();
            } catch (SQLException e) {
                out.println(e);
            }%>
    </body>
</html>
