package com.ogpis.track.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Layout")
public class Layout implements Serializable{

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Double x;
	private Double y;
	private String type;
	private Double value;
	private String year;
	private String company;
	private Double oilReserve;
	private Double tGasReserve;
	private Double mGasReserve;
	private Double yGasReserve;
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
	public Double getOilReserve() {
		return oilReserve;
	}
	public void setOilReserve(Double oilReserve) {
		this.oilReserve = oilReserve;
	}
	public Double gettGasReserve() {
		return tGasReserve;
	}
	public void settGasReserve(Double tGasReserve) {
		this.tGasReserve = tGasReserve;
	}
	public Double getmGasReserve() {
		return mGasReserve;
	}
	public void setmGasReserve(Double mGasReserve) {
		this.mGasReserve = mGasReserve;
	}
	public Double getyGasReserve() {
		return yGasReserve;
	}
	public void setyGasReserve(Double yGasReserve) {
		this.yGasReserve = yGasReserve;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public Double getX() {
		return x;
	}
	public void setX(Double x) {
		this.x = x;
	}
	public Double getY() {
		return y;
	}
	public void setY(Double y) {
		this.y = y;
	}
}
