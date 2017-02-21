package com.ogpis.data.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.data.entity.base.BaseMultiDataSourceMetric;

@Entity
@Table(name = "ogpis_MultiDataSourceMetric")
public class MultiDataSourceMetric extends BaseMultiDataSourceMetric{

}
