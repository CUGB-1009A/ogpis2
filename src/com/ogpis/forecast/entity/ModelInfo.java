package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.forecast.entity.base.BaseModelInfo;

@Entity
@Table(name = "ogpis_ModelInfo")
public class ModelInfo extends BaseModelInfo{

}
