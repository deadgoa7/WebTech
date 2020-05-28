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
			<div class="toolbar-connected btn-toolbar d-flex align-items-center mr-3">
				<a class="mx-3 settings" href="#">
					<img alt="settings"src="ressources/svg/settings.svg"/>
				</a>
				<a class="mx-3 chat" href="#">
					<img alt="chat" src="ressources/svg/chat.svg"/>
					
				</a>
				<a class="mx-3 logout" href="Deconnexion">
					<img alt="logout" src="ressources/svg/logout.svg"/>
				</a>
			</div>
		</c:if>
	</div>	
</nav>

