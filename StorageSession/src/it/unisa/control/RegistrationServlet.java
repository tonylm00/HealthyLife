package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;


@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static UserDAO model = new UserDAO();
    
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		
		if(action != null)
		{
			System.out.println(action);
			
			if(action.equalsIgnoreCase("registra"))
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String nome = request.getParameter("nome"); 
				String cognome = request.getParameter("cognome");
				String email = request.getParameter("email");
				
				UserBean bean = new UserBean();
				bean.setEmail(email);
				bean.setFirstName(nome);
				bean.setLastName(cognome);
				bean.setUserName(username);
				bean.setPassword(password);
				
				
				try {
					model.doSave(bean);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				bean.setValid(true);
				request.getSession().setAttribute("utente", bean);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
				dispatcher.forward(request, response);
				
			}
			else if(action.equalsIgnoreCase("goHome"))
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
