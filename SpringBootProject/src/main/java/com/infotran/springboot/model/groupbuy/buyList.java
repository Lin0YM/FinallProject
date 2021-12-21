package com.infotran.springboot.model.groupbuy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "buylist")
public class buyList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="BUYLIST_ID")
	private Integer buyListId;
	
	@Column(name="GROUP_ID")
	private Integer groupId;
	@Column(name="BUYER_NAME")
	private String buyerName;
	@Column(name="ITEM_ID")
	private Integer itemId;
	@Column(name="ITEM_NUMBER")
	private Integer itemNumber;
	public Integer getBuyListId() {
		return buyListId;
	}
	public void setBuyListId(Integer buyListId) {
		this.buyListId = buyListId;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public Integer getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(Integer itemNumber) {
		this.itemNumber = itemNumber;
	}
}
