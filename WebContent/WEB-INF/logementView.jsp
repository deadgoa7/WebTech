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
			
			<div class="container h-100"><br><br><br>
			
				<div class="container-fluid">
				
					<div class="row">
					
						<div class="col-md-10 left">
						
							<c:if test="${!empty logement}">
								<h1>
		  							<c:out value="${logement.title}"></c:out>
		  							<small class="text-muted"> <c:out value="${logement.villeLogement}"></c:out> </small>
								</h1>
								<p> Ce logement est noté : <c:out value="${logement.rateLogement}"></c:out>/5</p><br>
								
								<h4> Description</h4>
								<c:out value="${logement.descriptionLogement}"></c:out><br>
								<br>
								
								<h4> L'utilisateur a indiqué les informations suivantes</h4>
								<p> Adresse : <c:out value="${logement.adresseLogement}"></c:out></p>
								
								<ul class="list-group">
									<li class="list-group-item"><c:out value="${logement.services}"></c:out></li>
									<li class="list-group-item"><c:out value="${logement.contraintes}"></c:out></li>
								</ul>
								<br>
								
								
							</c:if>
							<c:if test="${!empty form.res}">
								Test res form
							<c:out value="${form.res}"></c:out></c:if>
						</div>
					    <div class="col-md-2 right" id="proprio">
					    		<br>
					    		<h3> Propriétaire </h3>
					    		<br>
					    		<p class="lead">
								  <c:out value="${logement.getProprietaireLogement().getPrenomClient()}"></c:out>
								  <c:out value="${logement.getProprietaireLogement().getNomClient()}"></c:out>
								</p>
					    		<p class="lead">
								  <c:out value="${logement.getProprietaireLogement().getEmailClient()}"></c:out>
								</p>
								<p class="lead">
								  <c:out value="${logement.getProprietaireLogement().getNoteClient()}"></c:out>/5
								</p>
					    </div>
					 </div>
					 <br>
						 <c:if test="${empty sessionScope.CurrentUser}">
							<h1> Veuillez vous connecter pour réserver ce logement ! </h1>
						</c:if>
						<c:if test="${!empty sessionScope.CurrentUser}">
									<div class="input-group">
										<form action="ViewLogement?id=<c:out value='${logement.idLogement}'/>" method="POST">
											<input type="submit" class="btn btn-danger" value="Delete">
											<input type="hidden" name="requete" value="Delete">
										</form>
										
										<form action="ViewLogement?id=<c:out value='${logement.idLogement}'/>" method="POST">
											<input type="submit" class="btn btn-primary" value="Book">
											<input type="hidden" name="requete" value="Book">
										</form>
									</div>
						</c:if>
					</div>
					
			</div>
			
		</div>
	</body>
	
	
</html>