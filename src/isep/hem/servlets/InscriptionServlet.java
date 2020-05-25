package isep.hem.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.forms.InscriptionForm;

public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/InscriptionUtilisateur.jsp").forward(req,  resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		InscriptionForm form = new InscriptionForm();
		
		form.createUser(req);
		
		req.setAttribute("form", form);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/InscriptionUtilisateur.jsp").forward(req,  resp);

	}

}
