package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

public class ProductControl extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sort = (String) request.getParameter("sort");
		
		try {
			request.removeAttribute("products");
			request.setAttribute("products", ProductDAO.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				
				if (action.equalsIgnoreCase("gotoProduct")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/ProductView.jsp");
					dispatcher.forward(request, response);
				} 
				if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					ProductBean bean=ProductDAO.doRetrieveByKey(id);
					request.setAttribute("product", bean );
					ProductDAO.doUpdate(bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/DetailsView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("readName")){
					String nome = request.getParameter("cerca");
					request.removeAttribute("product");
					ProductBean bean=ProductDAO.doRetrieveByName(nome);
					request.setAttribute("product", bean );
					ProductDAO.doUpdate(bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/DetailsView.jsp");
					dispatcher.forward(request, response);
				
				} else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductDAO.doDelete(id);
					request.removeAttribute("products");
					request.setAttribute("products", ProductDAO.doRetrieveAll(sort));
					if(request.getSession().getAttribute("adminRoles")!=null) {
						response.sendRedirect("/WEB-INF/views/admin/adminView.jsp");
					}
					else {
						response.sendRedirect("/WEB-INF/views/products/ProductView.jsp");
					}
				} else if (action.equalsIgnoreCase("insert")) {
					ProductDAO.doSave(getProductbyRequest(request, response));
					request.removeAttribute("products");
					request.setAttribute("products", ProductDAO.doRetrieveAll(sort));
					if(request.getSession().getAttribute("adminRoles")!=null)
						response.sendRedirect("/WEB-INF/views/admin/adminView.jsp");
					else response.sendRedirect("/ProductView.jsp");
					
				} else if (action.equalsIgnoreCase("search")) {
					ArrayList<ProductBean> list =(ArrayList<ProductBean>)ProductDAO.doRetrieveAll("");
					ArrayList<String> result=new ArrayList<String>();
					String s=request.getParameter("search");
					for (ProductBean productBean : list) {
						if(productBean.getName().contains(s)) {
							result.add(productBean.getName());
						}
					}
				}
				 else if (action.equalsIgnoreCase("modify")) {
					 ProductBean bean=ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
					 ProductBean nuovo=getProductbyRequest(request, response);
					 nuovo.setCode(bean.getCode());
					 ProductDAO.doUpdate(nuovo);
					 request.removeAttribute("products");
					 request.setAttribute("products", ProductDAO.doRetrieveAll(sort));
					 if(request.getSession().getAttribute("adminRoles")!=null)
						 response.sendRedirect("/WEB-INF/views/admin/adminView.jsp");
					 else 
						 response.sendRedirect("/WEB-INF/views/products/ProductView.jsp");
				 }
			}
			else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/ProductView.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private ProductBean getProductbyRequest(HttpServletRequest request, HttpServletResponse response) {
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

