package com.ogpis.forecast.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Subject;
import com.ogpis.forecast.entity.ModelInfo;

@MappedSuperclass
public class BaseForecastType extends BaseEntity{
	
	@Column(name = "预测类型")
	private String type ;
	
	@ManyToMany(targetEntity = ModelInfo.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ForecastType_ModelInfo",joinColumns = @JoinColumn(name = "ForecastType_ID"), inverseJoinColumns = @JoinColumn(name = "ModelInfo_ID"))
	protected List<ModelInfo> modelInfo ;
	
	@ManyToMany(targetEntity = Subject.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_ForecastType_Subject",joinColumns = @JoinColumn(name = "ForecastType_ID"), inverseJoinColumns = @JoinColumn(name = "Subject_ID"))
	protected List<Subject> subject ;
	
	public List<Subject> getSubject() {
		return subject;
	}

	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<ModelInfo> getModelInfo() {
		return modelInfo;
	}

	public void setModelInfo(List<ModelInfo> modelInfo) {
		this.modelInfo = modelInfo;
	}

}
