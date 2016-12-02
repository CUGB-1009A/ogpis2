package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseDataCollection;

@Entity
@Table(name = "ogpis_DataCollection")
public class DataCollection extends BaseDataCollection{

}
