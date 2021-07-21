package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO{

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

	private static final String TABLE_NAME = "prodotto";

	public synchronized static void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductDAO.TABLE_NAME
				+ " (nome, descrizione, prezzo, quantita) VALUES (?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());

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

	public synchronized static ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantita"));
				bean.setIva(rs.getInt("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzoscontato"));
				bean.setInfo(rs.getString("informazioni"));		
				bean.setImmagine(rs.getString("immagine"));
			}
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	public synchronized static ProductBean doRetrieveByName(String nome) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE nome = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantita"));
				bean.setIva(rs.getInt("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzoscontato"));
				bean.setInfo(rs.getString("informazioni"));		
				bean.setImmagine(rs.getString("immagine"));
			}
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	public synchronized static ProductBean doRetrieveByCategory(String cat) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE categoria = cat";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, cat);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantita"));
				bean.setIva(rs.getInt("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzoscontato"));
				bean.setInfo(rs.getString("informazioni"));		
			}
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	public static synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

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
	
	public static synchronized boolean doUpdate(ProductBean bean) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + ProductDAO.TABLE_NAME + " SET nome= ?, prezzo= ?, descrizione= ?, sconto= ?, prezzoscontato= ?, "
				+ " informazioni= ?, iva= ?, quantita= ? WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, bean.getName());
			preparedStatement.setDouble(2, bean.getPrice());
			preparedStatement.setString(3, bean.getDescription());
			preparedStatement.setDouble(4, bean.getSconto());
			preparedStatement.setDouble(5, bean.getPrezzoScontato());
			preparedStatement.setString(6, bean.getInfo());
			preparedStatement.setDouble(7, bean.getIva());
			preparedStatement.setInt(8, bean.getQuantity());
			preparedStatement.setInt(9, bean.getCode());
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

	public static synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantita"));
				bean.setIva(rs.getInt("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzoscontato"));
				bean.setInfo(rs.getString("informazioni"));	
				bean.setImmagine(rs.getString("immagine"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

}