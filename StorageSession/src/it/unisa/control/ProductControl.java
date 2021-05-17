package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProductDAO model = new ProductDAO();
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				
				if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
					dispatcher.forward(request, response);
				
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
					request.removeAttribute("products");
					request.setAttribute("products", model.doRetrieveAll(sort));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				
				} else if (action.equalsIgnoreCase("insert")) {
					String name = request.getParameter("nome");
					String description = request.getParameter("descrizione");
					int price = Integer.parseInt(request.getParameter("prezzo"));
					int quantity = Integer.parseInt(request.getParameter("quantita"));

					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					model.doSave(bean);
					
					request.removeAttribute("products");
					request.setAttribute("products", model.doRetrieveAll(sort));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				}
			}
			else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
				dispatcher.forward(request, response); }
		}
			catch (SQLException e) {
					System.out.println("Error:" + e.getMessage());}
	}
			
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
