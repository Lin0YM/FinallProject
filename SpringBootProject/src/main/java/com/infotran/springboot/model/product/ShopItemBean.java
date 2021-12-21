package com.infotran.springboot.model.product;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="shopitem")
public class ShopItemBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;

	@Column(name="SHOP_NAME")
	private String shopname;
	
	@Column(name="SHOP_ITEM")
	private String shopitem;
	
	@Column(name="ITEM_INTRO")
	private String itemintro;
	
	@Column(name="ITEM_PRICE")
	private Integer itemprice;
	
	@Column(name="PRICE_UNIT")
	private String priceunit;
	
	@Column(name="ITEM_IMG")
	private Blob itemimg;

	public ShopItemBean(String shopname, String shopitem, String itemintro, Integer itemprice, String priceunit) {
		this.shopname = shopname;
		this.shopitem = shopitem;
		this.itemintro = itemintro;
		this.itemprice = itemprice;
		this.priceunit = priceunit;
	}

	public ShopItemBean(String shopname, String shopitem, String itemintro, Integer itemprice, String priceunit,
			Blob itemimg) {
		this.shopname = shopname;
		this.shopitem = shopitem;
		this.itemintro = itemintro;
		this.itemprice = itemprice;
		this.priceunit = priceunit;
		this.itemimg = itemimg;
	}
	
	public ShopItemBean() {
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

	public String getShopitem() {
		return shopitem;
	}

	public void setShopitem(String shopitem) {
		this.shopitem = shopitem;
	}

	public String getItemintro() {
		return itemintro;
	}

	public void setItemintro(String itemintro) {
		this.itemintro = itemintro;
	}

	public Integer getItemprice() {
		return itemprice;
	}

	public void setItemprice(Integer itemprice) {
		this.itemprice = itemprice;
	}

	public String getPriceunit() {
		return priceunit;
	}

	public void setPriceunit(String priceunit) {
		this.priceunit = priceunit;
	}

	public Blob getItemimg() {
		return itemimg;
	}

	public void setItemimg(Blob itemimg) {
		this.itemimg = itemimg;
	}
	
}
