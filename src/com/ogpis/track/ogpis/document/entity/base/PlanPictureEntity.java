package com.ogpis.track.ogpis.document.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.plan.entity.Plan;

@MappedSuperclass
public class PlanPictureEntity extends BaseEntity {
	@Column(name = "图片名称")
	private String pictureName;
	
/*	@ManyToOne
	@JoinColumn(name = "对应规划id")
	private Plan plan;*/
	
	@Column(name = "图片地址")
	private String pictureAddress;
	
	@Column(name = "图片用途")
	private String picturePurpose;

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

/*	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}*/

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}

	public String getPicturePurpose() {
		return picturePurpose;
	}

	public void setPicturePurpose(String picturePurpose) {
		this.picturePurpose = picturePurpose;
	}
	
	

}
