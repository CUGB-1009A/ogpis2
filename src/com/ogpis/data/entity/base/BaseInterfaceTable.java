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
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseInterfaceTable extends BaseEntity {
	
	@ManyToOne
	@JoinColumn(name = "subjectId")//主题id
	private Subject subject;
	
	@Column(name = "name")//接口名称
	private String name;
	
	@Column(name = "description")//接口描述
	private String description;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="table")
	protected List<Field> field;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="table")
	protected List<TableColumns> tableColumns;
	
	public List<Field> getField() {
		return field;
	}

	public void setField(List<Field> field) {
		this.field = field;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="table")
	protected List<DataSource> dataSource;


	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public List<DataSource> getDataSource() {
		return dataSource;
	}

	public void setDataSource(List<DataSource> dataSource) {
		this.dataSource = dataSource;
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

	public List<TableColumns> getTableColumns() {
		return tableColumns;
	}

	public void setTableColumn(List<TableColumns> tableColumns) {
		this.tableColumns = tableColumns;
	}


}
