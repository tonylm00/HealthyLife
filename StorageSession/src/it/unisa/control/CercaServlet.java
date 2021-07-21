package it.unisa.control;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class CercaServlet extends HttpServlet {
    private static final long serialVersionUID= 1L;
    public CercaServlet(){
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 
    	String data=req.getParameter("data");
		try {
			ArrayList<ProductBean> products = new ArrayList<>(ProductDAO.doRetrieveAll(""));
		     ArrayList<ProductBean> result= new ArrayList<>();
	         for(int i=0; i<products.size() ;i++){
	             if (products.get(i).getName().toLowerCase().contains(data.toLowerCase()))
	             {
	            	 System.out.println(products.get(i).getName());
	            	 result.add(products.get(i));
	             }
	                
	         }
	         resp.setContentType("text/plain;charset=UTF-8");
	         if(result!=null) {
	             resp.getWriter().append("[");
	             String nome;
	             for (int i = 0; i < result.size(); i++) {
	                 nome = result.get(i).getName();
	                 resp.getWriter().append("\"").append(nome).append("\"");
	                 if (i != result.size() - 1)
	                     resp.getWriter().append(",");
	             }
	             resp.getWriter().append("]");
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}