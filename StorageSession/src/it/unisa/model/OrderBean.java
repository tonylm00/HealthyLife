package it.unisa.model;

public class OrderBean {

	private String utente;
	private int guest;
	private String data;
	private double prezzoTot;
	private int id;
	
	public String getData() {
		return data;
	}
	
	public void setData(String newData) {
		this.data = newData;
	}
	public String getUtente() {
		return utente;
	}
	public void setUtente(String utente) {
		this.utente = utente;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getPrezzoTot() {
		return prezzoTot;
	}
	public void setPrezzoTot(double prezzoTot) {
		this.prezzoTot = prezzoTot;
	}

	public int getGuest() {
		return guest;
	}

	public void setGuest(int guest) {
		this.guest = guest;
	}	
}
