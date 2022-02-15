<%-- 
    Document   : save_peminjaman
    Created on : Feb 6, 2022, 10:53:51 AM
    Author     : User
--%>



<%@page import="java.sql.*,java.util.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    int kode_peminjaman = Integer.parseInt(request.getParameter("kode_peminjaman"));
    String kategori = request.getParameter("kategori");
    String nama_peminjam = request.getParameter("nama_peminjam");
    String no_induk = request.getParameter("no_induk");
    String email = request.getParameter("email");
    String no_telp = request.getParameter("no_telp");
    String level = request.getParameter("level");
    String tanggal_peminjaman = request.getParameter("tanggal_peminjaman");
    String tanggal_mulai = request.getParameter("tanggal_mulai");
    String tanggal_akhir = request.getParameter("tanggal_akhir");
    String jam_mulai = request.getParameter("jam_mulai");
    String jam_selesai = request.getParameter("jam_selesai");
    String keperluan = request.getParameter("keperluan");
    String no_ruangan = request.getParameter("no_ruangan");
    String surat_tugas = request.getParameter("surat_tugas");
    String host = "jdbc:mysql://localhost:3306/genap";
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (kode_peminjaman != 0) {

                PreparedStatement pst = conn.prepareStatement("INSERT INTO peminjaman VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pst.setInt(1, kode_peminjaman);
                pst.setString(2, kategori);
                pst.setString(3, nama_peminjam);
                pst.setString(4, no_induk);
                pst.setString(5, email);
                pst.setString(6, no_telp);
                pst.setString(7, level);
                pst.setString(8, tanggal_peminjaman);
                pst.setString(9, tanggal_mulai);
                pst.setString(10, tanggal_akhir);
                pst.setString(11, jam_mulai);
                pst.setString(12, jam_selesai);
                pst.setString(13, keperluan);
                pst.setString(14, no_ruangan);
                pst.setString(15, surat_tugas);
                pst.setString(16, "pengajuan");
                pst.executeUpdate();

                response.sendRedirect("data.jsp");
            }
        } else {
            response.sendRedirect("gagalSimpanPeminjaman.jsp");
        }
  //  } //catch (SQLException ex) {
      //  out.print("Gagal Koneksi");
    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>
