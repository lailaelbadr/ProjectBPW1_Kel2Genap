<%-- 
    Document   : modals
    Created on : Feb 10, 2022, 11:12:28 PM
    Author     : Ella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <%@include file="sidebaradmin.html"%>
            <div id="content-wrapper" class="d-flex flex-column">  
                <!-- Container Fluid-->
                <div class="container-fluid" id="container-wrapper">
                    <!-- Modal Logout -->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to logout?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                    <a href="homelogin.jsp" class="btn btn-primary">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---Container Fluid-->
            </div>
            <%@include file="footer.html"%>
    </body>
</html>
