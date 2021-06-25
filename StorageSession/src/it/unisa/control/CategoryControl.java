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

@WebServlet("/Category")
public class CategoryControl extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	public CategoryControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("search")) {
					ArrayList<ProductBean> list =(ArrayList<ProductBean>)ProductDAO.doRetrieveAll("");
					ArrayList<String> result=new ArrayList<String>();
					String s=request.getParameter("search");
					for (ProductBean productBean : list) {
						if(productBean.getName().contains(s)) {
							result.add(productBean.getName());
						}
					}
				}
					
				} else { 
					response.sendRedirect("ProductCategory.jsp");}

		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private ProductBean getProductbyRequest(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("catogoria");
		String name = request.getParameter("nome");
		String description = request.getParameter("descrizione");
		double price = Double.parseDouble(request.getParameter("prezzo"));
		int quantity = Integer.parseInt(request.getParameter("quantita"));
		double sconto = Double.parseDouble(request.getParameter("sconto"));
		int iva = Integer.parseInt(request.getParameter("iva"));
		ProductBean bean = new ProductBean();
		bean.setName(name);
		bean.setDescription(description);
		bean.setPrice(price);
		bean.setQuantity(quantity);
		bean.setIva(iva);
		bean.setSconto(sconto);
		return bean;
	}
	
}
