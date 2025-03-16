<%
    String cepParametro = request.getParameter("cep");
    List<Cep> listaCep;

    if (cepParametro != null && !cepParametro.isEmpty()) {
        // Buscar apenas os resultados que correspondem ao CEP informado
        listaCep = CepDAO.buscarCep(cepParametro);
    } else {
        // Caso nenhum CEP tenha sido informado, listar todos os registros
        listaCep = CepDAO.buscarCep(cepParametro);
    }
    listaCep = CepDAO.buscarCep(cepParametro);
    pageContext.setAttribute("listaCep", listaCep);
%>

<%@page import="org.apache.catalina.LifecycleState"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../css/estilos.css">
	</head>
	<body>
		<%@ page import="br.com.pesquisa.dao.CepDAO, br.com.pesquisa.model.*, java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<jsp:include page="../includes/menu.jsp"></jsp:include>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
		
		
		
		<h1>Pesquisa por CEP</h1>
		
		<form method="get" action="">
			<label for="ce">CEP:</label>
			<input id="ce" type="text" name="cep" required>
			<input type="submit" value="Consultar">
		</form>
		
		<br>
		
		<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>CEP</th>
            <th>Logradouro</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listaCep}" var="cep">
            <tr>
                <td>${cep.idCep}</td>
                <td>${cep.cep}</td>
                <td>${cep.logradouro}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
	</body>
</html>