package com.ogpis.data.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.data.entity.base.BaseDataSource;

@Entity
@Table(name = "ogpis_DataSource")
public class DataSource extends BaseDataSource{

}
