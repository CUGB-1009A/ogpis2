package com.ogpis.data.entity.base;

import java.util.List;
import java.util.Set;

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
import com.ogpis.data.entity.ColumnSet;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.TableColumns;
@MappedSuperclass
public class BaseTableColumns extends BaseEntity{


	@Column(name = "tablecolumn_key")//
	private String key;
	
	@Column(name = "tablecolumn_value")//
	private String value;
	
	@ManyToOne
	@JoinColumn(name = "parentId")//父数据源id，如果数据源有子数据源，则没有具体的维度
	private TableColumns parentTableColumn;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "parentTableColumn")
	private Set<TableColumns> children;
	
	public TableColumns getParentTableColumn() {
		return parentTableColumn;
	}

	public void setParentTableColumn(TableColumns parentTableColumn) {
		this.parentTableColumn = parentTableColumn;
	}

	public Set<TableColumns> getChildren() {
		return children;
	}

	public void setChildren(Set<TableColumns> children) {
		this.children = children;
	}

	@ManyToOne
	@JoinColumn(name = "tableId")//
	private InterfaceTable table;
	
	@ManyToOne
	@JoinColumn(name = "columnSetId")//
	private ColumnSet columnSet;
	
	@ManyToMany(targetEntity = DataSource.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "ogpis_DataSource_TableColumns",joinColumns = @JoinColumn(name = "TableColumns_ID"), inverseJoinColumns = @JoinColumn(name = "DataSource_ID"))
	protected List<DataSource> dataSource ;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	public InterfaceTable getTable() {
		return table;
	}

	public void setTable(InterfaceTable table) {
		this.table = table;
	}

	public ColumnSet getColumnSet() {
		return columnSet;
	}

	public void setColumnSet(ColumnSet columnSet) {
		this.columnSet = columnSet;
	}

	public List<DataSource> getDataSource() {
		return dataSource;
	}

	public void setDataSource(List<DataSource> dataSource) {
		this.dataSource = dataSource;
	}
	
	
}

