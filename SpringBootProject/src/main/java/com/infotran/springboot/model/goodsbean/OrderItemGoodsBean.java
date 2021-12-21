package com.infotran.springboot.model.goodsbean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "orderitemgoodsbean")
public class OrderItemGoodsBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderItemNo;
	
	@Transient
	private GoodsBean bean;
	
	private String ordergoodsname;
	
	private Integer ordergoodssingleprice;
	
	private Integer allCount;
	
	private String orderuseradress;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ordergoodsID")
	private OrderGoodsBean orderGoodsBean;

	
	public OrderItemGoodsBean() {

	}
	
	
	

	public OrderItemGoodsBean(Integer orderItemNo, GoodsBean bean, Integer allCount , String orderuseradress) {
		this.orderItemNo = orderItemNo;
		this.bean = bean;
		this.allCount = allCount;
		this.orderuseradress = orderuseradress;
	}



	public OrderItemGoodsBean(Integer orderItemNo, GoodsBean bean, Integer ordergoodssingleprice, Integer allCount) {
		this.orderItemNo = orderItemNo;
		this.bean = bean;
		this.ordergoodssingleprice = ordergoodssingleprice;
		this.allCount = allCount;
	}




	public OrderItemGoodsBean(Integer orderItemNo, GoodsBean bean, String ordergoodsname, Integer ordergoodssingleprice,
			Integer allCount, OrderGoodsBean orderGoodsBean) {
		this.orderItemNo = orderItemNo;
		this.bean = bean;
		this.ordergoodsname = ordergoodsname;
		this.ordergoodssingleprice = ordergoodssingleprice;
		this.allCount = allCount;
		this.orderGoodsBean = orderGoodsBean;
	}




	public Integer getOrderItemNo() {
		return orderItemNo;
	}

	public void setOrderItemNo(Integer orderItemNo) {
		this.orderItemNo = orderItemNo;
	}

	public GoodsBean getBean() {
		return bean;
	}

	public void setBean(GoodsBean bean) {
		this.bean = bean;
	}

	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}

	public OrderGoodsBean getOrderGoodsBean() {
		return orderGoodsBean;
	}

	public void setOrderGoodsBean(OrderGoodsBean orderGoodsBean) {
		this.orderGoodsBean = orderGoodsBean;
	}




	public String getOrdergoodsname() {
		return ordergoodsname;
	}




	public void setOrdergoodsname(String ordergoodsname) {
		this.ordergoodsname = ordergoodsname;
	}




	public Integer getOrdergoodssingleprice() {
		return ordergoodssingleprice;
	}




	public void setOrdergoodssingleprice(Integer ordergoodssingleprice) {
		this.ordergoodssingleprice = ordergoodssingleprice;
	}




	public String getOrderuseradress() {
		return orderuseradress;
	}




	public void setOrderuseradress(String orderuseradress) {
		this.orderuseradress = orderuseradress;
	}
	
	
	
	
}
