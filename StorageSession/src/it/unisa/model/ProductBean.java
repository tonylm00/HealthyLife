package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int codice;
	private String nome;
	private String descrizione;
	private String informazioni;
	private double prezzo;
	private double sconto;
	private double prezzoscontato;
	private int quantita;
	private double iva;
	private int cartQuantity;
	private double tot;
	private String immagine;
	
	public ProductBean() {
		codice = -1;
		nome = "";
		
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

	public double getIva() {
		return iva;
	}

	public void setIva(double d) {
		this.iva = d;
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

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String newimmagine) {
		this.immagine = newimmagine;
	}

}