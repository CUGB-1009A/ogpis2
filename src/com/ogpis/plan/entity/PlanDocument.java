package com.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.PlanDocumentEntity;

@Entity
@Table(name = "ogpis_plandocument")
public class PlanDocument extends PlanDocumentEntity {

}
