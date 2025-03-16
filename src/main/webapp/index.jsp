<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/estilos.css">
	</head>
	<body>
		
		<jsp:include page="/includes/menu.jsp"></jsp:include>
		<jsp:include page="/includes/footer.jsp"></jsp:include>
				
		<br>
		
		<%@ page import="br.com.pesquisa.dao.CepDAO, br.com.pesquisa.model.*, java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<h1>Lista de CEP's</h1>
		
		<%
		List<Cep> lista = CepDAO.getAllCep();
		request.setAttribute("lista", lista);
		%>
		
		<table>
			<tr>
				<th>ID</th>
				<th>CEP</th>
				<th>Logradouro</th>
				<c:forEach items="${lista }" var="cep">
				<tr>
					<td>${cep.getIdCep()}</td>
					<td>${cep.getCep()}</td>
					<td>${cep.getLogradouro()}</td>
				</tr>
				</c:forEach>
			</tr>
		</table>
		
		
	</body>
</html>