package com.intecon.daterange.model;

import java.sql.Date;

public class Tfeft000 {
	
	private Integer idx;
	private String aspTaxId;
	private String invstat;
	private String comp;
	private String invtype;
	private Date crt_tst;
	
	public Tfeft000() {
		
	}
	
	public Tfeft000(String aspTaxId, String invstat, String comp, String invtype, Date crt_tst) {
		super();
		this.aspTaxId = aspTaxId;
		this.invstat = invstat;
		this.comp = comp;
		this.invtype = invtype;
		this.crt_tst = crt_tst;
	}
	
	public String getAspTaxId() {
		return aspTaxId;
	}
	public void setAspTaxId(String aspTaxId) {
		this.aspTaxId = aspTaxId;
	}
	public String getInvstat() {
		return invstat;
	}
	public void setInvstat(String invstat) {
		this.invstat = invstat;
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	public String getInvtype() {
		return invtype;
	}
	public void setInvtype(String invtype) {
		this.invtype = invtype;
	}
	public Date getCrt_tst() {
		return crt_tst;
	}
	public void setCrt_tst(Date crt_tst) {
		this.crt_tst = crt_tst;
	}


	public Integer getIdx() {
		return idx;
	}


	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	
	
}
