package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoriaDAO {

	 private static Connection currentCon = null;
	   private static ResultSet rs = null;
	   private static Statement stmt = null;    
	   private static PreparedStatement preparedStatement = null;
	   private static DataSource ds;
	   private static final String TABLE_NAME = "categoria";
	   
		static {
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");

				ds = (DataSource) envCtx.lookup("jdbc/healthylife");

			} catch (NamingException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
	   
	   public static CategoriaBean doRetrieve(CategoriaBean bean) {
		
	      String nome = bean.getNome();    
		    
	      String searchQuery = "SELECT * FROM " + CategoriaDAO.TABLE_NAME + " WHERE nome = ? ";
	         
		   try{
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(searchQuery);
		      preparedStatement.setString(1, nome);
		      rs = preparedStatement.executeQuery();	        
			       
		   } 
		   catch (Exception ex){
		      System.out.println("Retrieve categoria fallito" + ex);
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
