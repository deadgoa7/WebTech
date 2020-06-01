<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
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
				<a class="mx-3 settings" href="UserView?id=<c:out value='${sessionScope.userId}'/>">
					<img width=30px height=30px alt="settings"src="ressources/img/settings.png"/>
				</a>
				<a class="mx-3 chat" href="Messagerie.html">
					<img width=30px height=30px alt="chat" src="ressources/img/chat.png"/>
					
				</a>
				<a class="mx-3 logout" href="Deconnexion">
					<img width=30px height=30px alt="logout" src="ressources/img/logout.png"/>
				</a>
			</div>
		</c:if>
	</div>	
</nav>

