<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Logement</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<link rel="stylesheet" href="extrastyle.css">
	</head>
	
	
	<body>
		<%@ include file="header.jsp" %>
		
		<div class="bg-light" id="content" role="main">
		
			<c:if test="${!empty sessionScope.nom }">
				<h1 class="d-flex justify-content-center mb-5 w-100">Bienvenue <c:out value="${sessionScope.prenom}"></c:out> !</h1>
			</c:if>
			
			<div class="container h-100">
				<div class="row d-flex justify-content-center center-content">
					<c:if test="${!empty logement}">
						<c:out value="${logement.villeLogement}"></c:out>
						<c:out value="${logement.adresseLogement}"></c:out>
						<c:out value="${logement.descriptionLogement}"></c:out>
						<c:out value="${logement.rateLogement}"></c:out>/5
						<c:if test="${!empty sessionScope.CurrentUser}">
							<form action="ViewLogement?id=<c:out value='${logement.idLogement}'/>" method="POST">
								<input type="submit" class="btn btn-danger" value="Delete">
								<input type="hidden" name="requete" value="Delete">
							</form>
							<form action="ViewLogement?id=<c:out value='${logement.idLogement}'/>" method="POST">
								<input type="submit" class="btn btn-primary" value="Book">
								<input type="hidden" name="requete" value="Book">
							</form>
						</c:if>
						<c:if test="${empty sessionScope.CurrentUser}">
							<h1> Veuillez vous connecter pour réserver ce logement ! </h1>
						</c:if>
					</c:if>
					<c:if test="${!empty form.res}">
						Test res form
					<c:out value="${form.res}"></c:out></c:if>
				</div>
			</div>
			
		</div>
	</body>
	
	
</html>