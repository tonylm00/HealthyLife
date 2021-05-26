package it.unisa.control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.*;

public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action!=null) {
			if(action.equalsIgnoreCase("checkout")) {
				try {
					 HttpSession session = request.getSession();
			    	 UserBean user= new UserBean();
				     user.setEmail(request.getParameter("email"));
				     user.setPassword(request.getParameter("pw"));
				     user = UserDAO.doRetrieve(user);
				     if (user.isValid()){
				    	 session.setAttribute("currentSessionUser", user);
				    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/order");
				    	 dispatcher.forward(request, response); 		
				     }
				     else{
				    	 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginView.jsp");
				    	 dispatcher.forward(request, response); 
				     }
				} 		
				catch (Throwable theException){
				     System.out.println(theException); 
				}
			}
			else if(action.equalsIgnoreCase("registration")) {
				UserBean bean= new UserBean();
				bean.setFirstName(request.getParameter("name"));
				bean.setLastName(request.getParameter("surname"));
				bean.setEmail(request.getParameter("email"));
				bean.setPassword(request.getParameter("pw"));
				if(UserDAO.doSave(bean)) {
					bean.setValid(true);
					request.getSession().setAttribute("currentSessionUser", bean);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
			    	dispatcher.forward(request, response); 
				}
				else {
					request.getSession().setAttribute("email", "false");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registrazioneUtente.jsp");
			    	dispatcher.forward(request, response); 
				}
			}
			
			else if(action.equalsIgnoreCase("admin")) {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				String redirectedPage;
				try {
					AdminBean ad= new AdminBean();
					ad.setUserName(username);
					ad.setPassword(password);
					AdminDAO.doRetrieve(ad);
					if(ad.isValid()) {
						request.getSession().setAttribute("adminRoles", true);
						redirectedPage = "/admin/adminView.jsp";
					}
					else throw new Exception();
				} catch (Exception e) {
					request.getSession().setAttribute("adminRoles", false);
					redirectedPage = "/adminLogin.jsp";
				}
				response.sendRedirect(request.getContextPath() + redirectedPage);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
