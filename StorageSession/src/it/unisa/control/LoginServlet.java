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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static UserDAO model = new UserDAO();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		
		if(action != null)
		{
			if(action.equalsIgnoreCase("login"))
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				UserBean bean = new UserBean();
				bean.setEmail(username);
				bean.setFirstName(password);
				model.doRetrieve(bean);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
				dispatcher.forward(request, response);
				
				
			}
			else if(action.equalsIgnoreCase("registra"))
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Registrazione.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
