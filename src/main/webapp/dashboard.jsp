<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio,java.util.*" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <%
            Negocio obj= new Negocio();
            List<Inmueble> listCasa=(ArrayList) obj.listCasa();
            List<Inmueble> listDep=(ArrayList) obj.listDepartamento();
            List<Inmueble> listOfi=(ArrayList) obj.listOficina();
            List<Inmueble> listLocal=(ArrayList) obj.listLocal();
            List<Inmueble> listTerreno=(ArrayList) obj.listTerreno();
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
        <div class="container d-flex " style="height: 93vh;" >
    <div class="row align-items-center">
        
        <%if(listCasa.isEmpty()&&listDep.isEmpty()&&listOfi.isEmpty()&&listLocal.isEmpty()&&listTerreno.isEmpty()){%>
        <!-- imagen sin Datos -->
        <div class="col-md-5 pr-lg-5">
            <img src="img/noData.svg" alt="" class="img-fluid mb-3 d-md-block">
            
        </div>
        <!-- Mensaje sin datos -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <h1>Oh no! <i class="bi bi-emoji-dizzy"></i></h1><br>
                <div class="row">

                    <!-- Already Registered -->
                    <div class="text-center w-100 mb-4">
                        <p class="text-muted font-weight-bold">Al parecer aun no tienes agregado ningun inmuble  <i class="bi bi-emoji-frown"></i>
                        . Puedes agregar uno haciendo clic en el botón de aqui abajo <i class="bi bi-emoji-laughing"></i>.</p>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-4">
                        <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Nuevo Inmueble</span>
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
            <div class="row align-items-center">
                <div class="col-md-8 pr-lg-8"><h2 class="h2 pt-3 col-md-7 col-lg-6">Casas</h2></div>
                <div class="col-md-4 pr-lg-4">
                    <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Añadir Inmueble</span>
                        </a>
                </div>
                
            </div>
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listCasa){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                      <!--Edit-->
                      <a class="btn btn-outline-success" href="control?op=14&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                      <!--Delete-->
                      <a class="btn btn-outline-danger" href="control?op=8&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
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
                          <!--Edit button-->
                          <a class="btn btn-success" href="control?op=14&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                          <!--Delete Button-->
                          <a class="btn btn-danger" href="control?op=8&id=<%=x.getIdInmueble()%>" ><i class="bi bi-trash-fill"></i></a>
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
            
            <!--Resultados de Departamento-->
        <div class="container mb-5">
            <div class="row align-items-center">
                <div class="col-md-8 pr-lg-8"><h2 class="h2 pt-3 col-md-7 col-lg-6">Departamentos</h2></div>
                <div class="col-md-4 pr-lg-4">
                    <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Añadir Inmueble</span>
                        </a>
                </div>
                
            </div>
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listDep){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                      <!--Edit-->
                      <a class="btn btn-outline-success" href="control?op=16&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                      <!--Delete-->
                      <a class="btn btn-outline-danger" href="control?op=9&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
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
                          <!--Edit button-->
                          <a class="btn btn-success" href="control?op=16&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                          <!--Delete button-->
                      <a class="btn btn-danger" href="control?op=9&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
            
        <!--Resultados de Oficina-->
        <div class="container mb-5">
            <div class="row align-items-center">
                <div class="col-md-8 pr-lg-8"><h2 class="h2 pt-3 col-md-7 col-lg-6">Oficinas</h2></div>
                <div class="col-md-4 pr-lg-4">
                    <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Añadir Inmueble</span>
                        </a>
                </div>
                
            </div>
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listOfi){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                      <!--Edit-->
                      <a class="btn btn-outline-success" href="control?op=20&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                      <!--Delete-->
                      <a class="btn btn-outline-danger" href="control?op=10&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
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
                          <!--Edit button-->
                          <a class="btn btn-success" href="control?op=20&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                          <!--Delete button-->
                      <a class="btn btn-danger" href="control?op=10&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
            
        <!--Resultados de Local-->
        <div class="container mb-5">
            <div class="row align-items-center">
                <div class="col-md-8 pr-lg-8"><h2 class="h2 pt-3 col-md-7 col-lg-6">Locales</h2></div>
                <div class="col-md-4 pr-lg-4">
                    <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Añadir Inmueble</span>
                        </a>
                </div>
                
            </div>
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listLocal){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                      <!--Edit-->
                      <a class="btn btn-outline-success" href="control?op=18&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                      <!--Delete-->
                      <a class="btn btn-outline-danger" href="control?op=11&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
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
                          <!--Edit button-->
                          <a class="btn btn-success" href="control?op=18&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                          <!--Delete button-->
                      <a class="btn btn-danger" href="control?op=11&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
            
        <!--Resultados de Terreno-->
        <div class="container mb-5">
            <div class="row align-items-center">
                <div class="col-md-8 pr-lg-8"><h2 class="h2 pt-3 col-md-7 col-lg-6">Terrenos</h2></div>
                <div class="col-md-4 pr-lg-4">
                    <a href="control?op=6" class="btn color-primary text-white btn-block py-2">
                            <span class="font-weight-bold">Añadir Inmueble</span>
                        </a>
                </div>
                
            </div>
            
            <div class="card-columns  pt-3 ">
                
                <% for(Inmueble x:listTerreno){%>
                <div class="card" >
                    <img class="card-img-top" src="img/inmuebles/<%=x.getImg()%>">
                    <div class="card-body">
                      <h4 class="card-title"><%=x.getTitulo()%></h4>
                      
                      <a class="btn btn-primary" data-toggle="modal" data-target="#myModal-Inmueble<%=x.getIdInmueble()%>">Ver más</a>
                      <!--Edit-->
                      <a class="btn btn-outline-success" href="control?op=22&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                      <!--Delete-->
                      <a class="btn btn-outline-danger" href="control?op=12&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
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
                          <!--Edit button-->
                          <a class="btn btn-success" href="control?op=22&id=<%=x.getIdInmueble()%>"><i class="bi bi-pen-fill"></i></a>
                          <!--Delete button-->
                      <a class="btn btn-danger" href="control?op=12&id=<%=x.getIdInmueble()%>"><i class="bi bi-trash-fill"></i></a>
                        
                      </div>

                    </div>
                  </div>
                </div>
                <%}%>    
            </div>

                
        </div>
        <%}%>
        <jsp:include page="footer.jsp"/>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
