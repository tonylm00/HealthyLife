package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");

		if (action != null) 
		{
			if (action.equalsIgnoreCase("gotoProduct")) 
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/ProductView.jsp");
				dispatcher.forward(request, response);
			}
			
			else if (action.equalsIgnoreCase("gotoAboutUs")) 
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/team/AboutUs.jsp");
				dispatcher.forward(request, response);
			}
			
			else if (action.equalsIgnoreCase("goHome")) 
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
				dispatcher.forward(request, response);
			}
			
			else if (action.equalsIgnoreCase("admin")) 
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/adminLogin.jsp");
				dispatcher.forward(request, response);
			}
			else if (action.equalsIgnoreCase("adminView")) 
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/adminView.jsp");
				dispatcher.forward(request, response);
			}
		}
		else
		{
			request.setAttribute("active", "home");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			dispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
