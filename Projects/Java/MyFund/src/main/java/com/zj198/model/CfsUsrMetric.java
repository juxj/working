package com.zj198.model;

/**
 * CfsUsrMetric entity. @author MyEclipse Persistence Tools
 */

public class CfsUsrMetric implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer usrId;
	private Integer cfsMetricId;
	private String cfsMetricCode;
	private String cfsMetricName;
	private String metricValues;
	private String measurementInterval;

	// Constructors

	/** default constructor */
	public CfsUsrMetric() {
	}

	/** minimal constructor */
	public CfsUsrMetric(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public CfsUsrMetric(Integer id, Integer usrId, Integer cfsMetricId,
			String cfsMetricCode, String cfsMetricName, String metricValues,
			String measurementInterval) {
		this.id = id;
		this.usrId = usrId;
		this.cfsMetricId = cfsMetricId;
		this.cfsMetricCode = cfsMetricCode;
		this.cfsMetricName = cfsMetricName;
		this.metricValues = metricValues;
		this.measurementInterval = measurementInterval;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsrId() {
		return this.usrId;
	}

	public void setUsrId(Integer usrId) {
		this.usrId = usrId;
	}

	public Integer getCfsMetricId() {
		return this.cfsMetricId;
	}

	public void setCfsMetricId(Integer cfsMetricId) {
		this.cfsMetricId = cfsMetricId;
	}

	public String getCfsMetricCode() {
		return this.cfsMetricCode;
	}

	public void setCfsMetricCode(String cfsMetricCode) {
		this.cfsMetricCode = cfsMetricCode;
	}

	public String getCfsMetricName() {
		return this.cfsMetricName;
	}

	public void setCfsMetricName(String cfsMetricName) {
		this.cfsMetricName = cfsMetricName;
	}

	public String getMetricValues() {
		return this.metricValues;
	}

	public void setMetricValues(String metricValues) {
		this.metricValues = metricValues;
	}

	public String getMeasurementInterval() {
		return this.measurementInterval;
	}

	public void setMeasurementInterval(String measurementInterval) {
		this.measurementInterval = measurementInterval;
	}

}