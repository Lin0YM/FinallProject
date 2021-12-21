package com.infotran.springboot.model.groupbuy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "buydetail")
public class buyDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	
	@Column(name="GROUP_NAME")
	private String groupName;
	@Column(name="GROUP_ID")
	private Integer groupId;
	@Column(name="GROUP_SHOP_NAME")
	private String groupShopName; 
	@Column(name="ITEM_ID")
	private Integer itemId;
	@Column(name="ITEM_NAME")
	private String itemName;
	@Column(name="ITEM_INTRO")
	private String itemIntro;
	@Column(name="ITEM_PRICE")
	private Integer itemPrice;
	@Column(name="ITEM_UNIT")
	private String itemUnit;
	@Column(name="ITEM_TOTAL")
	private Integer itemTotal;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getGroupShopName() {
		return groupShopName;
	}
	public void setGroupShopName(String groupShopName) {
		this.groupShopName = groupShopName;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemIntro() {
		return itemIntro;
	}
	public void setItemIntro(String itemIntro) {
		this.itemIntro = itemIntro;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemUnit() {
		return itemUnit;
	}
	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}
	public Integer getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(Integer itemTotal) {
		this.itemTotal = itemTotal;
	}
	
}
