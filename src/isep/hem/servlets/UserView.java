package isep.hem.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import isep.hem.bdd.LogementsDatabase;
import isep.hem.bdd.UsersDatabase;
import isep.hem.beans.ClientBean;
import isep.hem.beans.LogementBean;

public class UserView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("id"));
		ClientBean currentUser = UsersDatabase.getUserFromId(userId);
		List<LogementBean> myHomes = LogementsDatabase.getMyHomes(userId);
		List<LogementBean> rentedHomes = LogementsDatabase.getRentedHomes(userId);
		req.setAttribute("currentUser",currentUser);
		req.setAttribute("myHomes",myHomes);
		req.setAttribute("rentedHomes",rentedHomes);
		this.getServletContext().getRequestDispatcher("/WEB-INF/userView.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
