<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Homepage</title>
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
				<div class="row h-75 d-flex justify-content-center logements">
					<c:if test="${!empty logements }">
						<c:forEach var="logement" items="${logements}">
							<c:if test="${!empty logement.idLogement}">
								<a class=" wrap logement col-md-4 text-decoration-none" href="ViewLogement?id=<c:out value='${logement.idLogement}'/>">
									<div class="card logement-card mb-4 d-flex justify-content-center">
										<img class="card-img-top" alt="HomePhoto" src="ressources/img/homeImage.jpeg">
										<ul class="card-body">
											<li><strong><c:out value="${logement.title}"></c:out></strong></li>
											<li><strong>Ville : </strong><c:out value="${logement.villeLogement}"></c:out></li>
											<li><strong>Note : </strong><c:out value="${logement.rateLogement}"></c:out>/5</li>
										</ul>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<div class="row justify-content-center p-5">
					<a href="AddHouse">
						<svg class="bi bi-plus-circle-fill" width="3em" height="3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd" d="M16 8A8 8 0 110 8a8 8 0 0116 0zM8.5 4a.5.5 0 00-1 0v3.5H4a.5.5 0 000 1h3.5V12a.5.5 0 001 0V8.5H12a.5.5 0 000-1H8.5V4z" clip-rule="evenodd"/>
						</svg>
					</a>
				</div>
			</div>
			
			
		
		</div>
		
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>	
	</body>
</html>