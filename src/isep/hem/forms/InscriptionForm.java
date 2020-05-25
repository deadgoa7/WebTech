package isep.hem.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import isep.hem.bdd.UsersDatabase;
import isep.hem.beans.ClientBean;

public class InscriptionForm {
	
	private ClientBean client = new ClientBean();
	private String res;
	
	public void createUser(HttpServletRequest req) {
		String nom = req.getParameter("nomClient");
		String prenom = req.getParameter("prenomClient");
		String email = req.getParameter("emailClient");
		String password = req.getParameter("password");
		
		if(nom.isBlank() || prenom.isBlank() || email.isBlank() || password.isBlank() ) {
			setRes("Echec, au moins un des champs n'a pas été rempli !");
		}
		
		else {
			setRes("L'utilisateur " + prenom + " " + nom + " a bien été inscrit, merci !");
			client = getClient();
			client.setEmailClient(email);
			client.setNomClient(nom);
			client.setPasswordClient(password);
			client.setPrenomClient(prenom);
			HttpSession session = req.getSession();
			session.setAttribute("nom", client.getNomClient());
			setClient(client);
			UsersDatabase.addUser(client);
		}
		
	}
	
	public ClientBean getClient() {
		return client;
	}

	public void setClient(ClientBean client) {
		this.client = client;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	
	
}
