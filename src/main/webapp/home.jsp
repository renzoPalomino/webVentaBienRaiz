
<%@page import="beans.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienes Raices</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="divBuscar.jsp"/>
    
    <!--Seccion Casa-->

    <section class="background-1  d-flex flex-wrap align-content-around justify-content-center">
        <div class="row text-white container ">
            <h1 class="col-sm-12 display-1 "><strong>Casa</strong></h1>
            <div class="col-lg-4 ">
                <div><p>Este es un texto de prueba para todas las areas de esta pagina web ya asi probar
                    que tan responsivo puede ser, para ser efectivos al momento de presentar el proyecto web diseñado 
                    en Java con JSP, ya estoy escribiendo cualquier cosa para agrandar el texto de prueba.</p></div>
            </div>
            <div class="col-lg-8 pr-lg-8"><img class="img-fluid" src="img/house.svg" ></div>
        </div>
    </section>
    
    <!--Seccion Departamento-->

    <section class="background-2  d-flex flex-wrap align-content-center justify-content-center">
        <div class="row text-color1 container">
            <h1 class="col-sm-12 display-1 "><strong>Depa</strong></h1>
            <div class="col-lg-4 ">
                <div><p>Este es un texto de prueba para todas las areas de esta pagina web ya asi probar
                    que tan responsivo puede ser, para ser efectivos al momento de presentar el proyecto web diseñado 
                    en Java con JSP, ya estoy escribiendo cualquier cosa para agrandar el texto de prueba.</p></div>
            </div>
            <div class="col-lg-8 text-center"><img class="img-fluid" src="img/apartment.svg"  width="580"></div>
        </div>
    </section>

    <!--Seccion Oficina-->

    <section class="background-1  d-flex flex-wrap align-content-center justify-content-center">
        <div class="row text-white container">
            <h1 class="col-sm-12 display-1"><strong>Oficina</strong></h1>
            <div class="col-lg-4 ">
                <div><p>Este es un texto de prueba para todas las areas de esta pagina web ya asi probar
                    que tan responsivo puede ser, para ser efectivos al momento de presentar el proyecto web diseñado 
                    en Java con JSP, ya estoy escribiendo cualquier cosa para agrandar el texto de prueba.</p></div>
            </div>
            <div class="col-lg-8 text-center"><img class="img-fluid" src="img/office.svg" width="500" height="200"></div>
        </div>
    </section>
    
    <!--Seccion Local-->

    <section class="background-2  d-flex flex-wrap align-content-center justify-content-center">
        <div class="row text-color1 container">
            <h1 class="col-sm-12 display-1 "><strong>Local</strong></h1>
            <div class="col-lg-4 ">
                <div><p>Este es un texto de prueba para todas las areas de esta pagina web ya asi probar
                    que tan responsivo puede ser, para ser efectivos al momento de presentar el proyecto web diseñado 
                    en Java con JSP, ya estoy escribiendo cualquier cosa para agrandar el texto de prueba.</p></div>
            </div>
            <div class="col-lg-8 text-center"><img class="img-fluid" src="img/local.svg"  width="540"></div>
        </div>
    </section>
    
    <!--Seccion Terreno-->

    <section class="background-1  d-flex flex-wrap align-content-center justify-content-center">
        <div class="row text-white container">
            <h1 class="col-sm-12 display-1"><strong>Terreno</strong></h1>
            <div class="col-lg-4 ">
                <div><p>Este es un texto de prueba para todas las areas de esta pagina web ya asi probar
                    que tan responsivo puede ser, para ser efectivos al momento de presentar el proyecto web diseñado 
                    en Java con JSP, ya estoy escribiendo cualquier cosa para agrandar el texto de prueba.</p></div>
            </div>
            <div class="col-lg-8 text-center"><img class="img-fluid" src="img/terreno2.svg" width="500" height="200"></div>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"/>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>