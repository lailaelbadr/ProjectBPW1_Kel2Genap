<%-- 
    Document   : form_peminjaman
    Created on : Feb 6, 2022, 10:43:30 AM
    Author     : HP-OMEN
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Form Peminjaman</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">Form Peminjaman</li>                                
                        </ol>
                    </div>
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form action="save_peminjaman.jsp" method="post">
                                <!-- Horizontal Form -->
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Form</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label for="kode_peminjaman" class="col-sm-3 col-form-label">Kode Peminjaman</label>
                                            <div class="col-sm-9">
                                                <%
                                                    String kode_peminjaman = request.getParameter("kode_peminjaman");
                                                    String host = "jdbc:mysql://localhost:3306/genap";

                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn = DriverManager.getConnection(host, "root", "");
                                                        String query = "SELECT kode_peminjaman FROM peminjaman order by kode_peminjaman desc LIMIT 1";
                                                        Statement stmt = conn.createStatement();
                                                        ResultSet rs = null;
                                                        rs = stmt.executeQuery(query);
                                                        while (rs.next()) {
                                                %>
                                                <input type="number" name="kode_peminjaman" class="form-control" id="kode_peminjaman"  value="<%=rs.getInt("kode_peminjaman") + 1%>" readonly=""/>
                                                <%      }
                                                        rs.close();
                                                        stmt.close();
                                                        conn.close();
                                                    } catch (SQLException ex) {
                                                        out.print("Gagal Koneksi");
                                                    } catch (Exception ex) {
                                                        out.print(ex.getMessage());
                                                    }
                                                %>                                       
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="kategori" class="col-sm-3 col-form-label">Kategori</label>
                                            <div class="col-sm-9">
                                                <select name="kategori" class="form-control" id="kategori" >
                                                    <option value="Dosen">Dosen</option>
                                                    <option value="Mahasiswa">Mahasiswa</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="nama_peminjam" class="col-sm-3 col-form-label">Nama</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="nama_peminjam" class="form-control"  id="nama_peminjam" placeholder="Nama">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="no_induk" class="col-sm-3 col-form-label">NIP / NIM</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="no_induk" class="form-control" id="no_induk" placeholder="NIP / NIM">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-3 col-form-label">Email</label>
                                            <div class="col-sm-9">
                                                <input type="email" name="email" class="form-control" id="email" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="no_telp" class="col-sm-3 col-form-label">No HP</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="no_telp" class="form-control" id="no_telp" placeholder="No HP">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="level" class="col-sm-3 col-form-label">Level</label>
                                            <div class="col-sm-9">
                                                <select name="level" class="form-control" id="level">
                                                    <option value="1">1 (Selama Jam Kerja 07:00 - 16:00 )</option>
                                                    <option value="2">2 (Diluar Jam Kerja 16:00 - 22:00 )</option>
                                                    <option value="3">3 (Sabtu dan Minggu 07:00 - 22:00)</option>
                                                </select>
                                            </div>
                                        </div>                                
                                        <div class="form-group row">
                                            <label for="tanggal_peminjaman" class="col-sm-3 col-form-label">Tanggal Peminjaman</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="tanggal_peminjaman" class="form-control" id="tanggal_peminjaman">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="tanggal_mulai" class="col-sm-3 col-form-label">Tanggal Mulai</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="tanggal_mulai" class="form-control" id="tanggal_mulai" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="tanggal_akhir" class="col-sm-3 col-form-label">Tanggal Akhir</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="tanggal_akhir" class="form-control" id="tanggal_mulai" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="jam_mulai" class="col-sm-3 col-form-label">Jam Mulai</label>
                                            <div class="col-sm-9">
                                                <div class="input-group clockpicker" id="clockPicker1">
                                                    <input type="time" name="jam_mulai" class="form-control" value="07:00" id="jam_mulai">                     
                                                                         
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="jam_selesai" class="col-sm-3 col-form-label">Jam Selesai</label>
                                            <div class="col-sm-9">
                                                <div class="input-group clockpicker" id="clockPicker2">
                                                    <input type="time" name="jam_selesai" class="form-control" value="12:00" id="jam_selesai">                     
                                                                         
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="keperluan" class="col-sm-3 col-form-label">Keperluan</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="keperluan" class="form-control" id="keperluan" placeholder="Keperluan">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="no_ruangan" class="col-sm-3 col-form-label">Ruangan</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="no_ruangan" class="form-control" id="no_ruangan" placeholder="Ruangan">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="surat_tugas" class="col-sm-3 col-form-label">Surat Tugas</label>
                                            <div class="col-sm-9">
                                                <input name="surat_tugas" class="form-control-primary" id="surat_tugas" type="file">
                                            </div>
                                        </div>
                                        <!--
                                    <div class="form-group row">
                                        <label for="surat_tugas" class="col-sm-3 col-form-label">Surat Tugas</label>
                                        <div class="col-sm-9">
                                            <div class="custom-file">
                                                <input type="file" name="surat_tugas"class="custom-file-input" id="surat_tugas">
                                                <label class="custom-file-label" for="customFile">Choose file</label>
                                            </div>
                                        </div>
                                    </div>
                                        -->
                                        <center>
                                            <button type="reset" class="btn btn-info">Batal</button>
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                        </center>
                                    </div>
                                </div>
                            </form>
                        </div>
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
                    <script src="../assets/vendor/select2/dist/js/select2.min.js"></script>
<!--                    <script src="../assets/vendor/clock-picker/clockpicker.js"></script>-->
                    <script>
                        $(document).ready(function () {
                            $('#surat_tugas .custom-file').datepicker({
                                format: 'dd/mm/yyyy',
                                todayBtn: 'linked',
                                todayHighlight: true,
                                autoclose: true,
                            });


                            $('.select2-single').select2();

                            // Select2 Single  with Placeholder
                            $('.select2-single-placeholder').select2({
                                placeholder: "Select a Province",
                                allowClear: true
                            });

                            // Select2 Multiple
                            $('.select2-multiple').select2();

                            // Bootstrap Date Picker
                            $('#simple-date1 .input-group.date').datepicker({
                                format: 'dd/mm/yyyy',
                                todayBtn: 'linked',
                                todayHighlight: true,
                                autoclose: true,
                            });

                            $('#simple-date2 .input-group.date').datepicker({
                                startView: 1,
                                format: 'dd/mm/yyyy',
                                autoclose: true,
                                todayHighlight: true,
                                todayBtn: 'linked',
                            });

                            $('#simple-date3 .input-group.date').datepicker({
                                startView: 2,
                                format: 'dd/mm/yyyy',
                                autoclose: true,
                                todayHighlight: true,
                                todayBtn: 'linked',
                            });

                            $('#simple-date4 .input-daterange').datepicker({
                                format: 'dd/mm/yyyy',
                                autoclose: true,
                                todayHighlight: true,
                                todayBtn: 'linked',
                            });

                            // TouchSpin

                            $('#touchSpin1').TouchSpin({
                                min: 0,
                                max: 100,
                                boostat: 5,
                                maxboostedstep: 10,
                                initval: 0
                            });

                            $('#touchSpin2').TouchSpin({
                                min: 0,
                                max: 100,
                                decimals: 2,
                                step: 0.1,
                                postfix: '%',
                                initval: 0,
                                boostat: 5,
                                maxboostedstep: 10
                            });

                            $('#touchSpin3').TouchSpin({
                                min: 0,
                                max: 100,
                                initval: 0,
                                boostat: 5,
                                maxboostedstep: 10,
                                verticalbuttons: true,
                            });

                            $('#clockPicker1').clockpicker({
                                autoclose: true,
                                startView: 1
                            });

                            $('#clockPicker2').clockpicker({
                                autoclose: true,
                                startView: 1
                            });

                            let input = $('#clockPicker3').clockpicker({
                                autoclose: true,
                                'default': 'now',
                                placement: 'top',
                                align: 'left',
                            });

                            $('#check-minutes').click(function (e) {
                                e.stopPropagation();
                                input.clockpicker('show').clockpicker('toggleView', 'minutes');
                            });

                        });
                    </script>
                    </body>
                    </html>