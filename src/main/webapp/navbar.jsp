<%@page session="true"%>
<%@page import="beans.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            HttpSession ses=request.getSession();
            String nombre="";
            int nivel=2;//0=admin, 1=user
            boolean stateSession=false;
            Cliente cli=(Cliente) ses.getAttribute("cliente");
            if(cli!=null){
              nivel=cli.getNivel();
              nombre=cli.getNomcli();
              stateSession=true;
            }
            
        %>
<!--navBar-->
        <nav class="navbar navbar-expand-md color-primary navbar-dark py-3">
            <%if (nivel==0){%>
            <a class="navbar-brand" href="adminpage.jsp">Bienes Raices</a>
            <%}else{%>
            <a class="navbar-brand" href="home.jsp">Bienes Raices</a>
            <%}%>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
        </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
      
    <ul class="navbar-nav mr-auto">
        <%if (nivel==0){%>
      <li class="nav-item px-2">
        <a class="nav-link" href="adminpage.jsp">Estadísticas</a>
      </li>
      <li class="nav-item px-2">
        <a class="nav-link" href="dashboard.jsp">Inmuebles</a>
      </li>
      <%}%>
      <%if (nivel==1){%>
      <li class="nav-item px-2">
        <a class="nav-link" href="cliInmuebles.jsp">Mis inmuebles</a>
      </li>
      <%}%>
    </ul>
    
      <div class="form-inline justify-content-center">
      <div class="nav-item px-2 ">
          <%if (nivel==2){%>
        <a class="btn btn-outline-light" href="login.jsp">Inicia Sesión</a>
        <%}else{%>
        <span class="text-white">Hola, <%=nombre%></span>
        <%}%>
      </div>
      <div class="nav-item px-2 ">
          <%if (nivel==2){%>
        <a class="btn btn-outline-light" href="register.jsp">Regístrate</a>
        <%}else{%>
        <a class="btn btn-outline-light" href="control?op=26">Cerrar Sesión</a>
        <%}%>
      </div>
      </div>
  </div> 
</nav>
