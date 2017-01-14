package com.ogpis.data.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseColumnSet extends BaseEntity{
	
	@Column(name = "name")//列的中文名
	private String name;
	
	@Column(name = "type")//列的类型，是数值，varchar
	private String type;
	
	@Column(name = "priority")//列的类型，是数值，varchar
	private String priority;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy="columnSet")
	protected List<TableColumns> tableColumns ;

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public List<TableColumns> getTableColumns() {
		return tableColumns;
	}

	public void setTableColumns(List<TableColumns> tableColumns) {
		this.tableColumns = tableColumns;
	}

}
