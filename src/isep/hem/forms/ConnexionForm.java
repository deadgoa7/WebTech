package isep.hem.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import isep.hem.bdd.UsersDatabase;
import isep.hem.beans.ClientBean;

public class ConnexionForm {

	private String res;
	
	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public void connectUser(HttpServletRequest req) {
		String email = req.getParameter("emailClient");
		String password = req.getParameter("password");
		ClientBean user = new ClientBean();
		user = UsersDatabase.connectUser(email, password);
		
		if(!email.isBlank() && !password.isBlank() ) {
			
			System.out.println(user);
			
			if(user == null) {
				setRes("Identifiants ou mot de passe incorrects !");
			}
			
			else {
				System.out.println("connexion");
				setRes("Vous êtes connectés !");
				System.out.println(user.getEmailClient());
				HttpSession session = req.getSession();
				session.setAttribute("CurrentUser",user);
				session.setAttribute("email",email);
				session.setAttribute("userId",user.getUserId());
			} 
			
		} else {
			setRes("Echec, au moins un des champs n'a pas été rempli !");
		}
	}

}
