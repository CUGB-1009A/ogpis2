package com.ogpis.data.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.InterfaceTable;

@MappedSuperclass
public class BaseField extends BaseEntity {
	

	
	@Column(name = "field_key")//对应接口中的英文字段名，例如年份为NF，key=NF
	private String key;
	
	@Column(name = "field_value")//展示给用户看的维度名称
	private String value;
	
	@ManyToOne
	@JoinColumn(name = "tableId")//接口表id
	private InterfaceTable table;
	
	@ManyToOne
	@JoinColumn(name = "dimensionId")//维度id
	private Dimension dimension;

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

	public void setTableId(InterfaceTable table) {
		this.table = table;
	}

	public Dimension getDimension() {
		return dimension;
	}

	public void setDimensionId(Dimension dimension) {
		this.dimension = dimension;
	}


	
	

}
