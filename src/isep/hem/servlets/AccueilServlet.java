package isep.hem.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.bdd.LogementsDatabase;
import isep.hem.beans.LogementBean;

public class AccueilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<LogementBean> logements = LogementsDatabase.getLogements();
		req.setAttribute("logements",logements);
		this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(req,  resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
