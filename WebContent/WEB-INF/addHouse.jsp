<!DOCTYPE html>
<html>
	<head>
        <title>Ajout d'un logement</title>
        <link type="text/css" rel="stylesheet" href="style/extrastyle.css" />
       	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">  
    </head>
    <body>
    
    	<%@ include file="header.jsp" %>
    	
    	<div class="bg-light" id="content" role="main">
    	
    		<c:if test="${!empty form.res}"><c:out value="${form.res}"></c:out></c:if>
    	
	    	<c:if test="${empty sessionScope.CurrentUser}">
	    		<p> Veuillez vous connecter pour ajouter une maison ! </p>
	    	</c:if>
	    	
	    	<c:if test="${!empty CurrentUser.prenomClient }">
	    		<h1>Bonjour <c:out value="${sessionScope.CurrentUser.prenomClient}">, veuillez ajouter un logement dont vous êtes le propriétaire</c:out></h1>
	    		
	    		<form method="POST" action="AddHouse" class="w-75">
				<div class="form-group">
					<fieldset>
						<legend>Informations logement</legend>
						
						<label for="address">Adresse du logement</label>
						<input class="form-control" type="text" id="address" name="address" value="" size="20" maxlength="255" />
						<br /> 
						
						<label for="city">Ville du logement</label>
						<input class="form-control" type="text" id="city" name="city" value="" size="20" maxlength="255" />
						<br /> 
						
						<label for="description">Description du logement</label>
						<input class="form-control" type="text" id="description" name="description" value="" size="20" maxlength="255" />
						<br /> 
		
					</fieldset>
					<input type="submit" value="Valider" />
					<input type="reset" value="Remettre à zéro" /> 
					<br />
				</div>
			</form>
	    	</c:if>
	    	
	    </div>


</body>
</html>