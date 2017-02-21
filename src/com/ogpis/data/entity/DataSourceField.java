package com.ogpis.data.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.data.entity.base.BaseDataSourceField;

@Entity
@Table(name = "ogpis_DataSourceField")
public class DataSourceField extends BaseDataSourceField{

}
