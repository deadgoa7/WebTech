package isep.hem.beans;

import isep.hem.bdd.UsersDatabase;

public class LogementBean {
	
	private int idLogement;
	private String adresseLogement;
	private String title;
	private String villeLogement;
	private String descriptionLogement;
	private String services;
	private String contraintes;
	private int rateLogement;
	private int isAvailable;
	private ClientBean proprietaireLogement;
	private int idRenter;
	
	
	//Get & set
	
	public int getIdRenter() {
		return idRenter;
	}

	public String getServices() {
		return services;
	}


	public void setServices(String services) {
		this.services = services;
	}


	public String getContraintes() {
		return contraintes;
	}


	public void setContraintes(String contraintes) {
		this.contraintes = contraintes;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public void setIdRenter(int idRenter) {
		this.idRenter = idRenter;
	}


	public void setClientFromId(int id) {
		ClientBean client = UsersDatabase.getUserFromId(id);
		setProprietaireLogement(client);
	}
	

	public String getAdresseLogement() {
		return adresseLogement;
	}
	public void setAdresseLogement(String adresseLogement) {
		this.adresseLogement = adresseLogement;
	}
	public String getVilleLogement() {
		return villeLogement;
	}
	public void setVilleLogement(String villeLogement) {
		this.villeLogement = villeLogement;
	}

	public ClientBean getProprietaireLogement() {
		return proprietaireLogement;
	}
	public void setProprietaireLogement(ClientBean proprietaireLogement) {
		this.proprietaireLogement = proprietaireLogement;
	}
	public String getDescriptionLogement() {
		return descriptionLogement;
	}
	public void setDescriptionLogement(String descriptionLogement) {
		this.descriptionLogement = descriptionLogement;
	}
	public int getRateLogement() {
		return rateLogement;
	}
	public void setRateLogement(int rateLogement) {
		this.rateLogement = rateLogement;
	}
	public int getidLogement() {
		return idLogement;
	}
	public void setidLogement(int idLogement) {
		this.idLogement = idLogement;
	}


	public int getIsAvailable() {
		return isAvailable;
	}


	public void setIsAvailable(int isAvailable) {
		this.isAvailable = isAvailable;
	}
	

}
