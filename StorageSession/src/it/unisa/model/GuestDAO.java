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
}
