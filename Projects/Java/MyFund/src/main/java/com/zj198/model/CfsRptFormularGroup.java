package com.zj198.model;

import java.util.List;

public class CfsRptFormularGroup {
	
	private String id;
	private List<CfsRptFormular> formulars;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public List<CfsRptFormular> getFormulars() {
		return formulars;
	}
	public void setFormulars(List<CfsRptFormular> formulars) {
		this.formulars = formulars;
	}
	
}
