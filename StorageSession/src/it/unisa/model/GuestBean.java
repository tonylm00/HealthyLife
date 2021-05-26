package it.unisa.model;

import java.time.LocalDateTime;

public class GuestBean  {

    private String email;
    private String nome;
    private String cognome;
    private String data;
    
    public GuestBean() {
   	 LocalDateTime now=LocalDateTime.now();
   	 this.data= now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth()+" "+now.getHour()+":"+now.getMinute()+":"+now.getSecond();
    }
    
    public String getData() {
		return data;
	}
   
    
    public String getCognome() {
		return cognome;
	}
    
   public String getEmail() {
		return email;
	}
    
   public String getNome() {
		return nome;
	}
  
   public void setData(String data) {
		this.data = data;
	}
   
   public void setCognome(String cognome) {
		this.cognome = cognome;
	}
   
   public void setEmail(String email) {
		this.email = email;
	}
   
   public void setNome(String nome) {
		this.nome = nome;
	}
 
}