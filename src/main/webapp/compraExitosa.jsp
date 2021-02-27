<%@page import="beans.Cliente"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Compra Exitosa</title>
        <meta charset="UTF-8" http-equiv="Refresh" content="20;url=cliInmuebles.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <%
            HttpSession ses=request.getSession();
            Cliente cli=(Cliente) ses.getAttribute("cliente");
            if(cli==null){
                out.print("<script>location.replace('home.jsp');</script>");
            }
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="container d-flex " style="height: 93vh;" >
    <div class="row align-items-center">
        <!-- imagen -->
        <div class="col-md-5 pr-lg-5">
            <img src="img/order_confirmed.svg" alt="" class="img-fluid mb-3 d-md-block">
            
        </div>
        <!-- Mensaje sin datos -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <h1>¡Felicidades! <i class="bi bi-emoji-laughing"></i></h1><br>
                <div class="row">

                    <!-- Already Registered -->
                    <div class="text-center w-100 mb-4">
                        <p class="text-muted font-weight-bold">Usted acaba de adquirir un inmueble exitosamente. 
                            Puede visualizarlo en la sección Mis Inmuebles haciendo clic en el botón de aqui abajo o esperar 20 segundos 
                            y se te redirigirá automáticamente <i class="bi bi-emoji-laughing"></i>.</p>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-4">
                        <a href="cliInmuebles.jsp" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Mis inmuebles</span>
                        </a>
                    </div>
                </div>
        </div>
    </div>
</div>
    </body>
</html>
