package com.ogpis.demo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.demo.entity.base.DemoEntity;

@Entity
@Table(name = "ogpis_demo")
public class Demo extends DemoEntity {

}
