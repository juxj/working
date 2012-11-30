package com.zj198.model;

import java.util.Date;


/**
 * FundSales entity. @author MyEclipse Persistence Tools
 */

public class FundSales  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
     private Integer fundId;
     private String salesAgent;
     private String fundCode;
     private String fundName;
     private Date createdTime;
     private Date lastUpdatedTime;


    // Constructors

    /** default constructor */
    public FundSales() {
    }

    
    /** full constructor */
    public FundSales(Integer fundId, String salesAgent, String fundCode, String fundName, Date createdTime, Date lastUpdatedTime) {
        this.fundId = fundId;
        this.salesAgent = salesAgent;
        this.fundCode = fundCode;
        this.fundName = fundName;
        this.createdTime = createdTime;
        this.lastUpdatedTime = lastUpdatedTime;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFundId() {
        return this.fundId;
    }
    
    public void setFundId(Integer fundId) {
        this.fundId = fundId;
    }

    public String getSalesAgent() {
        return this.salesAgent;
    }
    
    public void setSalesAgent(String salesAgent) {
        this.salesAgent = salesAgent;
    }

    public String getFundCode() {
        return this.fundCode;
    }
    
    public void setFundCode(String fundCode) {
        this.fundCode = fundCode;
    }

    public String getFundName() {
        return this.fundName;
    }
    
    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    public Date getCreatedTime() {
        return this.createdTime;
    }
    
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getLastUpdatedTime() {
        return this.lastUpdatedTime;
    }
    
    public void setLastUpdatedTime(Date lastUpdatedTime) {
        this.lastUpdatedTime = lastUpdatedTime;
    }
   








}