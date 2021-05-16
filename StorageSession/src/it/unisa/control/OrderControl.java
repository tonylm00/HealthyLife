package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

@WebServlet("/order")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	
   
    public OrderControl() {
        super();  
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserBean user=(UserBean)request.getSession().getAttribute("currentSessionUser");
		
		try {
			if(action!=null) {
				if(action.equalsIgnoreCase("checkout")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					if(cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else if(user==null) {
						response.sendRedirect("LoginView.jsp");
					}
					else{
						OrderBean order=new OrderBean();
						order.setPrezzoTot(cart.getTotPrice());
						order.setUtente(user.getEmail());
						order=OrderDAO.doSave(order);
						DetailsDAO.doSave(cart, OrderDAO.getId(order.getUtente(), order.getData()));
						request.getSession().setAttribute("cart", new Cart());
						request.getSession().removeAttribute("orders");
						request.getSession().setAttribute("orders", OrderDAO.doRetrieveByUser(user.getEmail()));
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if(action.equalsIgnoreCase("detail")){
					int id = Integer.parseInt(request.getParameter("id"));
					request.getSession().removeAttribute("products");
					request.getSession().setAttribute("products", DetailsDAO.doRetrieveProducts(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderDetailsView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("guest")){
					
				}
			}
		}
		catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
