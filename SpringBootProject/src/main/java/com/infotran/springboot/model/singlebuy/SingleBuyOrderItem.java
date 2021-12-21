package com.infotran.springboot.model.singlebuy;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="singlebuyorderitem")
public class SingleBuyOrderItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer orderid;
	private Integer userid;
	private Integer itemid;
	private String itemname;
	private Integer itemprice;
	private Integer quantity;
	private String orderstatus;
	
	public SingleBuyOrderItem() {
	}

	public SingleBuyOrderItem(Integer orderid, Integer userid, Integer itemid, String itemname, Integer itemprice,
			Integer quantity, String orderstatus) {
		this.orderid = orderid;
		this.userid = userid;
		this.itemid = itemid;
		this.itemname = itemname;
		this.itemprice = itemprice;
		this.quantity = quantity;
		this.orderstatus = orderstatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public Integer getItemprice() {
		return itemprice;
	}

	public void setItemprice(Integer itemprice) {
		this.itemprice = itemprice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getOrderstatus() {
		return orderstatus;
	}

	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	
}
