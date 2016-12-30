package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.Subject;

@MappedSuperclass
public class BaseInterfaceTable extends BaseEntity {
	
	@ManyToOne
	@JoinColumn(name = "subjectId")//主题id
	private Subject subjectId;
	
	@Column(name = "name")//接口名称
	private String name;
	
	@Column(name = "description")//接口描述
	private String description;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="tableId")
	protected List<Field> fields ;

	public Subject getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Subject subjectId) {
		this.subjectId = subjectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Field> getFields() {
		return fields;
	}

	public void setFields(List<Field> fields) {
		this.fields = fields;
	}

}
