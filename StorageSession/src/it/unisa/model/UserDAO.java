package it.unisa.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class UserDAO{
	
   private static Connection currentCon = null;
   private static ResultSet rs = null;
   private static Statement stmt = null;    
   private static PreparedStatement preparedStatement = null;
   private static DataSource ds;
   private static final String TABLE_NAME = "utente";
   
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/healthylife");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
   
   public static UserBean doRetrieve(UserBean bean) {
	
      String email = bean.getEmail();    
      String password = bean.getPassword();   
	    
      String searchQuery = "SELECT * FROM " + UserDAO.TABLE_NAME + " WHERE email = ? AND pw = ?";
      
	   // "System.out.println" prints in the console; Normally used to trace the process
	   System.out.println("Your email is " + email);          
	   System.out.println("Your password is " + password);
   
	   try{
		  currentCon = ds.getConnection();
	      preparedStatement=currentCon.prepareStatement(searchQuery);
	      preparedStatement.setString(1, email);
	      preparedStatement.setString(2, password);
	      rs = preparedStatement.executeQuery();	        
	      boolean more = rs.next();
		       
	      // if user does not exist set the isValid variable to false
	      if (!more){
	         bean.setValid(false);
	      } 
		        
	      //if user exists set the isValid variable to true
	      else{
	         String firstName = rs.getString("nome");
	         String lastName = rs.getString("cognome");
	         String indirizzo = rs.getString("indirizzo");
	         String ncarta = rs.getString("numeroCarta");
	         String cvv = rs.getString("CVV");
	         String intestatario = rs.getString("intestatario");
	         String telefono = rs.getString("telefono");
	         String data = rs.getString("dataScadenza");
	         
			 bean.setName(firstName);
	         bean.setSurname(lastName);
	         bean.setCVV(cvv);
	         bean.setDataScadenza(data);
	         bean.setIndirizzo(indirizzo);
	         bean.setNumeroCarta(ncarta);
	         bean.setIntestatario(intestatario);
	         bean.setTelefono(telefono);
	         bean.setValid(true);
	      }
	   } 
	   catch (Exception ex){
	      System.out.println("Log In failed: An Exception has occurred! " + ex);
	   } 
	   //some exception handling
	   finally{
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
   
   public static boolean doSave(UserBean bean) {
	   
	   String insert="insert into utente(nome, cognome, email, pw, indirizzo, telefono, numeroCarta, dataScadenza, CVV, intestatario) values(?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
	   try{
		      //connect to DB 
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(insert);
		      preparedStatement.setString(1, bean.getName());
		      preparedStatement.setString(2, bean.getSurname());
		      preparedStatement.setString(3, bean.getEmail());
		      preparedStatement.setString(4, bean.getPassword());
		      preparedStatement.setString(5, bean.getIndirizzo());
		      preparedStatement.setString(6, bean.getTelefono());
		      preparedStatement.setString(7, bean.getNumeroCarta());
		      preparedStatement.setString(8, bean.getDataScadenza());
		      preparedStatement.setString(9, bean.getCVV());
		      preparedStatement.setString(10, bean.getIntestatario());
		      if(preparedStatement.executeUpdate()==1) {
		    	  return true;
		      }
		      return false;
	   }
	   catch (Exception ex){
			System.out.println("Log In failed: An Exception has occurred! " + ex);
			return false;
	   } 
   }
   
   public static synchronized boolean doUpdate(UserBean bean) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + UserDAO.TABLE_NAME 
		+ " SET indirizzo= ?, intestatario= ?, numeroCarta= ? , dataScadenza= ?, CVV= ? WHERE  email=?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, bean.getIndirizzo());
			preparedStatement.setString(2, bean.getIntestatario());
			preparedStatement.setString(3, bean.getNumeroCarta());
			preparedStatement.setString(4, bean.getDataScadenza());
			preparedStatement.setString(5, bean.getCVV());
			preparedStatement.setString(6, bean.getEmail());
			
			result = preparedStatement.executeUpdate();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

}

