<%-- 
    Document   : listadoClientes
    Created on : 29 nov 2024, 19:35:34
    Author     : Gisell L
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Listado Clientes -->
<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de Clientes</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Saldo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cliente" items="${clientes}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${cliente.nombre} ${cliente.apellido}</td>
                                    <td><fmt:formatNumber value="${cliente.saldo}" type="currency" currencySymbol="€"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}"
                                           class="btn btn-secondary btn-sm">
                                            <i class="bi bi-pencil-square"></i> Editar
                                        </a>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idCliente=${cliente.idCliente}"
                                           class="btn btn-danger btn-sm">
                                            <i class="bi bi-trash3"></i> Eliminar
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!<!-- Totales -->
            </div>
            <div class="col-md-3">
                <div class="card text-center text-white mb-3" style="background-color: #8b7355;">
                    <div class="card-body">
                        <h3>Saldo Total</h3>
                        <h4 class="display-6">
                            <fmt:formatNumber value="${saldoTotal}" type="currency" />
                        </h4>
                    </div>
                </div>
                <div class="card text-center text-white mb-3" style="background-color: #8b7355;">
                    <div class="card-body">
                        <h3>Total Clientes</h3>
                        <h4 class="display-6">
                            <i class="bi bi-people"></i> ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>