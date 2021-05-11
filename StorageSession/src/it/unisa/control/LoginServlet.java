package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static UserDAO model = new UserDAO();
	
    public LoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		
		if(action != null)
		{
			if(action.equalsIgnoreCase("login"))
			{
				HttpSession session = request.getSession(true);
				
				UserBean bean = new UserBean();
				bean.setUserName(request.getParameter("username"));
				bean.setPassword(request.getParameter("password"));
				
				bean = UserDAO.doRetrieve(bean);
				
				if (bean.isValid())
				{
                    session.setAttribute("currentSessionUser", bean);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userLogged.jsp");
                    dispatcher.forward(request, response);
                }
                else
                {
                    response.sendRedirect("invalidLogin.jsp");  
                }

			}
			else if(action.equalsIgnoreCase("registra"))
			{
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Registrazione.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
