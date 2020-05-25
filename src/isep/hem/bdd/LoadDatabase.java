package isep.hem.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoadDatabase {
	
	private static Connection connexion;
	
	public static void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            setConnexion(DriverManager.getConnection("jdbc:mysql://localhost:3306/homeexchange?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public static void closeConnexion(ResultSet result, Statement statement){
	    /**
	     * Permets la cloture de la session
	     */
	        try {
	            if (result != null)
	                result.close();
	            if (statement != null)
	                statement.close();
	            if (LoadDatabase.getConnexion() != null)
	                LoadDatabase.getConnexion().close();
	        } catch (SQLException ignore) {
	        }
	    }

	public static Connection getConnexion() {
		return connexion;
	}

	public static void setConnexion(Connection connexion) {
		LoadDatabase.connexion = connexion;
	}
}
