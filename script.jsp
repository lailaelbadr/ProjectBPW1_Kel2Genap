<%-- 
    Document   : script
    Created on : Feb 7, 2022, 3:22:45 PM
    Author     : ASUS ViviBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/ruang-admin.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="js/demo/chart-area-demo.js"></script>  
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTable').DataTable(); // ID From dataTable 
                $('#dataTableHover').DataTable(); // ID From dataTable with Hover
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
                    donetext: 'Done'
                });

                $('#clockPicker2').clockpicker({
                    autoclose: true
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
        <script src="../assets/js/main.js"></script>
    </body>
</html>
