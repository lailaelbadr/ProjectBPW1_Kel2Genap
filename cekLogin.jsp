<%-- 
    Document   : cekLogin
    Created on : Feb 7, 2022, 9:28:04 PM
    Author     : Ella
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ussername = request.getParameter("ussername");
            String password = request.getParameter("password");

            if (password.equals("admin")) {
                if (ussername.equals("")) {
                    request.getRequestDispatcher("/view/homelogin.jsp").include(request, response);
                } else {
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from ail where nip='" + ussername + "' and password='" + password + "'");
                        if (rs.next()) {
                            request.getRequestDispatcher("/view/indexadmin2.jsp").include(request, response);

                        }
                        con.close();
                    } catch (Exception e) {
                        out.println("Salah us dan pass");
                    }
                }
            } else if (password.equals("kaleb1") || password.equals("kaleb2")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from kalab where nip='" + ussername + "' and password='" + password + "'");
                    if (rs.next()) {
                        request.getRequestDispatcher("/view/indexadmin.jsp").include(request, response);
                 
                    } else {
                        request.getRequestDispatcher("/homelogin.jsp").include(request, response);
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Salah us dan pass");
                }
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");

                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from peminjam where no_induk='" + ussername + "' and password='" + password + "'");
                    if (rs.next()) {
                        request.getRequestDispatcher("/view/indexpeminjam.jsp").include(request, response);
                  
                    } else {
                        request.getRequestDispatcher("homelogin.jsp").include(request, response);
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Salah us dan pass");
                }
            }
        %>
    </body>
</html>
