
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Page Admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
        <script src='https://cdn.jsdelivr.net/npm/chart.js@2.8.0'></script>
        <!--script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script-->
    </head>
    <body onload="start()">
        <%
            Negocio obj= new Negocio();
            int numCasaT = obj.numCasaT();
            int numDepT=obj.numDepT();
            int numOfiT=obj.numOfiT();
            int numLocT=obj.numLocT();
            int numTerrT=obj.numTerrT();
        %>
        <jsp:include page="navbar.jsp"/>
        <!--impide que se accesa a la pagina sin inicar sesion-->
        <%
            HttpSession ses=request.getSession();
            Cliente cli=(Cliente) ses.getAttribute("cliente");
            if(cli==null || cli.getNivel()==1){
                out.print("<script>location.replace('home.jsp');</script>");
            }
        %>
        <div class="container "  >
            <!--Total inmuebles-->
            <div class="row text-center d-flex flex-wrap align-content-center justify-content-center py-5">
                <div class="col-lg-7">
            <div class="card shadow" >
                <div class="card-header">
                    <h4 class="card-title">Total</h4>
                </div>
                
                <div class="card-body">
                    <div class="chart-pie">
                        <canvas id="chart-Total"  ></canvas>    
                    </div>
                </div>
            </div>
                </div>
            </div>
            
            
        </div>
        
    </body>
    <script>
        
    function chartTotal() {
        var ctx = document.getElementById("chart-Total");
        var myLineChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ["Casa", "Departamento", "Oficina", "Local", "Terreno"],
                datasets: [{
                    data: [<%=numCasaT%>, <%=numDepT%>, <%=numOfiT%>, <%=numLocT%>, <%=numTerrT%>],
                    backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)", "rgba(0, 100, 255, 0.5)", "rgba(255, 102, 0, 0.5)"],
                    hoverBackgroundColor: ["rgb(255, 0, 0)", "rgb(100, 255, 0)", "rgb(200, 50, 255)", "rgb(0, 100, 255)", "rgb(255, 102, 0)"],
                    hoverBorderColor: "rgba(234, 236, 244, 1)"
                }]
            },
            options: {
              maintainAspectRatio: false,
              tooltips: {
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10
              },
              legend: {
                display: true,
                position: 'right'
              },
              cutoutPercentage: 60
            }
        });
    };
    
    
    
    
    function start(){
        chartTotal();
    }
</script>
</html>
