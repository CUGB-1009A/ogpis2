package com.ogpis.track.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Target")
public class Target implements Serializable {
	
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String basinName;
	private String year;
	private String company;
	private Double oilProduce;
	private Double tGasProduce;
	private Double mGasProduce;
	private Double yGasProduce;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Double getOilProduce() {
		return oilProduce;
	}
	public void setOilProduce(Double oilProduce) {
		this.oilProduce = oilProduce;
	}
	public Double gettGasProduce() {
		return tGasProduce;
	}
	public void settGasProduce(Double tGasProduce) {
		this.tGasProduce = tGasProduce;
	}
	public Double getmGasProduce() {
		return mGasProduce;
	}
	public void setmGasProduce(Double mGasProduce) {
		this.mGasProduce = mGasProduce;
	}
	public Double getyGasProduce() {
		return yGasProduce;
	}
	public void setyGasProduce(Double yGasProduce) {
		this.yGasProduce = yGasProduce;
	}
	public String getBasinName() {
		return basinName;
	}
	public void setBasinName(String basinName) {
		this.basinName = basinName;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
}
