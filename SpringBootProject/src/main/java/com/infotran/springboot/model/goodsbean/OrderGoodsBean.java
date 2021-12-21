package com.infotran.springboot.model.goodsbean;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ordergoodsbean")
public class OrderGoodsBean {
	
	@Id@Column(name = "ordergoodsID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderGoodsID;
	
	private String memberName;
	
	private Double totalAmount;
	
	private String orderDate;
	
	@OneToMany(fetch = FetchType.LAZY , mappedBy = "orderGoodsBean" , cascade = CascadeType.ALL)
	private List<OrderItemGoodsBean> items = new LinkedList<OrderItemGoodsBean>();

	public OrderGoodsBean() {

	}

	

	public OrderGoodsBean(Integer orderGoodsID, String memberName, Double totalAmount, String orderDate,
			List<OrderItemGoodsBean> items) {
		super();
		this.orderGoodsID = orderGoodsID;
		this.memberName = memberName;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.items = items;
	}



	public Integer getOrderGoodsID() {
		return orderGoodsID;
	}

	public void setOrderGoodsID(Integer orderGoodsID) {
		this.orderGoodsID = orderGoodsID;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}



	public List<OrderItemGoodsBean> getItems() {
		return items;
	}



	public void setItems(List<OrderItemGoodsBean> items) {
		this.items = items;
	}

	
	
	
	
	
}
