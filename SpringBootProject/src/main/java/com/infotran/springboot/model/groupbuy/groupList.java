package com.infotran.springboot.model.groupbuy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "grouplist")
public class groupList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GROUP_ID")
	private Integer groupId;
	
	@Column(name="GROUP_NAME")
	private String groupName;
	@Column(name="GROUP_SHOP_NAME")
	private String groupShopName; 
	@Column(name="GROUP_AREA")
	private String groupArea; 
	@Column(name="PROMOTER")
	private String promoter; 
	@Column(name="PUBLIC_OR_NOT")
	private String publiconoot;
	@Column(name="SOLD_STATUS")
	private String soldStatus;
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupShopName() {
		return groupShopName;
	}
	public void setGroupShopName(String groupShopName) {
		this.groupShopName = groupShopName;
	}
	public String getGroupArea() {
		return groupArea;
	}
	public void setGroupArea(String groupArea) {
		this.groupArea = groupArea;
	}
	public String getPromoter() {
		return promoter;
	}
	public void setPromoter(String promoter) {
		this.promoter = promoter;
	}
	public String getPubliconoot() {
		return publiconoot;
	}
	public void setPubliconoot(String publiconoot) {
		this.publiconoot = publiconoot;
	}
	public String getSoldStatus() {
		return soldStatus;
	}
	public void setSoldStatus(String soldStatus) {
		this.soldStatus = soldStatus;
	}
}
