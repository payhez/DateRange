package com.intecon.daterange.model;

public class Tfedf000 {
	
	private Integer comp;
	private String kunv;
	private String edef;
	
	public Tfedf000() {
		
	}
	public Tfedf000(Integer comp, String kunv, String edef) {
		super();
		this.comp = comp;
		this.kunv = kunv;
		this.edef = edef;
	}
	
	
	public Integer getComp() {
		return comp;
	}
	public void setComp(Integer comp) {
		this.comp = comp;
	}
	public String getKunv() {
		return kunv;
	}
	public void setKunv(String kunv) {
		this.kunv = kunv;
	}
	public String getEdef() {
		return edef;
	}
	public void setEdef(String edef) {
		this.edef = edef;
	}
}
