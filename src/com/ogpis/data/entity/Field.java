package com.ogpis.data.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.data.entity.base.BaseField;

@Entity
@Table(name = "ogpis_Field")
public class Field extends BaseField{

}
