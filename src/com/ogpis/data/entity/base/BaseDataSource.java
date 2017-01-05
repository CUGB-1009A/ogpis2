package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataCache;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;

@MappedSuperclass
public class BaseDataSource extends BaseEntity{
	
	@Column(name = "name")//数据源名称
	private String name;
	
	@Column(name = "数据源描述信息")
	private String description;
	
	@ManyToOne
	@JoinColumn(name  = "tableId")
	private InterfaceTable table;
	
	@ManyToOne
	@JoinColumn(name = "subjectId")
	private Subject subject;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="dataSource")
	protected List<DataCache> dataCache;
	
	@ManyToMany(targetEntity = Field.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataSource_Field",joinColumns = @JoinColumn(name = "DataSource_ID"), inverseJoinColumns = @JoinColumn(name = "Field_ID"))
	protected List<Field> field ;

	public List<Field> getField() {
		return field;
	}

	public void setField(List<Field> field) {
		this.field = field;
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

	public InterfaceTable getTable() {
		return table;
	}

	public void setTable(InterfaceTable table) {
		this.table = table;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<DataCache> getDataCache() {
		return dataCache;
	}

	public void setDataCache(List<DataCache> dataCache) {
		this.dataCache = dataCache;
	}
	

}