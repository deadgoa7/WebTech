<!DOCTYPE html>
<html>
	<head>
        <title>Ajout d'un logement</title>
        <link type="text/css" rel="stylesheet" href="style/extrastyle.css" />
       	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">  
    	<link rel="stylesheet" href="extrastyle.css">
    </head>
    <body>
    
    	<%@ include file="header.jsp" %>
    	
    	<div class="bg-light" id="content" role="main">
    	
    		<c:if test="${!empty form.res}"><c:out value="${form.res}"></c:out></c:if>
    	
	    	<c:if test="${empty sessionScope.CurrentUser}">
	    		<div class="row h-75 d-flex justify-content-center center-content">
	    			<h1> Veuillez vous connecter pour ajouter une maison ! </h1>
	    		</div>
	    	</c:if>
	    	
	    	<c:if test="${!empty CurrentUser.prenomClient }">
	    		<h1 class="d-flex justify-content-center mb-5 w-100">Ajout d'un logement !</h1>
	    		
	    		<div class="container">
					<div class="row d-flex justify-content-center">
			    		<form method="POST" action="AddHouse" class="w-75">
							<div class="form-group">
								<fieldset>
									<legend>Informations logement</legend>
									
									<label for="titre">Titre de l'annonce</label>
									<input class="form-control" type="text" id="title" name="title" value="" size="20" maxlength="255" />
									<br /> 
									
									<label for="address">Adresse du logement</label>
									<input class="form-control" type="text" id="address" name="address" value="" size="20" maxlength="255" />
									<br /> 
									
									<label for="city">Ville du logement</label>
									<input class="form-control" type="text" id="city" name="city" value="" size="20" maxlength="255" />
									<br /> 
									
									<label for="description">Description du logement</label>
									<input class="form-control" type="text" id="description" name="description" value="" size="20" maxlength="255" />
									<br /> 
									
									<label for="contraintes">Contraintes </label>
									<input class="form-control" type="text" id="contraintes" name="contraintes" value="" size="20" maxlength="255" />
									<br /> 
									
									<label for="services">Services </label>
									<input class="form-control" type="text" id="services" name="services" value="" size="20" maxlength="255" />
									<br />
					
								</fieldset>
								<input type="submit" class="btn btn-primary" value="Valider" />
								<input type="reset" class="btn btn-primary" value="Remettre à zéro" /> 
								<br />
							</div>
						</form>
					</div>
				</div>
			 </c:if>
			    	
		</div>
			 

</body>
</html>