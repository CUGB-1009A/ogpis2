package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.TableColumns;

@MappedSuperclass
public class BaseDataSourceField extends BaseEntity{
	
	@ManyToOne
	@JoinColumn(name="dataSourceId")
	private DataSource dataSource;
	
	@ManyToOne
	@JoinColumn(name="tableColumnsId")
	private TableColumns tableColumns;
	
	@ManyToOne
	@JoinColumn(name="dimensionId")
	private Dimension dimension;
	
	@Column(name="isX")
	private boolean isX;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public TableColumns getTableColumn() {
		return tableColumns;
	}

	public void setTableColumn(TableColumns tableColumns) {
		this.tableColumns = tableColumns;
	}

	public Dimension getDimension() {
		return dimension;
	}

	public void setDimension(Dimension dimension) {
		this.dimension = dimension;
	}

	public boolean isX() {
		return isX;
	}

	public void setX(boolean isX) {
		this.isX = isX;
	}
	

}
