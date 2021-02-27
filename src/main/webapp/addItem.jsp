<%@page import="beans.Cliente"%>
<%@page import="dao.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
        <title>Añadir Inmueble</title>
    </head>
    <body onload="hiddenInputs()">
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
            <div class="row pt-5 align-items-center">



                <!-- insert Form -->
                <div class="col-md-12 col-lg-12 ml-auto">
                    <h1>Nuevo Inmueble</h1><br>
                    <%
                        Negocio obj = new Negocio();
                        String texto = "", clase = "";
                        if (request.getParameter("opcion") != null && !request.getParameter("opcion").isEmpty()) {
                            int res = Integer.parseInt(request.getParameter("opcion").toString());
                            if (res == 0) {
                                texto = "No se ha podido registrar inmueble :(";
                                clase = "alert alert-danger";
                            } else if (res > 0) {
                                texto = "Inmueble registrado correctamente.";
                                clase = "alert alert-success";
                            }
                    %>
                    <div class="<%=clase%>" role="alert">
                        <%=texto%>
                    </div>
                    <%
                        }
                    %>

                    <form action="control" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <!-- ID inmueble -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-key-fill text-muted"></i>
                                    </span>
                                </div>
                                <input value="<%=obj.IdInmueble()%>" id="firstName"  type="text" name="idInmueble" placeholder="ID Inmueble" class="form-control bg-white border-left-0 border-md" readonly >
                            </div>

                            <!-- Tipo inmuble -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-house-fill text-muted"></i>
                                    </span>
                                </div>
                                <select class="form-control" id="sel2" name="operacion" onchange="showInputs()">
                                    <option value="0" selected>--Seleccione un tipo de inmueble--</option>
                                    <option value="1">Casa</option>
                                    <option value="2">Departamento</option>
                                    <option value="3">Oficina</option>
                                    <option value="4">Local</option>
                                    <option value="5">Terreno</option>
                                </select>
                            </div>

                            <!-- Titulo -->
                            <div id="inmu0" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-pencil-fill text-muted"></i>
                                    </span>
                                </div>
                                <input id="firstName" type="text" name="titulo" placeholder="Titulo" class="form-control bg-white border-left-0 border-md" >
                            </div>

                            <!-- Direccion -->
                            <div id="inmu1" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-address-card text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="direccion" placeholder="Direccion" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Area -->
                            <div id="inmu2" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-textarea text-muted"></i>
                                    </span>
                                </div>
                                <input id="phoneNumber" type="tel" name="area" placeholder="Área" class="form-control bg-white border-md border-left-0 pl-3">
                                <span style="max-width: 50px" class="form-control bg-white border-left-0 border-md h-100 font-weight-bold text-muted">&#13217</span>
                            </div>

                            <!-- img -->
                            <div id="inmu3" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-image-fill text-muted"></i>
                                    </span>
                                </div>
                                <div class="custom-file border-left-0">
                                    <input type="file" class="custom-file-input" id="customFile" name="imagen">
                                    <label class="custom-file-label text-muted" for="customFile">Agrega una imagen</label>
                                </div>
                            </div>

                            <!-- Descripcion -->
                            <div id="inmu4" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-file-text-fill text-muted"></i>
                                    </span>
                                </div>
                                <textarea id="descripcion" type="text" name="descrip" rows="8" placeholder="Descripción" class="form-control bg-white border-left-0 border-md"></textarea>
                            </div>

                            <!-- Precio -->
                            <div id="inmu5" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-usd text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="precio" placeholder="Precio" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Tipo (venta o alquiler) -->
                            <div id="inmu6" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-list-stars text-muted"></i>
                                    </span>
                                </div>
                                <select class="form-control" id="sel1" name="tipo_venta">
                                    <option value="0">Venta</option>
                                    <option value="1">Alquiler</option>
                                </select>
                            </div>

                            <!-- Num Habitaciones -->
                            <div id="inmuCasaDep" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-bed text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="numHab" placeholder="Número de habitaciones" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Num Baños -->
                            <div id="inmuCasaDepOffice0" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-bath text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="numBanio" placeholder="Número de baños" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Num Garage -->
                            <div id="inmuCasaDepOffice1" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-car text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="numGarage" placeholder="Número de estacionamientos" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Año construido -->
                            <div id="inmuCasaDepOfficeLocal" class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="bi bi-hash text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="anioConst" placeholder="Año construido" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Submit Button Casa -->
                            <div id="buttonCasa" class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn color-primary text-white btn-block py-2" >
                                    <span class="font-weight-bold">Añadir Casa</span>
                                </button>
                            </div>
                            <!-- Submit Button Dep -->
                            <div id="buttonDep" class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn color-primary text-white btn-block py-2" >
                                    <span class="font-weight-bold">Añadir Departamento</span>
                                </button>
                            </div>
                            <!-- Submit Button Oficina -->
                            <div id="buttonOficina" class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn color-primary text-white btn-block py-2">
                                    <span class="font-weight-bold">Añadir Oficina</span>
                                </button>
                            </div>
                            <!-- Submit Button Local -->
                            <div id="buttonLocal" class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn color-primary text-white btn-block py-2" >
                                    <span class="font-weight-bold">Añadir Local</span>
                                </button>
                            </div>
                            <!-- Submit Button Terreno -->
                            <div id="buttonTerreno" class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn color-primary text-white btn-block py-2" >
                                    <span class="font-weight-bold">Añadir Terreno</span>
                                </button>
                                <!--
                                  <a href="#" class="btn color-primary text-white btn-block py-2">
                                      <span class="font-weight-bold">Añadir Terreno</span>
                                  </a>
                                -->
                            </div>


                            <!-- Already Registered -->
                            <div class="text-center w-100 my-4">
                                <input type="hidden" name="op" value="7">
                                <p class="text-muted font-weight-bold">¿Ya tienes inmuebles agregados? <a href="dashboard.jsp" class="text-primary ml-2">Chequéalos aqui</a></p>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</html>
