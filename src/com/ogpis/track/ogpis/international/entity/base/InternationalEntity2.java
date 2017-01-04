package com.ogpis.track.ogpis.international.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.track.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class InternationalEntity2 extends BaseEntity {

	@Column(name = "companyName")
	protected String companyName;

	@Column(columnDefinition="TEXT", name = "description")
	protected String content;
	
	@Column(name = "文档名称")
	protected String fileName;
	
	@Column(name = "文档路径")
	protected String filePath;
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
