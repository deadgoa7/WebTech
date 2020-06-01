<!DOCTYPE html>
<html>
	<head>
        <title>Ajout d'un logement</title>
        <link type="text/css" rel="stylesheet" href="extrastyle.css" />
       	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">  
    </head>
    
    
    <body class="h-100">
    
    	<%@ include file="header.jsp" %>
    	
    	<div class="bg-light" id="content" role="main">
    		<div class="container h-100">
    			<div class="row d-flex justify-content-center h-100">
    	
		    		<c:if test="${!empty form.res}">
		    			<h1 class="d-flex justify-content-center mb-5 w-100">
		    				<c:out value="${form.res}"></c:out>
		    			</h1>
		    		</c:if>
		    	
			    	<c:if test="${empty sessionScope.CurrentUser}">
		    			<h1> Veuillez vous connecter pour ajouter une maison ! </h1>
			    	</c:if>
			    	
			    	<c:if test="${!empty CurrentUser.prenomClient }">
			    		<div class="bg-light container-fluid main_container h-100 d-flex justify-content-center center-content"> 
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
								<input type="submit" class="btn btn-primary" value="Valider" />
								<input type="reset" class="btn btn-primary" value="Remettre à zéro" /> 
								<br />
							</div>
							</form>
						</div>
			    	</c:if>
			    </div>
			</div>
		</div>


</body>
</html>