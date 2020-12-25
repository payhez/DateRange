package com.intecon.daterange.model;

public class QueriedObject {
	
	private String edef;
	private String aspTaxId;
	private Integer comp;
	private String kunv;
	private Integer countASPTaxId;
	private String invstat;
	
	public QueriedObject() {
		
	}
	
	public QueriedObject(String edef, String aspTaxId, Integer comp, String kunv, Integer countASPTaxId, String invstat) {
		super();
		this.edef = edef;
		this.aspTaxId = aspTaxId;
		this.comp = comp;
		this.kunv = kunv;
		this.countASPTaxId = countASPTaxId;
		this.invstat = invstat;
	}
	
	
	public String getEdef() {
		return edef;
	}
	public void setEdef(String edef) {
		this.edef = edef;
	}
	public String getAspTaxId() {
		return aspTaxId;
	}
	public void setAspTaxId(String aspTaxId) {
		this.aspTaxId = aspTaxId;
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
	public Integer getCountASPTaxId() {
		return countASPTaxId;
	}
	public void setCountASPTaxId(Integer countASPTaxId) {
		this.countASPTaxId = countASPTaxId;
	}
	public String getInvstat() {
		return invstat;
	}
	public void setInvstat(String invstat) {
		this.invstat = invstat;
	}
}
