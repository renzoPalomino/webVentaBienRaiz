<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.*,dao.Negocio"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<title>Actualizar Local</title>
</head>
<body>
    <%   
        Local loc=(Local)request.getAttribute("dato");
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
<div class="container mt-4">
<h1>Actualizar Local</h1>
    <form action="control" id="id_form" method="post" enctype="multipart/form-data"> 
        <input name="coda" type="hidden" value="<%=loc.getIdInmu()%>">
        <input type="hidden" name="op" value="19">	
        <div class="form-group">
            <label class="control-label" for="id_titulo">Titulo</label>
            <input class="form-control" type="text" id="id_titulo" name="titulo" value="<%=loc.getTitulo()%>">
        </div>
        <div class="form-group">
            <label class="control-label" for="id_direccion">Direcion</label>
            <input class="form-control" type="text" id="id_direccion" name="direccion" value="<%=loc.getDireccion()%>">
	</div>
        <div class="form-group">
            <label class="control-label" for="id_area">Area</label>
            <input class="form-control" type="text" id="id_area" name="area" value="<%=loc.getArea()%>">
	</div>
        
        <!-- img -->
        <div class="">
            <label class="">Imagen</label>
	</div>
        
        <div id="inmu3" class="input-group  mb-4">
            <div class="input-group-prepend">
                <span class="input-group-text bg-white px-4 border-md border-right-0">
                    <i class="bi bi-image-fill text-muted"></i>
                </span>
            </div>
            <div class="custom-file border-left-0">
                <input type="file" class="custom-file-input" id="id_imagen" name="imagen">
                <input type="hidden" name="imageDefault" value="<%=loc.getImg()%>">
                <label class="custom-file-label text-muted" for="id_imagen"><%=loc.getImg()%></label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label" for="id_descripcion">Descripcion</label>
            <input class="form-control" type="text" id="id_descripcion" name="descripcion" value="<%=loc.getDescrip()%>">
	</div>
        <div class="form-group">
            <label class="control-label" for="id_precio">Precio</label>
            <input class="form-control" type="text" id="id_precio" name="precio" value="<%=loc.getPrecio()%>">
	</div>
        <div class="form-group">
            <label class="control-label" for="id_tipo">Tipo</label>
            <input class="form-control" type="text" id="id_tipo" name="tipo" value="<%=loc.getTipo()%>">
	</div>
        <div class="form-group d-none">
            <label class="control-label" for="id_estado">Estado</label>
            <input class="form-control" type="text" id="id_estado" name="estado" value="<%=loc.getEstado()%>">
	</div>
        <div class="form-group">
            <label class="control-label" for="id_anioconstruccion">Año de Construccion</label>
            <input class="form-control" type="text" id="id_anioconstruccion" name="anioconstruccion" value="<%=loc.getAniocost()%>">
	</div>
        <div class="form-group  mb-4">
            <button type="submit" class="btn color-primary text-white btn-block py-2" >Actualizar</button>
	</div>
    </form>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</html>