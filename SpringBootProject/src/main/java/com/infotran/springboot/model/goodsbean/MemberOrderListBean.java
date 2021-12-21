package com.infotran.springboot.model.goodsbean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orderitemfinishtable")
public class MemberOrderListBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderlistid;
	
	private String orderitemtype;
	
	private String orderitemname;
	
	private Integer orderitemsingleprice;
	
	private Integer orderitemtotalcount;
	
	private Integer orderitemsumprice;
	
	private String orderitemusername;
	
	private String orderitemfinishdate;
	
	private String goodsuploadusername;
	
	private String orderuseraddress;
	
	private String goodstransationstatus;
	
	private String goodsscope;

	public MemberOrderListBean() {
		
	}

	
	public MemberOrderListBean(Integer orderlistid, String orderitemtype, String orderitemname,
			Integer orderitemsingleprice, Integer orderitemtotalcount, Integer orderitemsumprice,
			String orderitemusername, String orderitemfinishdate, String goodsuploadusername, String orderuseraddress,
			String goodstransationstatus) {
		this.orderlistid = orderlistid;
		this.orderitemtype = orderitemtype;
		this.orderitemname = orderitemname;
		this.orderitemsingleprice = orderitemsingleprice;
		this.orderitemtotalcount = orderitemtotalcount;
		this.orderitemsumprice = orderitemsumprice;
		this.orderitemusername = orderitemusername;
		this.orderitemfinishdate = orderitemfinishdate;
		this.goodsuploadusername = goodsuploadusername;
		this.orderuseraddress = orderuseraddress;
		this.goodstransationstatus = goodstransationstatus;
	}







	public Integer getOrderlistid() {
		return orderlistid;
	}

	public void setOrderlistid(Integer orderlistid) {
		this.orderlistid = orderlistid;
	}

	public String getOrderitemtype() {
		return orderitemtype;
	}

	public void setOrderitemtype(String orderitemtype) {
		this.orderitemtype = orderitemtype;
	}

	public String getOrderitemname() {
		return orderitemname;
	}

	public void setOrderitemname(String orderitemname) {
		this.orderitemname = orderitemname;
	}

	public Integer getOrderitemsingleprice() {
		return orderitemsingleprice;
	}

	public void setOrderitemsingleprice(Integer orderitemsingleprice) {
		this.orderitemsingleprice = orderitemsingleprice;
	}

	public Integer getOrderitemtotalcount() {
		return orderitemtotalcount;
	}

	public void setOrderitemtotalcount(Integer orderitemtotalcount) {
		this.orderitemtotalcount = orderitemtotalcount;
	}

	public Integer getOrderitemsumprice() {
		return orderitemsumprice;
	}

	public void setOrderitemsumprice(Integer orderitemsumprice) {
		this.orderitemsumprice = orderitemsumprice;
	}

	public String getOrderitemusername() {
		return orderitemusername;
	}

	public void setOrderitemusername(String orderitemusername) {
		this.orderitemusername = orderitemusername;
	}

	public String getOrderitemfinishdate() {
		return orderitemfinishdate;
	}

	public void setOrderitemfinishdate(String orderitemfinishdate) {
		this.orderitemfinishdate = orderitemfinishdate;
	}



	public String getGoodsuploadusername() {
		return goodsuploadusername;
	}



	public void setGoodsuploadusername(String goodsuploadusername) {
		this.goodsuploadusername = goodsuploadusername;
	}



	public String getOrderuseraddress() {
		return orderuseraddress;
	}



	public void setOrderuseraddress(String orderuseraddress) {
		this.orderuseraddress = orderuseraddress;
	}


	public String getGoodstransationstatus() {
		return goodstransationstatus;
	}


	public void setGoodstransationstatus(String goodstransationstatus) {
		this.goodstransationstatus = goodstransationstatus;
	}


	public String getGoodsscope() {
		return goodsscope;
	}


	public void setGoodsscope(String goodsscope) {
		this.goodsscope = goodsscope;
	}
	
	
	
	
}
