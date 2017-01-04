package com.ogpis.track.ogpis.document.entity.base;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.system.entity.User;
import com.ogpis.track.ogpis.plan.entity.Plan;

/**
 * 规划文档，定义了规划文档实体的字段信息
 * 
 * @author Danny
 *
 */
@MappedSuperclass
public class PlanDocumentEntity extends BaseEntity {

	@Column(name = "文档名称")
	private String documentName;
	
	@Column(name = "文档概述")
	private String documentDescription;

	@Column(name = "文档容量")
	private String documentSize;

	@Column(name = "文档地址")
	private String documentAddress;
	
	@Column(name = "文档类型")
	private String documentType;

	@Column(name = "上传时间")
	private Date uploadDate;

	@Column(name = "上传用户")
	private User uploadUser;
	
	@ManyToOne
	@JoinColumn(name = "对应规划id")
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
	
	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

}
