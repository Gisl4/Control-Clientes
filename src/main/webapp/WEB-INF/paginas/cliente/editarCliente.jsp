<%-- 
    Document   : editarCliente
    Created on : 30 nov 2024, 21:27:07
    Author     : Gisell L
--%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Editar de Cliente</title>
        <!<!-- Boostrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!<!-- Boostrap Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <!<!-- Cabecero -->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp"/>

        <!<!-- Foirmulario de edicion de un cliente -->
        <form action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idCliente=${cliente.idCliente}" method="POST" class="was-validated">

            <!<!-- Botones de navegacion de edicion -->
            <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionEdicion.jsp"/>

            <div class="container my-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4>Editar Cliente</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required value="${cliente.nombre}"/>
                        </div>
                        <div class="form-group mb-3">
                            <label for="apellido">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" required value="${cliente.apellido}"/>
                        </div>
                        <div class="form-group mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required value="${cliente.email}"/>
                        </div>
                        <div class="form-group mb-3">
                            <label for="movil">Movil</label>
                            <input type="tel" class="form-control" id="movil" name="movil" required value="${cliente.movil}"/>
                        </div>
                        <div class="form-group mb-3">
                            <label for="saldo">Saldo</label>
                            <input type="number" class="form-control" id="saldo" name="saldo" required step="any" value="${cliente.saldo}"/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">
                        <i class="bi bi-floppy"></i> Guardar Cambios
                    </button>
                </div>
            </div>

        </form>

        <!<!-- Pie p�gina -->
        <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp"/>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>