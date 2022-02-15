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
                        <h1 class="h3 mb-0 text-gray-800">Approval</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Fitur</a></li>
                            <li class="breadcrumb-item">Peminjaman</li>
                            <li class="breadcrumb-item active" aria-current="page">Data Peminjaman</li>
                        </ol>
                    </div>
                    <form action="insert_data.jsp" method="Post">
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <!-- Simple Tables -->
                                <div class="card-header">

                                    <h4>Form Update Data</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-group" >
                                        <label>No Ruangan</label>
                                        <input type="text" class="form-control" name="no_ruangan">
                                    </div>
                                    <div class="form-group">
                                        <label>NIP</label>
                                        <%@page import= "java.sql.*, java.io.*"%>

                                        <%
                                            try {
                                                String Host = "jdbc:mysql://localhost:3306/genap";
                                                Connection connection = null;
                                                Statement statement = null;
                                                ResultSet rs = null;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                connection = DriverManager.getConnection(Host, "root", "");
                                                statement = connection.createStatement();
                                                String Data = "Select nip from ail";
                                                rs = statement.executeQuery(Data);%>
                                        <select name="nip" class="form-control">
                                            <%while (rs.next()) {%>
                                            <option><%=rs.getString("nip")%></option>
                                            <%}%>
                                        </select><%
                                                rs.close();
                                                statement.close();
                                                connection.close();
                                            } catch (SQLException e) {
                                                out.println("Can't connect to database, with error = " + e.getMessage());
                                            }
                                        %>
                                    </div>
                                    <div class="form-group">
                                        <label>Nama(AIL) </label>
                                        <%
                                            try {
                                                String Host = "jdbc:mysql://localhost:3306/genap";
                                                Connection connection1 = null;
                                                Statement statement1 = null;
                                                ResultSet rs1 = null;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                connection1 = DriverManager.getConnection(Host, "root", "");
                                                statement1 = connection1.createStatement();
                                                String Data1 = "Select nama from ail";
                                                   rs1 = statement1.executeQuery(Data1);%>
                                        <select name="nama" class="form-control">
                                            <%while (rs1.next()) {%>
                                            <option><%=rs1.getString("nama")%></option>
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
                                        <label>Keterangan</label>
                                        <input type="text" class="form-control" name="keterangan_ruangan">
                                    </div>
                                    <div class="card-footer text-right">
                                        <button class="btn btn-primary" type="submit" name="SimpanData" value="Simpan">Simpan</button>
                                    </div>

                                    <div class="card-footer"></div>

                                </div>
                            </div>
                        </div>
                        </body>
                        </html>
