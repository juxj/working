package com.zj198.model.vo;

public class CfsComparedReport {

	private String itemCode;
	private String itemName;
	private String itemPropCode;
	private Integer columnId;
	private Double preYearValue;
	private Double currYearValue;
	private Double preYearPcnt;
	private Double currYearPcnt;
	private Double diffValue;
	private Integer rank1;
	private Integer rank2;
	private String conclusion;
	private String hasFormular;
	private String isDataItem;
	private String rankCode;
	
	
	public String getRankCode() {
		return rankCode;
	}


	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}


	public String getIsDataItem() {
		return isDataItem;
	}


	public void setIsDataItem(String isDataItem) {
		this.isDataItem = isDataItem;
	}


	public Integer getColumnId() {
		return columnId;
	}


	public void setColumnId(Integer columnId) {
		this.columnId = columnId;
	}


	public String getItemPropCode() {
		return itemPropCode;
	}


	public void setItemPropCode(String itemPropCode) {
		this.itemPropCode = itemPropCode;
	}


	public String getItemCode() {
		return itemCode;
	}


	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}


	public String getItemName() {
		return itemName;
	}
	
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Double getPreYearValue() {
		return preYearValue;
	}
	public void setPreYearValue(Double preYearValue) {
		this.preYearValue = preYearValue;
	}
	public Double getCurrYearValue() {
		return currYearValue;
	}
	public void setCurrYearValue(Double currYearValue) {
		this.currYearValue = currYearValue;
	}
	public Double getPreYearPcnt() {
		return preYearPcnt;
	}
	public void setPreYearPcnt(Double preYearPcnt) {
		this.preYearPcnt = preYearPcnt;
	}
	public Double getCurrYearPcnt() {
		return currYearPcnt;
	}
	public void setCurrYearPcnt(Double currYearPcnt) {
		this.currYearPcnt = currYearPcnt;
	}
	public Double getDiffValue() {
		return diffValue;
	}
	public void setDiffValue(Double diffValue) {
		this.diffValue = diffValue;
	}
	public Integer getRank1() {
		return rank1;
	}
	public void setRank1(Integer rank1) {
		this.rank1 = rank1;
	}
	public Integer getRank2() {
		return rank2;
	}
	public void setRank2(Integer rank2) {
		this.rank2 = rank2;
	}
	public String getConclusion() {
		return conclusion;
	}
	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}
	public String getHasFormular() {
		return hasFormular;
	}
	public void setHasFormular(String hasFormular) {
		this.hasFormular = hasFormular;
	}
	
	
	
}
