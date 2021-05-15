package it.unisa.model;

public class DetailsBean {

	private String id_ordine;
	private String id_prodotto;
	private int quantita;
	private int iva; 
	private double prezzo_unitario;
	  
	public DetailsBean() {
		
	}

	public String getId_ordine() {
		return id_ordine;
	}

	public void setId_ordine(String id_ordine) {
		this.id_ordine = id_ordine;
	}

	public String getId_prodotto() {
		return id_prodotto;
	}

	public void setId_prodotto(String id_prodotto) {
		this.id_prodotto = id_prodotto;
	}

	public int getIva() {
		return iva;
	}

	public void setIva(int iva) {
		this.iva = iva;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public double getPrezzo_unitario() {
		return prezzo_unitario;
	}

	public void setPrezzo_unitario(double prezzo_unitario) {
		this.prezzo_unitario = prezzo_unitario;
	}
	
}
