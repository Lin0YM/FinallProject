package com.infotran.springboot.model.singlebuy;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="singlebuyitem")
public class SingleBuyItem implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemid;
	
	private String classification;
	private String itemname;
	private String itemintro;
	private Integer itemprice;
	private String priceunit;
	private Blob itemimg;
	
	public SingleBuyItem() {
	}

	public SingleBuyItem(String classification, String itemname, String itemintro, Integer itemprice, String priceunit,
			Blob itemimg) {
		this.classification = classification;
		this.itemname = itemname;
		this.itemintro = itemintro;
		this.itemprice = itemprice;
		this.priceunit = priceunit;
		this.itemimg = itemimg;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
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
