<!DOCTYPE html>
<html>
    <head>
        <title>Insciption utilisateur</title>
        <link type="text/css" rel="stylesheet" href="style/extrastyle.css" />
       	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        
    </head>
    <body class="h-100">
    
        <%@ include file="header.jsp" %>
        
        <div class="bg-light" id="content" role="main">
			<div class="container">
				<div class="row d-flex justify-content-center">
        
                    <c:if test="${ !empty sessionScope.prenom && !empty sessionScope.nom }">
                        <p>Bienvenue <c:out value="${ sessionScope.prenom }"/> <c:out value="${ sessionScope.nom }"></c:out>
                    </c:if>
                    
                    <c:if test="${ !empty form.res }">
                        <h1 class="d-flex justify-content-center mb-5 w-100">
                            <c:out value="${ form.res }"></c:out>
                        </h1>
                    </c:if>
                    
                    <div id="content" class="bg-light container-fluid main_container">
                        <form method="POST" action="Inscription" class="w-75">
                            <div class="form-group">
                                <fieldset>
                                    <legend>Informations client</legend>
                    
                                    <label for="nomClient">Nom <span class="requis">*</span></label>
                                    <input class="form-control" type="text" id="nomClient" name="nomClient" value="${ClientBean.nomClient}" size="20" maxlength="20" />
                                    <br />
                                    
                                    <label for="prenomClient">Pr�nom </label>
                                    <input class="form-control" type="text" id="prenomClient" name="prenomClient" value="" size="20" maxlength="20" />
                                    <br />
                                    
                                    <label for="emailClient">Adresse email</label>
                                    <input class="form-control" type="email" id="emailClient" name="emailClient" value="" size="20" maxlength="60" />
                                    <br />
                                    
                                    <label for="password">Mot de passe</label>
                                    <input class="form-control" type="password" id="password" name="password" value=""/>
                                    <br />
                                    
                                </fieldset>
                                <input type="submit" value="Valider"  />
                                <input type="reset" value="Reset" /> <br />
                            </div>
                        </form>
                    </div>
        
        
        
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>  
    </body>
</html>