package it.unisa.control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.google.gson.Gson;

import it.unisa.model.*;

public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action!=null) {
			
			if(action.equalsIgnoreCase("goRegistration")) {
	
			    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/registrazioneUtente.jsp");
			    	 dispatcher.forward(request, response); 		
			     }
			
			else if(action.equalsIgnoreCase("goGuest")) {
				
		    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/guest.jsp");
		    	 dispatcher.forward(request, response); 		
		     }
			
			else if(action.equalsIgnoreCase("login")) {
				HttpSession session = request.getSession();
				String email=request.getParameter("email");
				String pw=request.getParameter("pw");
				UserBean user= new UserBean();
			    user.setEmail(email);
			    user.setPassword(pw);
			    user = UserDAO.doRetrieve(user);
			    if (user.isValid()){
			    	session.setAttribute("currentSessionUser", user);
			    }
			    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/userLogged.jsp");
		    	 dispatcher.forward(request, response); 
			} 		
					
			else if(action.equalsIgnoreCase("registration")) {
				UserBean bean= new UserBean();
				bean.setName(request.getParameter("name"));
				bean.setSurname(request.getParameter("surname"));
				bean.setEmail(request.getParameter("email"));
				bean.setPassword(request.getParameter("pw"));
				bean.setIndirizzo(request.getParameter("indirizzo"));
				bean.setNumeroCarta(request.getParameter("carta"));
				bean.setCVV(request.getParameter("cvv"));
				bean.setIntestatario(request.getParameter("intestatario"));
				bean.setDataScadenza(request.getParameter("dataScadenza"));
				bean.setTelefono(request.getParameter("telefono"));
				if(UserDAO.doSave(bean)) {
					bean.setValid(true);
					request.getSession().setAttribute("currentSessionUser", bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/userLogged.jsp");
			    	dispatcher.forward(request, response); 
				}
				else {
					request.getSession().setAttribute("email", "false");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/registrazioneUtente.jsp");
			    	dispatcher.forward(request, response); 
				}
			}
			
			else if(action.equalsIgnoreCase("goLogin")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/login/LoginView.jsp");
		    	dispatcher.forward(request, response); 
			}
			
			else if(action.equalsIgnoreCase("adminOrder")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/OrdersView.jsp");
		    	dispatcher.forward(request, response); 
			}
			
			else if(action.equalsIgnoreCase("adminInsert")) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/insert.jsp");
		    	dispatcher.forward(request, response); 
			}
			
			else if(action.equalsIgnoreCase("admin")) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				try {
					AdminBean ad= new AdminBean();
					ad.setUserName(username);
					ad.setPassword(password);
					AdminDAO.doRetrieve(ad);
					if(ad.isValid()) {
						request.getSession().setAttribute("adminRoles", true);		
					}
					else throw new Exception();
				} catch (Exception e) {
					request.getSession().setAttribute("adminRoles", false);
				}
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/admin/adminView.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
