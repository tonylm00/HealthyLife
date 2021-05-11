package it.unisa.model;

import java.text.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class UserDAO 	
{
	private static DataSource ds;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/healthylife");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "utente";

	public synchronized void doSave(UserBean user) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UserDAO.TABLE_NAME
				+ " (username, password, nome, cognome, email) VALUES (?, ?, ?, ?, ?)";

		  
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getFirstName());
			preparedStatement.setString(4, user.getLastName());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

   public static UserBean doRetrieve(UserBean bean) {
	
      
	  Connection connection = null;
	  PreparedStatement preparedStatement = null;

	  UserBean user = new UserBean();
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery = "SELECT * FROM "+ UserDAO.TABLE_NAME +" WHERE username = ? AND password = ?";
	    
	   // "System.out.println" prints in the console; Normally used to trace the process
	   System.out.println("Your user name is " + username);          
	   System.out.println("Your password is " + password);
	   System.out.println("Query: "+searchQuery);
   
  
   try 
   {
      //connect to DB 
	  connection = ds.getConnection();
      preparedStatement=connection.prepareStatement(searchQuery);
      ResultSet rs = preparedStatement.executeQuery();
      
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Utente non registrato. Bisogna prima registrarsi");
         bean.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String firstName = rs.getString("FirstName");
         String lastName = rs.getString("LastName");
	     	
         System.out.println("Ciao, " + firstName);
         bean.setFirstName(firstName);
         bean.setLastName(lastName);
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }	
}