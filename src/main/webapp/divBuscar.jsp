
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Buscar Inmueble-->
    <div class="color-primary">
        <div class="container">
            <h2 class="h2 text-white">Buscar Inmueble</h2>
            <form action="control" method="post" enctype="multipart/form-data">
                <input type="hidden" name="op" value="13">
            <div class="row text-center p-3">
                <div class="col-sm-4">
                    
                    <div class="form-group">
                      <select class="form-control" id="sel1" name="inmu">
                          <option value="1" selected>Casa</option>
                          <option value="2">Departamento</option>
                          <option value="3">Oficina</option>
                          <option value="4">Local</option>
                          <option value="5">Terreno</option>
                      </select>
                    </div> 
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                      <select class="form-control" id="sel1" name="tipo">
                          <option value="1" selected>Alquiler</option>
                          <option value="0">Venta</option>
                      </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <button type="submit" class="btn btn-success btn-block">Buscar</button>
                </div>
            </div>
            </form>
        </div>
    </div>