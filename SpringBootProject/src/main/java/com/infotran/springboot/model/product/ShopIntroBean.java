package com.infotran.springboot.model.product;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="shopintro")
public class ShopIntroBean {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	
	@Column(name="SHOP_NAME")
	private String shopname;
	
	@Column(name="SHOP_INTRO")
	private String shopintro;
	
	@Column(name="SHOP_IMG")
	private Blob shopimg;

	public ShopIntroBean(String shopname, String shopintro) {
		this.shopname = shopname;
		this.shopintro = shopintro;
	}

	public ShopIntroBean(String shopname, String shopintro, Blob shopimg) {
		this.shopname = shopname;
		this.shopintro = shopintro;
		this.shopimg = shopimg;
	}
	
	public ShopIntroBean() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShopintro() {
		return shopintro;
	}

	public void setShopintro(String shopintro) {
		this.shopintro = shopintro;
	}

	public Blob getShopimg() {
		return shopimg;
	}

	public void setShopimg(Blob shopimg) {
		this.shopimg = shopimg;
	}
	
}
