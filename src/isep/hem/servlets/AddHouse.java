package isep.hem.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import isep.hem.forms.AddHouseForm;

public class AddHouse extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/addHouse.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 AddHouseForm form = new AddHouseForm();
		 
		 form.createLogement(req);
		 
		 req.setAttribute("form", form);
		 
		 this.getServletContext().getRequestDispatcher("/WEB-INF/addHouse.jsp").forward(req, resp);
	}

}
