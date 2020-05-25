package isep.hem.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.bdd.LogementsDatabase;
import isep.hem.forms.AddHouseForm;
import isep.hem.forms.ViewHouseForm;

public class ViewLogement extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LogementsDatabase logements = new LogementsDatabase();
		int idLogement =  Integer.parseInt(req.getParameter("id"));
		System.out.println(idLogement);
		req.setAttribute("logement",LogementsDatabase.getLogementById(idLogement));
		this.getServletContext().getRequestDispatcher("/WEB-INF/logementView.jsp").forward(req,  resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ViewHouseForm form = new ViewHouseForm();
		
		form.houseRequest(req);
		
		req.setAttribute("form",form);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/logementView.jsp").forward(req,  resp);

		
		
		
	}

}
