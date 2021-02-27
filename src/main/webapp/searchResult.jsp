<%@page session="true"%>
<%@page import="beans.Cliente"%>
<%@page import="beans.Inmueble, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
        <title>Busqueda</title>
    </head>
    <body>
        <script src="https://www.paypal.com/sdk/js?client-id=ASpIFgq5kjcNx5Jdr5QDKxpdUMmLdpLbggMk5bweUKGD75_yD3WC6P-WeT-oKf-cNEJgfhZsrJXcJVit"></script>
        <%
            List<Inmueble> lis=(ArrayList) request.getAttribute("dato");
            HttpSession ses2=request.getSession();
            boolean stateSession=false;
            int idcli=0;
            Cliente cli2=(Cliente) ses2.getAttribute("cliente");
            if(cli2!=null){
              stateSession=true;
              idcli=cli2.getIdcli();
            }
        
        %>
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="divBuscar.jsp"/>
        
        <!--Resultados de la busqueda-->
        <div class="container ">
            <h2 class="h2 pt-3">Resultados de la busqueda</h2>
            
                <% if(lis.isEmpty()){%>
                <div class="container d-flex py-5 "  >
    <div class="row align-items-center">
        <!-- imagen sin Datos -->
        <div class="col-md-5 pr-lg-5">
            <img src="img/wrong.svg" class="img-fluid mb-3 d-md-block">
            
        </div>
        <!-- Mensaje sin datos -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <h1>Lo sentimos <i class="bi bi-emoji-frown"></i></h1><br>
                <div class="row">

                    <!-- Already Registered -->
                    <div class="text-center w-100 col-lg-12 mb-4">
                        <p class="text-muted font-weight-bold">No existe ningún resultado de acuerdo a su criterio de búsqueda 
                            <i class="bi bi-emoji-frown"></i>.
                         Próximamente encontrará nuevos inmuebles <i class="bi bi-emoji-laughing"></i>.</p>
                    </div>

                    
                </div>
        </div>
    </div>
</div>
                <%}else{%>
                <div class="card-columns  pt-3 ">
                <% for(Inmueble x:lis){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                    </div>
                </div>
                <!-- The Modal-Inmueble -->
                <div class="modal fade" id="myModal-Inmueble<%=x.getIdInmueble()%>">
                  <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">

                      <!-- Modal-Inmueble Header -->
                      <div class="modal-header">
                        <h4 class="modal-title"><%=x.getTitulo()%></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <!-- Modal-Inmueble body -->
                      <div class="modal-body">
                        <div class="row container ">
                            <div class="col-lg-7 ">
                                <img class="img-fluid" src="img/inmuebles/<%=x.getImg()%>">
                            </div>
                            <div class="col-lg-5 ">
                                <h4 class="h4">Descripción</h4>
                                <p><%=x.getDescripcion()%></p>
                                <p><b>Dirección: </b><%=x.getDireccion()%></p>
                                <p><b>Área: </b><%=x.getArea()%> &#13217</p>
                                <%if(x.getNumHab()!=0){%>
                                <p><b>Número de habitaciones: </b><%=x.getNumHab()%></p><%}%>
                                <%if(x.getNumBanio()!=0){%>
                                <p><b>Número de baños: </b><%=x.getNumBanio()%></p><%}%>
                                <%if(x.getNumGarage()!=0){%>
                                <p><b>Número de estacionamientos: </b><%=x.getNumGarage()%></p><%}%>
                                <%if(x.getAnioConst()!=0){%>
                                <p><b>Año de construcción: </b><%=x.getAnioConst()%></p><%}%>
                                <!--
                                <%if(x.getTipo()==1){%>
                                <div><p><b>Cuotas: </b><input class="buttons-only" type="number" value="1" min="1" max="24" step="1"/></p></div>
                                <%}%>
                                -->
                                <p id="precioP-<%=x.getIdInmueble()%>"><b>Precio: </b>S/<%=x.getPrecio()%></p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <!--p><b>Precio Total: </b>S/ Total</p-->
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                          <%if(stateSession){%>
                          <div id="paypal-button-container-<%=x.getIdInmueble()%>" class="col-lg-4"></div>
                          <%}%>
                      </div>

                    </div>
                  </div>
                </div>
                
                <%if(stateSession){%>
                <script>
      paypal.Buttons({
          style: {
          shape: 'rect',
          color: 'gold',
          layout: 'horizontal',
          label: 'buynow',
          tagline: false
        },
        createOrder: function(data, actions) {
          var precio = document.getElementById("precioP-<%=x.getIdInmueble()%>").innerHTML.replace('<b>Precio: </b>S/','');
          console.log("variable PRECIO: "+precio);
          var precioUSD = parseInt(precio) * 0.29;
          console.log("variable PRECIOUSD: "+precioUSD);
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: precioUSD.toFixed(2)
              }
            }]
          });
        },
        onApprove: function(data, actions) {
          return actions.order.capture().then(function(details) {
            //alert('Transaction completed by ' + details.payer.name.given_name);
            location.href="control?op=27&idcli=<%=idcli%>&idinmu=<%=x.getIdInmueble()%>&total=<%=x.getPrecio()%>";
          });
        },
        onError: function(err) {
          console.log(err);
        }
      }).render('#paypal-button-container-<%=x.getIdInmueble()%>'); // Display payment options on your web page
    </script>        
    <%}%>            
                <%}%>  
                <%}%> 
            </div>

                
        </div>
    
    
    
    <jsp:include page="footer.jsp"/>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/bootstrap-input-spinner.js"></script>
    <script>
    $(".buttons-only").inputSpinner({buttonsOnly: true})
    </script>
</html>
