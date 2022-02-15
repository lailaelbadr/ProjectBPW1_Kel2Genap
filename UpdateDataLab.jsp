<%-- 
    Document   : UpdateDataLab
    Created on : Feb 11, 2022, 1:10:05 AM
    Author     : A S U S
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1 class="h3 mb-0 text-gray-800"></h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">Peminjaman</li>
                            <li class="breadcrumb-item active" aria-current="page">Data Peminjaman</li>
                        </ol>
                    </div>
                    <form action="update_data.jsp" method="Post">
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <!-- Simple Tables -->
                                <div class="card-header">

                                    <h4>Form Update Data</h4>
                                </div>
                                <%
                                    try {
                                        String no_ruangan = request.getParameter("no_ruangan");
                                        String nip = request.getParameter("nip");
                                        String nama = request.getParameter("nama");
                                        String keterangan_ruangan = request.getParameter("keterangan_ruangan");
                                        String Host = "jdbc:mysql://localhost:3306/genap";
                                        Connection connection = null;
                                        Statement statement = null;
                                        ResultSet rs = null;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection(Host, "root", "");
                                        statement = connection.createStatement();
                                        String Data = "Select * from datalab where no_ruangan=" + no_ruangan;
                                        rs = statement.executeQuery(Data);
                                        while (rs.next()) {
                                %>
                                <div class="card-body">
                                    <div class="form-group" >
                                        <label>No Ruangan</label>
                                        <input type="text" class="form-control" name="no_ruangan" value="<%=rs.getString("no_ruangan")%>"/>
                                    </div>
                                    <div class="form-group">
                                        <label>NIP</label>


                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection connection1 = DriverManager.getConnection(Host, "root", "");
                                                Statement statement1 = connection1.createStatement();
                                                String nip1 = rs.getString("nip");
                                                String Data1 = "Select * from ail where nip!=\"" + nip1 + "\";";
                                                ResultSet rs1 = statement1.executeQuery(Data1);%>
                                        <select name="nip" class="form-control">
                                            <option><%=rs.getString("nip")%></option>
                                            <%while (rs1.next()) {%>
                                            <option><%=rs1.getString("nip")%></option>
                                            <%}%>
                                        </select><%
                                                rs1.close();
                                                statement1.close();
                                                connection1.close();
                                            } catch (SQLException e) {
                                                out.println("Can't connect to database, with error = " + e.getMessage());
                                            }
                                        %>
                                    </div>
                                    <div class="form-group">
                                        <label>Nama(AIL) </label>


                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection connection2 = DriverManager.getConnection(Host, "root", "");
                                                Statement statement2 = connection2.createStatement();
                                                String nama2 = rs.getString("nama");
                                                String Data2 = "Select * from ail where nama!=\"" + nama2 + "\";";
                                                ResultSet rs2 = statement2.executeQuery(Data2);%>
                                        <select name="nama" class="form-control">
                                            <option><%=rs.getString("nama")%></option>
                                            <%while (rs2.next()) {%>
                                            <option><%=rs2.getString("nama")%></option>
                                            <%}%>
                                        </select><%
                                                rs2.close();
                                                statement2.close();
                                                connection2.close();
                                            } catch (SQLException e) {
                                                out.println("Can't connect to database, with error = " + e.getMessage());
                                            }
                                        %>
                                    </div>
                                    <div class="form-group">
                                        <label>Keterangan</label>
                                        <input type="text" class="form-control" name="keterangan_ruangan" value="<%=rs.getString("keterangan_ruangan")%>"/>
                                    </div>
                                    <div class="card-footer text-right">
                                        <button class="btn btn-primary" type="submit" name="UpdateData" value="Simpan">Simpan</button>
                                    </div>
                                </div>
                            </div>
                    </form>
                    <% }
                            rs.close();
                            statement.close();
                            connection.close();
                        } catch (Exception e) {
                            out.println("Can't connect to database, with error = " + e.getMessage());
                        }
                    %>      
                    </table>

                </div>

                <div class="card-footer"></div>

            </div>
        </div>
    </div>
</body>
</html>
