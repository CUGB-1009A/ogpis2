package com.ogpis.track.entity;
import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="ZWXTestTable")
public class TestEntity implements Serializable {
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	@Column(columnDefinition="text")
	private String params;
	private String result;
	private String dataSourceId;
	private TrackUser user;
	
	public TestEntity(String params, String result){
		this.params=params;
		this.result=result;
	}
	public TestEntity(){
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	@Lob
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Column(columnDefinition="text")
	public String getDataSourceId() {
		return dataSourceId;
	}
	public void setDataSourceId(String dataSourceId) {
		this.dataSourceId = dataSourceId;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="name",referencedColumnName ="name",insertable=true)
	public TrackUser getUser() {
		return user;
	}
	public void setUser(TrackUser user) {
		this.user = user;
	}
}
