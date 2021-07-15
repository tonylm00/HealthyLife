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

public class CategoriaDAO {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/healthylife");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
			e.printStackTrace();
		}
	}

	private static final String TABLE_NAME = "categoria";

	public static synchronized CategoriaBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		CategoriaBean bean = new CategoriaBean();

		String selectSQL = "SELECT * FROM " + CategoriaDAO.TABLE_NAME + " WHERE nome = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNome(rs.getString("nome"));
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

	public static synchronized Collection<CategoriaBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<CategoriaBean> categories = new LinkedList<CategoriaBean>();

		String selectSQL = "SELECT * FROM " + CategoriaDAO.TABLE_NAME;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				CategoriaBean bean = new CategoriaBean();
				bean.setNome(rs.getString("nome"));
				bean.setImmagine(rs.getString("immagine"));
				categories.add(bean);
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
		return categories;
	}
	
	public static synchronized Collection<ProductBean> doRetrieveProductsbyCategoria(String cat) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT prodotto.* FROM prodotto join Appartenenza where prodotto.id=Appartenenza.prodotto and Appartenenza.categoria= ? ";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, cat);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantita"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzoscontato"));
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