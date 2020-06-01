package isep.hem.bdd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import isep.hem.beans.ClientBean;

public class UsersDatabase {

	public List<ClientBean> getUsers() {
		
		List<ClientBean> utilisateur = new ArrayList<ClientBean>();
		Statement statement = null;
        ResultSet result = null;
        
        LoadDatabase.loadDatabase();
        String query = "SELECT * FROM homeexchange.utilisateur;";
        
        try {
        	statement = LoadDatabase.getConnexion().createStatement();
        	result = statement.executeQuery(query);
        	
        	while(result.next()) {
        		utilisateur.add(getUserProperties(result, statement));
        	}
        	
        } catch (SQLException e) {
        } finally {
        	LoadDatabase.closeConnexion(result, statement);
        }
        
        return utilisateur;
    }
	
	public static void addUser(ClientBean utilisateur) {
		System.out.println("Add User Called !");
		LoadDatabase.loadDatabase();
		try {
			String query = "INSERT INTO utilisateur(firstName,lastName,email,password,rate) VALUES (?,?,?,?,5)";
			Connection conn = LoadDatabase.getConnexion();
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			String prenom = utilisateur.getPrenomClient();
			String nom = utilisateur.getNomClient();
			String email = utilisateur.getEmailClient();
			String password = utilisateur.getPasswordClient();
			preparedStatement.setString(1,prenom);
			preparedStatement.setString(2,nom);
			preparedStatement.setString(3,email);
			preparedStatement.setString(4,password);
			preparedStatement.execute();
			preparedStatement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	
	public static ClientBean getUserFromId(int userId) {
		Statement statement = null;
        ResultSet result = null;
        ClientBean user = new ClientBean();
        
        LoadDatabase.loadDatabase();
        String query = "SELECT * FROM utilisateur WHERE userID=" + userId +";";

        try {
        	statement = LoadDatabase.getConnexion().createStatement();
        	result = statement.executeQuery(query);
        	user=getUserProperties(result, statement);
        } catch (SQLException e) {
        } finally {
        	LoadDatabase.closeConnexion(result, statement);
        }
        
        return user;
	}
	
	public static ClientBean connectUser(String email, String password) {
		Statement statement = null;
        ResultSet result = null;
        ClientBean user = new ClientBean();
        
        LoadDatabase.loadDatabase(); 
        String query = "SELECT * FROM utilisateur WHERE email='"+email+"' AND password='"+password+"';";
        
        try {
        	statement = LoadDatabase.getConnexion().createStatement();
        	result = statement.executeQuery(query);
        	user = getUserProperties(result, statement);
        } catch (SQLException e) {
        } finally {
        	LoadDatabase.closeConnexion(result, statement);
        }
        
        return user;
		
	}
	
	public static ClientBean getUserProperties(ResultSet result, Statement statement) 
	        throws SQLException{
		
		/** 
		 * Recupere les differents champs du resultat de la requete SQL
		 * 	Cree un ClientBean et attribue les valeurs a ses proprietes
		 ******************************************************************/
		ClientBean utilisateur = new ClientBean();	
		if (result.next()){
			int userId = result.getInt("userID");
			String firstName = result.getString("firstName");
		    String lastName = result.getString("lastName");
		    String email = result.getString("email");
		    String password = result.getString("password");
		    String description = result.getString("infos");
		    int rate = result.getInt("rate");
		    boolean isAdmin = false;
		    isAdmin = intToBool(result.getInt("isAdmin"));
			

	        utilisateur.setUserId(userId);
	        utilisateur.setAdmin(isAdmin);
		    utilisateur.setEmailClient(email);
	        utilisateur.setNomClient(lastName);
	        utilisateur.setNoteClient(rate);
	        utilisateur.setPasswordClient(password);
	        utilisateur.setPrenomClient(firstName);
	        utilisateur.setDescriptionClient(description);
	        return utilisateur;
		} else {
			return null;
		}
	}
	
	public static boolean intToBool(int i) {
		if(i == 0) {
			return false;
		} else if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}

