package com.ogpis.track.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="TrackUser")
public class TrackUser implements Serializable{
	
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id2;
	@Id@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId2() {
		return id2;
	}
	public void setId2(Integer id) {
		this.id2 = id;
	}
	private String name;
	@Column(unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String password;
}
