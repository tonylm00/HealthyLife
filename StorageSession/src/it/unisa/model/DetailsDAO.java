package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DetailsDAO {

	private static Connection currentCon = null;
	   private static ResultSet rs = null;
	   private static Statement stmt = null;    
	   private static PreparedStatement preparedStatement = null;
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
	   
	   public static Collection<ProductBean> doRetrieveProducts(int id) {
	
	      String searchQuery = "SELECT prodotto.*, dettaglio.* FROM prodotto join dettaglio where prodotto.id=dettaglio.id_prodotto and id_ordine = ?";
	      Collection<ProductBean> products = new LinkedList<ProductBean>();
	      
		   try{
			  currentCon = ds.getConnection();
		      preparedStatement=currentCon.prepareStatement(searchQuery);
		      preparedStatement.setInt(1, id);
		      rs = preparedStatement.executeQuery();	        
		      
		      while(rs.next()) {
		    	 ProductBean bean=new ProductBean();
		    	 bean.setCode(rs.getInt("id"));
				 bean.setName(rs.getString("nome"));
				 bean.setDescription(rs.getString("descrizione"));
			 	 bean.setPrice(rs.getInt("dettaglio.prezzo_unitario"));
			 	 bean.setQuantity(rs.getInt("dettaglio.quantita"));
			 	 bean.setIva(rs.getInt("dettaglio.iva"));
				 products.add(bean);
		      }
		   } 
		   catch (Exception ex){
		      System.out.println("DetailDAO.doRetriveProducts failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
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
		   return products;
	   }
	   
	   public static boolean doSave(Cart cart, int ordine) {
		   
		   String insert="insert into dettaglio(id_prodotto, id_ordine, quantita, prezzo_unitario, iva) values(?, ?, ?, ?, ?)";
		   try{
				  currentCon = ds.getConnection();
				  List<ProductBean> products=cart.getProducts();
				  for(ProductBean product: products) {
					  preparedStatement=currentCon.prepareStatement(insert);
				      preparedStatement.setInt(1, product.getCode());
				      preparedStatement.setInt(2, ordine);
				      System.out.println("CART TOTAL QUANTITY: "+cart.getTotalQuantity());
				      preparedStatement.setInt(3, cart.getTotalQuantity());
				      preparedStatement.setDouble(4, product.getPrezzoScontato());
				      preparedStatement.setDouble(5, product.getIva());
				      
				      if(preparedStatement.executeUpdate()!=1) {
				    	  return false;
				      }
				      product.setQuantity(product.getQuantity()-product.getCartQuantity());
				      ProductDAO.doUpdate(product);
				  }
				  return true;
		   }
		   catch (Exception ex){
				System.out.println("DetailDAO.doSave failed: An Exception has occurred! " + ex);
				ex.printStackTrace();
				return false;
		   } 
	   }
	
}

