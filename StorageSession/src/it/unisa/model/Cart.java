package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
		product.setCartQuantity(1);
		product.setTot(product.getPrice());
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
				break;
			}
		}
 	}
	
	public Cart svuota()
	{
		List<ProductBean> products2 = new ArrayList<ProductBean>();
		this.products = products2;
		return this;
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

	public boolean replaceProduct(ProductBean bean) {
		for(int i=0;i<products.size();i++){
			if(bean.getCode()==products.get(i).getCode()) {
				products.set(i, bean);
				return true;
			}
		}
		return false;
	}
	
}