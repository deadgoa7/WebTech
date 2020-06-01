package isep.hem.beans;

import java.sql.Date;

public class ChatMessage implements Message {
	private String name;
	private String date;
	private String message;
	private String destinataire;
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param location the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the destinataire
	 */
	public String getDestinataire() {
		return destinataire;
	}
	/**
	 * @param destinataire the destinataire to set
	 */
	public void setDestinataire(String destinataire) {
		this.destinataire = destinataire;
	}
	
}
