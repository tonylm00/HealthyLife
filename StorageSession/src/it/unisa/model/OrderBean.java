package it.unisa.model;

import java.time.LocalDateTime;

public class OrderBean {

	private String data;
	private String utente;
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
}
