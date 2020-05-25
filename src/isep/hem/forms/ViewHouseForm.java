package isep.hem.forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import isep.hem.bdd.LogementsDatabase;
import isep.hem.beans.LogementBean;

public class ViewHouseForm {
	
	private LogementBean logement;
	private String res;
	
	public void houseRequest(HttpServletRequest req) {
		String requete = req.getParameter("requete");
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession(false);
		int userId = (int) session.getAttribute("userId");
		
		if(requete == "Delete") {
			setRes(LogementsDatabase.deleteLogementById(id, userId));
		} else if (requete == "Book") {
			setRes(LogementsDatabase.bookLogement(id, userId));
		}
	}
	
	public void deleteHouse (int houseId) {
		
	}
	
	public void bookHouse (int houseId) {
		
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
