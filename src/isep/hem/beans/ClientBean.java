package isep.hem.beans;

public class ClientBean {
	
	private int userId;
	private String nomClient;
	private String prenomClient;
	private String emailClient;
	private String passwordClient;
	private boolean isAdmin;
	private float noteClient;
	private String descriptionClient;
	
	// Get & Set
	
	
	public String getDescriptionClient() {
		return descriptionClient;
	}
	public void setDescriptionClient(String descriptionClient) {
		this.descriptionClient = descriptionClient;
	}
	public String getNomClient() {
		return nomClient;
	}
	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	public String getPrenomClient() {
		return prenomClient;
	}
	public void setPrenomClient(String prenomClient) {
		this.prenomClient = prenomClient;
	}
	public String getEmailClient() {
		return emailClient;
	}
	public void setEmailClient(String emailClient) {
		this.emailClient = emailClient;
	}
	public String getPasswordClient() {
		return passwordClient;
	}
	public void setPasswordClient(String passwordClient) {
		this.passwordClient = passwordClient;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public float getNoteClient() {
		return noteClient;
	}
	public void setNoteClient(float noteClient) {
		this.noteClient = noteClient;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
}
