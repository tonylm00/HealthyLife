package it.unisa.model;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GuestDAO {

	   private static Connection currentCon = null;
	   private static ResultSet rs = null;
	   private static Statement stmt = null;    
	   private static PreparedStatement preparedStatement = null;
	   private static DataSource ds;
	   private static final String TABLE_NAME = "guest";
	   
	   static {
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");

				ds = (DataSource) envCtx.lookup("jdbc/healthylife");

			} catch (NamingException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
		
		public static synchronized GuestBean doSave(GuestBean guest) throws SQLException {

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String insertSQL = "INSERT INTO " + GuestDAO.TABLE_NAME
					+ " (data_ora, nome, cognome, email, telefono, indirizzo) VALUES (?, ?, ?, ?, ?, ?)";

			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(insertSQL);
				preparedStatement.setString(1, guest.getData());
				preparedStatement.setString(2, guest.getNome());
				preparedStatement.setString(3, guest.getCognome());
				preparedStatement.setString(4, guest.getEmail());
				preparedStatement.setString(5, guest.getTelefono());
				preparedStatement.setString(6, guest.getIndirizzo());
				preparedStatement.executeUpdate();
				connection.setAutoCommit(false);
				connection.commit();
			}
			catch (Exception ex){
			      System.out.println("Insert failed: An Exception has occurred! " + ex);
			      ex.printStackTrace();
			}
			finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
			return guest;
		}
	   
	   public static AdminBean doRetrieve(AdminBean bean) {
		
		   String username = bean.getUsername();    
		      String password = bean.getPassword();   
			    
		      String searchQuery = "SELECT * FROM " + GuestDAO.TABLE_NAME + " WHERE username = ? AND password = ?";
		      
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
			         } catch (Exception e) {}
			         currentCon = null;
			      }
			   }
			   return bean;
	   }
	   
	   public static synchronized int getId(GuestBean guest) throws SQLException {
			String selectSQL = "SELECT id FROM " + GuestDAO.TABLE_NAME + " WHERE email= ? and data_ora= ?";
			int id=-1;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, guest.getEmail());
				preparedStatement.setString(2, guest.getData());
				ResultSet rs = preparedStatement.executeQuery();
				rs.next();
				id=rs.getInt("id");
			}
			catch (Exception ex){
			      System.out.println("OrderDAO.getId failed: An Exception has occurred! " + ex);
			      ex.printStackTrace();
			}
			finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
			return id;
		}
	   
	}
