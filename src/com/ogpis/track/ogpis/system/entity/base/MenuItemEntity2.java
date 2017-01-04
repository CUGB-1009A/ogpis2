package com.ogpis.track.ogpis.system.entity.base;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.system.entity.MenuItem2;

@MappedSuperclass
public abstract class MenuItemEntity2 extends BaseEntity {

	private String name;
	private String description;
	/**
	 * 优先级，用于排序
	 */
	private int priority;
	private String url;

	@ManyToOne
	@JoinColumn(name = "father_id")
	private MenuItem2 father;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "father")
	private Set<MenuItem2> children;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public MenuItem2 getFather() {
		return father;
	}

	public void setFather(MenuItem2 father) {
		this.father = father;
	}

	public Set<MenuItem2> getChildren() {
		return children;
	}

	public void setChildren(Set<MenuItem2> children) {
		this.children = children;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}
	

}