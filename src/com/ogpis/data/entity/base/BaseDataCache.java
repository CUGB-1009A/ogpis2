package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSource;

@MappedSuperclass
public class BaseDataCache extends BaseEntity{
	
	@Column(name = "params")//数据缓存参数
	private String params;
	
	@Column(name = "result")//该参数条件下的缓存结果
	private String result;
	
	@Column(name = "frequency")//该缓存使用的频率
	private Integer frequency;
	
	@ManyToOne
	@JoinColumn(name = "dataSourceId")//对应数据源id
	private DataSource dataSource;

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Integer getFrequency() {
		return frequency;
	}

	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}

}
