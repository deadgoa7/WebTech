package isep.hem.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.forms.ConnexionForm;


public class ConnexionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/ConnexionUtilisateur.jsp").forward(request,  response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnexionForm form = new ConnexionForm();
		
		form.connectUser(request);
		
		request.setAttribute("form", form);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/ConnexionUtilisateur.jsp").forward(request, response);
		
		
	}

}
