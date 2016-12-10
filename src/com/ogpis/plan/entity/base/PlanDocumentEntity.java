package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.Plan;
import com.ogpis.system.entity.User;

@MappedSuperclass
public class PlanDocumentEntity extends BaseEntity {
	/**
	 * 文档名称
	 */
	private String documentName;
	
	/**
	 * 文档描述
	 */
	private String documentDescription;

	/**
	 * 文档容量
	 */
	private String documentSize;

	/**
	 * 文档地址
	 */
	private String documentAddress;
	
	/**
	 * 文档类型
	 */
	private String documentType;

	/**
	 * 文档上传时间
	 */
	@Column(columnDefinition="DATE")
	private Date uploadDate;

	/**
	 * 文档上传用户
	 */
	private User uploadUser;
	
	@ManyToOne
	@JoinColumn(name = "Plan_Id")
	private Plan plan;
}
