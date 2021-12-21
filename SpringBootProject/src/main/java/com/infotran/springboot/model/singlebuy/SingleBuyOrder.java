package com.infotran.springboot.model.singlebuy;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="singlebuyorder")
public class SingleBuyOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderid;
	
	private Integer userid;
	private String paymentmethod;
	private String deliverymethod;
	private String name;
	private String phonenumber;
	private String address;
	private Integer itemtotalprice;
	private Integer deliveryfee;
	private Integer totalprice;
	private String orderTime;
	private String cancelstatus;
	
	public SingleBuyOrder() {
	}

	public SingleBuyOrder(Integer userid, String paymentmethod, String deliverymethod, String name, String phonenumber,
			String address, Integer itemtotalprice, Integer deliveryfee, Integer totalprice, String orderTime,
			String cancelstatus) {
		this.userid = userid;
		this.paymentmethod = paymentmethod;
		this.deliverymethod = deliverymethod;
		this.name = name;
		this.phonenumber = phonenumber;
		this.address = address;
		this.itemtotalprice = itemtotalprice;
		this.deliveryfee = deliveryfee;
		this.totalprice = totalprice;
		this.orderTime = orderTime;
		this.cancelstatus = cancelstatus;
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

	public String getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(String paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public String getDeliverymethod() {
		return deliverymethod;
	}

	public void setDeliverymethod(String deliverymethod) {
		this.deliverymethod = deliverymethod;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getItemtotalprice() {
		return itemtotalprice;
	}

	public void setItemtotalprice(Integer itemtotalprice) {
		this.itemtotalprice = itemtotalprice;
	}

	public Integer getDeliveryfee() {
		return deliveryfee;
	}

	public void setDeliveryfee(Integer deliveryfee) {
		this.deliveryfee = deliveryfee;
	}

	public Integer getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}

	public String getCancelstatus() {
		return cancelstatus;
	}

	public void setCancelstatus(String cancelstatus) {
		this.cancelstatus = cancelstatus;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	
}
