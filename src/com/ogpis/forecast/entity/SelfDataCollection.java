package com.ogpis.forecast.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.forecast.entity.base.BaseSelfDataCollection;

@Entity
@Table(name = "ogpis_SelfDataCollection")
public class SelfDataCollection extends BaseSelfDataCollection {

}
