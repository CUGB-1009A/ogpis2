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
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseInterfaceTable extends BaseEntity {

	
	@Column(name = "name_CN")//接口表名称
	private String name_CN;
	
	@Column(name = "name_EN")//接口表名称
	private String name_EN;
	
	@Column(name = "description")//接口描述
	private String description;
	
	@ManyToMany
	@JoinTable(name = "ogpis_InterfaceTable_Subject",joinColumns = @JoinColumn(name = "InterfaceTable_ID"), inverseJoinColumns = @JoinColumn(name = "Subject_ID"))
	protected List<Subject> subjects;
	
	@Column(name = "isLocal")
	private boolean isLocal;

	@OneToMany(mappedBy="table")
	protected List<DataSource> dataSource;
	
	@OneToMany(mappedBy="table")
	protected List<TableColumns> tableColumns;

	public String getName_CN() {
		return name_CN;
	}

	public void setName_CN(String name_CN) {
		this.name_CN = name_CN;
	}

	public String getName_EN() {
		return name_EN;
	}

	public void setName_EN(String name_EN) {
		this.name_EN = name_EN;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}

	public boolean isLocal() {
		return isLocal;
	}

	public void setLocal(boolean isLocal) {
		this.isLocal = isLocal;
	}

	public List<DataSource> getDataSource() {
		return dataSource;
	}

	public void setDataSource(List<DataSource> dataSource) {
		this.dataSource = dataSource;
	}

	public List<TableColumns> getTableColumns() {
		return tableColumns;
	}

	public void setTableColumns(List<TableColumns> tableColumns) {
		this.tableColumns = tableColumns;
	}

}
