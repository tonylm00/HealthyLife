package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {

	private static DataSource ds;
	private static final String TABLE_NAME = "ordine";
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet rs;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/healthylife");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	public synchronized void doSave(OrderBean bean) throws SQLException {


		String insertSQL = "INSERT INTO " + OrderDAO.TABLE_NAME
				+ " (id, nome, descrizione, informazioni, sconto, iva, id_utente) VALUES (?, ?, ?, ?, ?, ?, ?)";
		  
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, bean.getId());
			preparedStatement.setString(2, bean.getNome());
			preparedStatement.setString(3, bean.getDescrizione());
			preparedStatement.setString(4, bean.getInformazioni());
			preparedStatement.setFloat(5, bean.getSconto());
			preparedStatement.setInt(6, bean.getIva());
			preparedStatement.setInt(7, bean.getId_utente());
			
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

   public UserBean doRetrieve(OrderBean bean) {
	
      
	  Connection connection = null;
	  PreparedStatement preparedStatement = null;

	  UserBean user = new UserBean();
	
      int id = bean.getId();
      int id_utente = bean.getId_utente();
	    
      String searchQuery = "SELECT * FROM "+ OrderDAO.TABLE_NAME +" WHERE id = ? AND id_utente = ?";
	   
	  System.out.println("Query: "+searchQuery);
   
  
   try 
   {
      //connect to DB 
	  connection = ds.getConnection();
      preparedStatement=connection.prepareStatement(searchQuery);
      ResultSet rs = preparedStatement.executeQuery();
      
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (more == false) 
      {
         System.out.println("Ordine non trovato");
      }
      
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String id = rs.getInt("id");
         String id_utente = rs.getString("id_utente");
	     	
         System.out.println("Ordine, " + firstName);
         bean.setFirstName(firstName);
         bean.setLastName(lastName);
         bean.setValid(true);
      }
   } 
   catch (Exception ex) {
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
	
      if (preparedStatement != null) {
         try {
        	 preparedStatement.close();
         } catch (Exception e) {}
         preparedStatement = null;
         }
	
      if (connection != null) {
         try {
            connection.close();
         } catch (Exception e) {
         }

         connection = null;
      }
   }

return bean;
	
   }	
}
