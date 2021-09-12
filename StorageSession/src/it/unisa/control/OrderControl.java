package it.unisa.control;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

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
					if(cart == null) {
						cart = new Cart();
						request.getSession().setAttribute("cart", cart);
					}
					else if(cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else if(user==null) {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/LoginView.jsp");
				    	 dispatcher.forward(request, response);
					}
					else{
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/orders/RiepilogoOrdine.jsp");
						dispatcher.forward(request, response);
					}
				}
				else if(action.equalsIgnoreCase("conferma")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					OrderBean order=new OrderBean();
					order.setPrezzoTot(cart.getTotPrice());
					order.setUtente(user.getEmail());
					order=OrderDAO.doSave(order);
					DetailsDAO.doSave(cart, OrderDAO.getUtente(order.getUtente(), order.getData()));
					request.getSession().setAttribute("cart", new Cart());
					request.getSession().removeAttribute("orders");
					request.getSession().setAttribute("orders", OrderDAO.doRetrieveAllByUser(user.getEmail()));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/userLogged.jsp");
					dispatcher.forward(request, response);
				}
				
				else if(action.equalsIgnoreCase("detail")){
					int id = Integer.parseInt(request.getParameter("id"));
					request.getSession().removeAttribute("products");
					request.getSession().setAttribute("products", DetailsDAO.doRetrieveProducts(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/orders/OrderDetailsView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("guest")){
					Cart cart= (Cart) request.getSession().getAttribute("cart");
					if(cart==null || cart.getSize()==0) {
						 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/CartView.jsp");
				    	 dispatcher.forward(request, response);
					}
					GuestBean guest= getGuestByRequest(request, response);
					GuestDAO.doSave(guest);
					OrderBean order=new OrderBean();
					order.setPrezzoTot(cart.getTotPrice());
					order.setGuest(GuestDAO.getId(guest));
					order=OrderDAO.doSave(order);
					DetailsDAO.doSave(cart, OrderDAO.getGuest(order.getGuest(), order.getData()));
					
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/success.jsp");
			    	dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("filterDate")){
					String inizio=request.getParameter("inizio");
					String fine=request.getParameter("fine");
					Collection<?> orders = (Collection<?>) OrderDAO.doRetrieveAllbyDate(inizio, fine);
					request.setAttribute("orders", orders);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/OrdersView.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("filterUser")){
					String utente=request.getParameter("user");
					Collection<?> orders = (Collection<?>) OrderDAO.doRetrieveAllByUser(utente);
					request.setAttribute("orders", orders);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/OrdersView.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
		catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private GuestBean getGuestByRequest(HttpServletRequest request, HttpServletResponse response) {
		GuestBean guest= new GuestBean();
		guest.setNome(request.getParameter("nome"));
		guest.setEmail(request.getParameter("email"));
		guest.setTelefono(request.getParameter("telefono"));
		guest.setCognome(request.getParameter("cognome"));
		guest.setIndirizzo(request.getParameter("indirizzo"));
		return guest;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
