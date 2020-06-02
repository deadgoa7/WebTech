package isep.hem.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import isep.hem.bdd.LogementsDatabase;
import isep.hem.beans.LogementBean;

public class AddHouseForm {
	
	private LogementBean logement = new LogementBean();
	private String res;
	
	public void createLogement(HttpServletRequest req) {
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String description = req.getParameter("description");
		String contraintes = req.getParameter("contraintes");
		String services = req.getParameter("services");
		String title = req.getParameter("title");
		int userId = 0;
		try {
			HttpSession session = req.getSession(false);
			userId = (int) session.getAttribute("userId");
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		if (address.isBlank() || city.isBlank() ) {
			setRes("Erreur ! Un des champs n'a pas été renseigné");
		}
		
		else if (userId == 0) {
			setRes("Erreur ! UserId is empty !");
		}
		
		else {
			setRes("Le logement dans la ville: " + city +" à bien été inscrit !");
			logement = getLogement();
			logement.setAdresseLogement(address);
			logement.setVilleLogement(city);
			logement.setClientFromId(userId);
			logement.setDescriptionLogement(description);
			logement.setServices(services);
			logement.setContraintes(contraintes);
			logement.setTitle(title);
			setLogement(logement);
			LogementsDatabase.addLogement(logement, userId);
		}
	}

	public LogementBean getLogement() {
		return logement;
	}

	public void setLogement(LogementBean logement) {
		this.logement = logement;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}

}
