package isep.hem.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.bdd.LogementsDatabase;

public class AccueilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LogementsDatabase logements = new LogementsDatabase();
		req.setAttribute("logements",logements.getLogements());
		this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(req,  resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
