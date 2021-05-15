package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	private double prezzoTot;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
		this.setCartPrice();
	}
	
	public void increaseProductQ(ProductBean b) {
		if(b.getCartQuantity()<b.getQuantity()) {
			b.setCartQuantity(b.getCartQuantity()+1);
			b.setTot(b.getCartQuantity()*b.getPrice());
			this.replaceProduct(b);
			this.setCartPrice();
		}
	}
	
	public void decreaseProductQ(ProductBean b) {
		if(b.getCartQuantity()>0) {
			b.setCartQuantity(b.getCartQuantity()-1);
			b.setTot(b.getCartQuantity()*b.getPrice());
			this.replaceProduct(b);
			this.setCartPrice();
		}
	}
	
	public ProductBean getProduct(int id) {
		for(ProductBean prod : products) {
			if(prod.getCode() == id) {
				return prod;
			}
		}
		return null;
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				this.setCartPrice();
				break;
			}
		}
 	}
	
	public boolean isInCart(int id) {
		for(ProductBean prod : products) {
			if(prod.getCode() == id) {
				return true;
			}
		}
		return false;
	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public int getSize() {
		return products.size();
	}
	
	public boolean replaceProduct(ProductBean bean) {
		for(int i=0;i<products.size();i++){
			if(bean.getCode()==products.get(i).getCode()) {
				products.set(i, bean);
				return true;
			}
		}
		return false;
	}
	
	public double getTotPrice() {
		return this.prezzoTot;
	}
	
	public void setTotPrice(double n) {
		this.prezzoTot=n;
	}
	
	private void setCartPrice() {
		this.prezzoTot=0;
		for (ProductBean productBean : products) {
			this.prezzoTot+= productBean.getPrice()*productBean.getCartQuantity();
		}
	}
	
}