<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
	<div class="d-flex justify-content-between align-items-center w-100">
		<a class="navbar-brand" href="Accueil">Home Exchange Manager</a>
		<c:if test="${empty sessionScope.CurrentUser}">
			<div class="btn-toolbar mx-2">
				<a class="btn btn-outline-primary mx-3" href="Connexion">
					<div class="connexion">Connexion</div>
				</a>
				<a class="btn btn-outline-warning mx-3" href="Inscription">
					<div class="inscription">Inscription</div>
				</a>
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.CurrentUser}">
			<div class="btn-toolbar d-flex align-items-center mr-3">
				<a class="mx-3 settings" href="#">
					<svg class="bi bi-gear-fill" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  				<path class="shadow" fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 01-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 01.872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 012.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 012.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 01.872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 01-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 01-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 100-5.86 2.929 2.929 0 000 5.858z" clip-rule="evenodd"/>
					</svg>
				</a>
				<a class="mx-3 chat" href="#">
					<svg class="bi bi-chat" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 01.287.801 10.97 10.97 0 01-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 01.71-.074A8.06 8.06 0 008 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 01-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 00.244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 01-2.347-.306c-.52.263-1.639.742-3.468 1.105z" clip-rule="evenodd"/>
					</svg>
				</a>
				<a class="mx-3 logout" href="/Deconnexion">
					
				</a>
			</div>
		</c:if>
	</div>	
</nav>

