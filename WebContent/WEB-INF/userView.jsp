<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User Settings</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<link rel="stylesheet" href="extrastyle.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	</head>
	
	<body>
	
		<%@ include file="header.jsp" %>
		
		<div class="bg-light" id="content" role="main">
			<div class="container-fluid row h-100">
				<c:if test="${!empty currentUser}">
					<div class="col-lg-4 d-flex center-content justify-content-center">
						<div class="bg-white w-75 h-75 rounded shadow p-4 d-flex flex-column align-items-center justify-content-between pb-5">
							<div class="Profil d-flex flex-column align-items-center">
								<img class="rounded-circle shadow-sm" alt="Profile_Picture" src="ressources/img/profile.png" width=100 height=100>
								<h2 class="mt-2"><c:out value="${currentUser.prenomClient}"></c:out></h2>
								<p><c:out value="${currentUser.emailClient}"></c:out></p>
							</div>
							
							<div class="Description">
								<p class="text-justify ml-3 mr-3"><c:out value="${currentUser.descriptionClient}"></c:out>
							</div>
							
							<div class="Note d-flex flex-column align-items-center">
								<h3>Note de l'utilisateur : </h3>
								<c:set var = "Note" value = "${currentUser.noteClient}" />
								<fmt:parseNumber var = "intNote" type = "number" value = "${Note}" />
								<div class="noteDisplay">
									<c:forEach var="i" begin="1" end="${intNote}">
										<span class="fa fa-star checked"></span>
									</c:forEach>
									<c:forEach var="i" begin="${intNote + 1}" end="5">
										<span class="fa fa-star"></span>
									</c:forEach>
								</div>
							</div>
							
							<div>
								<c:if test="${!empty sessionScope.userId}">
									<c:if test="${currentUser.userId == sessionScope.userId}">
										<a href="#" class="btn btn-outline-warning">
											<div> Modifier mes informations </div>
										</a>
									</c:if>
									<c:if test="${currentUser.userId != sessionScope.userId}">
										<a href="#" class="btn btn-outline-primary">
											<div> Contacter <c:out value="${currentUser.prenomClient}"></c:out> </div>
										</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>
				<div class="col-lg-8 d-flex flex-wrap h-75">
					<div class="myHomes d-flex align-items-start w-100 h-50">
						<div class="logements row d-flex justify-content-center w-100">
							<div class="col-lg-12 mb-3">
								<h3>Mes logements : </h3>
							</div>
							<div class="d-flex justify-content-start align-items-start w-100">
								<c:if test="${!empty myHomes}">
									<c:forEach var="myHome" items="${myHomes}">
										<c:if test="${!empty myHome.idLogement}">
											<a class="wrap logement col-md-3 text-decoration-none h-100" href="ViewLogement?id=<c:out value='${myHome.idLogement}'/>">
												<div class="card logement-card mb-4 h-75 d-flex justify-content-center">
													<img class="card-img-top h-50" alt="HomePhoto" src="ressources/img/homeImage.jpeg">
													<div class="card-body">
														<p><c:out value="${myHome.adresseLogement}"></c:out>, <c:out value="${myHome.villeLogement}"></c:out></p>
														<div class="noteDisplay">
															<c:forEach var="i" begin="1" end="${myHome.rateLogement}">
																<span class="fa fa-star checked"></span>
															</c:forEach>
															<c:forEach var="i" begin="${myHome.rateLogement + 1}" end="5">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</div>
											</a>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>	
					<div class="rentedHomes d-flex align-items-start w-100 h-50">
						<div class="logements row d-flex justify-content-center w-100 mt-4">
							<div class="col-lg-12 mb-3">
								<h3>Logements réservés : </h3>
							</div>
							<div class="d-flex justify-content-start align-items-center w-100">
								<c:if test="${!empty rentedHomes}">
									<c:forEach var="rentedHome" items="${rentedHomes}">
										<c:if test="${!empty rentedHome.idLogement}">
											<a class="wrap logement col-md-3 text-decoration-none h-100" href="ViewLogement?id=<c:out value='${rentedHome.idLogement}'/>">
												<div class="card logement-card mb-4 d-flex h-75 justify-content-start">
													<img class="card-img-top h-50" alt="HomePhoto" src="ressources/img/homeImage.jpeg">
													<div class="card-body">
														<p><c:out value="${rentedHome.adresseLogement}"></c:out>, <c:out value="${rentedHome.villeLogement}"></c:out></p>
														<div class="noteDisplay">
															<c:forEach var="i" begin="1" end="${rentedHome.rateLogement}">
																<span class="fa fa-star checked"></span>
															</c:forEach>
															<c:forEach var="i" begin="${rentedHome.rateLogement + 1}" end="5">
																<span class="fa fa-star"></span>
															</c:forEach>
														</div>
													</div>
												</div>
											</a>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>