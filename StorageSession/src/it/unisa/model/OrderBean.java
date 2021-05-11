package it.unisa.model;

public class OrderBean {

	private int id;
	private String nome;
	private String descrizione;
	private String informazioni;
	private float sconto;
	private int iva;
	private int id_utente;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getInformazioni() {
		return informazioni;
	}
	public void setInformazioni(String informazioni) {
		this.informazioni = informazioni;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public float getSconto() {
		return sconto;
	}
	public void setSconto(float sconto) {
		this.sconto = sconto;
	}
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}
	public int getIva() {
		return iva;
	}
	public void setIva(int iva) {
		this.iva = iva;
	}
}
