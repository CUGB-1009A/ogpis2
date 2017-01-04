package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uploadDate;

	/**
	 * 文档上传用户
	 */
	private User uploadUser;
	
	@ManyToOne
	@JoinColumn(name = "Plan_Id")
	private Plan plan;

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentDescription() {
		return documentDescription;
	}

	public void setDocumentDescription(String documentDescription) {
		this.documentDescription = documentDescription;
	}

	public String getDocumentSize() {
		return documentSize;
	}

	public void setDocumentSize(String documentSize) {
		this.documentSize = documentSize;
	}

	public String getDocumentAddress() {
		return documentAddress;
	}

	public void setDocumentAddress(String documentAddress) {
		this.documentAddress = documentAddress;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public User getUploadUser() {
		return uploadUser;
	}

	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}
}
