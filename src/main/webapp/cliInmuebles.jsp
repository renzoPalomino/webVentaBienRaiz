
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mis inmuebles</title>
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
            if(cli==null || cli.getNivel()==0){
                out.print("<script>location.replace('home.jsp');</script>");
            }
            
            Negocio obj= new Negocio();
            List<Inmueble> listCasa=(ArrayList) obj.cliListCasa(cli.getIdcli());
            List<Inmueble> listDep=(ArrayList) obj.cliListDepartamento(cli.getIdcli());
            List<Inmueble> listOfi=(ArrayList) obj.cliListOficina(cli.getIdcli());
            List<Inmueble> listLocal=(ArrayList) obj.cliListLocal(cli.getIdcli());
            List<Inmueble> listTerreno=(ArrayList) obj.cliListTerreno(cli.getIdcli());
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="container d-flex " style="height: 93vh;" >
    <div class="row align-items-center">
        <%if(listCasa.isEmpty()&&listDep.isEmpty()&&listOfi.isEmpty()&&listLocal.isEmpty()&&listTerreno.isEmpty()){%>
        <!-- imagen sin Datos -->
        <div class="col-md-5 pr-lg-5">
            <img src="img/empty.svg" alt="" class="img-fluid mb-3 d-md-block">
            
        </div>
        <!-- Mensaje sin datos -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <h1>Oh no! <i class="bi bi-emoji-dizzy"></i></h1><br>
                <div class="row">

                    <!-- Already Registered -->
                    <div class="text-center w-100 mb-4">
                        <p class="text-muted font-weight-bold">Al parecer aun no has comprado ningun inmuble  <i class="bi bi-emoji-frown"></i>
                        . Puedes comprar haciendo clic en el botón de aqui abajo <i class="bi bi-emoji-laughing"></i>.</p>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-4">
                        <a href="home.jsp" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Buscar Inmueble</span>
                        </a>
                    </div>
                </div>
        </div>
    </div>
</div>
        <%}else{%>
        <!--si hay datos-->
        <!--Resultados de Casa-->
        <div class="container mb-5">
            
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listCasa){%>
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
                                <p><b>Número de habitaciones: </b><%=x.getNumHab()%></p>
                                <p><b>Número de baños: </b><%=x.getNumBanio()%></p>
                                <p><b>Número de estacionamientos: </b><%=x.getNumGarage()%></p>
                                <p><b>Año de construcción: </b><%=x.getAnioConst()%></p>
                                <p><b>Precio: </b><%=x.getPrecio()%> Soles</p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <p><b>Estado: </b><%=x.getDscEstado()%></p>
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                          </div>

                    </div>
                  </div>
                </div>
                <%}%> 
            
            <!--Resultados de Departamento-->
                
                <% for(Inmueble x:listDep){%>
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
                                <p><b>Número de habitaciones: </b><%=x.getNumHab()%></p>
                                <p><b>Número de baños: </b><%=x.getNumBanio()%></p>
                                <p><b>Número de estacionamientos: </b><%=x.getNumGarage()%></p>
                                <p><b>Año de construcción: </b><%=x.getAnioConst()%></p>
                                <p><b>Precio: </b><%=x.getPrecio()%> Soles</p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <p><b>Estado: </b><%=x.getDscEstado()%></p>
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                            
                      </div>

                    </div>
                  </div>
                </div>
                <%}%> 
            
        <!--Resultados de Oficina-->
                
                <% for(Inmueble x:listOfi){%>
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
                                <p><b>Número de baños: </b><%=x.getNumBanio()%></p>
                                <p><b>Número de estacionamientos: </b><%=x.getNumGarage()%></p>
                                <p><b>Año de construcción: </b><%=x.getAnioConst()%></p>
                                <p><b>Precio: </b><%=x.getPrecio()%> Soles</p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <p><b>Estado: </b><%=x.getDscEstado()%></p>
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                          
                      </div>

                    </div>
                  </div>
                </div>
                <%}%> 
            
        <!--Resultados de Local-->
                
                <% for(Inmueble x:listLocal){%>
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
                                <p><b>Año de construcción: </b><%=x.getAnioConst()%></p>
                                <p><b>Precio: </b><%=x.getPrecio()%> Soles</p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <p><b>Estado: </b><%=x.getDscEstado()%></p>
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                          
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>
            
        <!--Resultados de Terreno-->
                
                <% for(Inmueble x:listTerreno){%>
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
                                <p><b>Precio: </b><%=x.getPrecio()%> Soles</p>
                                <p><b>Tipo: </b><%=x.getDscTipo()%></p>
                                <p><b>Estado: </b><%=x.getDscEstado()%></p>
                            </div>
                        </div>
                      </div>

                      <!-- Modal-Inmueble footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-outline-danger mr-2" data-dismiss="modal"><div class="pr-2 pl-2">Cancelar</div></button>
                          
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
        <%}%>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
