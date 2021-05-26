package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdminDAO {
	
	   private static Connection currentCon = null;
	   private static ResultSet rs = null;
	   private static Statement stmt = null;    
	   private static PreparedStatement preparedStatement = null;
	   private static DataSource ds;
	   private static final String TABLE_NAME = "amministratore";
	   
		static {
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");

				ds = (DataSource) envCtx.lookup("jdbc/healthylife");

			} catch (NamingException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
	   
	   public static AdminBean doRetrieve(AdminBean bean) {
		
	      String username = bean.getUsername();    
	      String password = bean.getPassword();   
		    
	      String searchQuery = "SELECT * FROM " + AdminDAO.TABLE_NAME + " WHERE username = ? AND pw = ?";
	      
		   // "System.out.println" prints in the console; Normally used to trace the process
		   System.out.println("Your user name is " + username);          
		   System.out.println("Your password is " + password);
		   System.out.println("Query: "+searchQuery);
	   
		   try{
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(searchQuery);
		      preparedStatement.setString(1, username);
		      preparedStatement.setString(2, password);
		      rs = preparedStatement.executeQuery();	        
		      boolean more = rs.next();
			       
		      // if user does not exist set the isValid variable to false
		      if (!more){
		         System.out.println("Account amministratore non valido");
		         bean.setValid(false);
		      } 
			        
		      //if user exists set the isValid variable to true
		      else{
		     
		         bean.setValid(true);
		      }
		   } 
		   catch (Exception ex){
		      System.out.println("Login amministratore fallito" + ex);
		   } 
		   
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
	   
	}
