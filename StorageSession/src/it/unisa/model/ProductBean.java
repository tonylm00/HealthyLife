package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int codice;
	String nome;
	String descrizione;
	String informazioni;
	double prezzo;
	double sconto;
	double prezzoscontato;
	int quantita;
	int iva;
	int cartQuantity;
	double tot;
	
	public ProductBean() {
		codice = -1;
		nome = "";
		descrizione = "";
		quantita = 0;
		cartQuantity = 0;
		tot=0;
	}

	public double getTot() {
		return tot;
	}

	public void setTot(double tot) {
		this.tot = tot;
	}
	
	public int getCode() {
		return codice;
	}

	public void setCode(int code) {
		this.codice = code;
	}

	public int getIva() {
		return iva;
	}

	public void setIva(int code) {
		this.iva = code;
	}
	
	public String getName() {
		return nome;
	}

	public void setName(String name) {
		this.nome = name;
	}

	public String getDescription() {
		return descrizione;
	}

	public void setDescription(String description) {
		this.descrizione = description;
	}

	public String getInfo() {
		return informazioni;
	}

	public void setInfo(String description) {
		this.informazioni = description;
	}
	
	public double getPrice() {
		return prezzo;
	}
	
	public void setPrice(double price) {
		this.prezzo = price;
	}
	
	public double getPrezzoScontato() {
		return prezzoscontato;
	}
	public void setPrezzoScontato(double prezzoScontato) {
		this.prezzoscontato = prezzoScontato;
	}
	
	public double getSconto() {
		return sconto;
	}
	
	public void setSconto(double sconto) {
		this.sconto = sconto;
	}

	public int getQuantity() {
		return quantita;
	}

	public void setQuantity(int quantity) {
		this.quantita = quantity;
	}
	
	public int getCartQuantity() {
		return this.cartQuantity;
	}

	public void setCartQuantity(int quantity) {
		this.cartQuantity = quantity;
	}

	@Override
	public String toString() {
		return nome + " (" + codice + "), " + prezzo + " " + quantita + ". " + descrizione;
	}

}