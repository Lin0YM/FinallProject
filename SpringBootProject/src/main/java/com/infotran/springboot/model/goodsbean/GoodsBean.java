package com.infotran.springboot.model.goodsbean;



import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import javassist.SerialVersionUID;

@Entity@Table(name = "buyitem")
public class GoodsBean{
	
	
	@Id@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	private String goodsType;
	
	
	private String goodsName;
	
	
	private Integer goodsPrice;
	
	
	private String goodsInt;
	
	
	private Integer goodsNum;
	
	
	private Integer sumPrice;
	
	
	private Blob imageData;
	
	@Transient
	private MultipartFile goodpic;
	
	
	private String fileName;
	
	private String uploadMember;
	
	public GoodsBean() {
		
	}


	public GoodsBean(Integer id, String goodsType, String goodsName, Integer goodsPrice, String goodsInt,
			Integer goodsNum, Integer sumPrice, Blob imageData, MultipartFile goodpic, String fileName,
			String uploadMember) {

		this.id = id;
		this.goodsType = goodsType;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsInt = goodsInt;
		this.goodsNum = goodsNum;
		this.sumPrice = sumPrice;
		this.imageData = imageData;
		this.goodpic = goodpic;
		this.fileName = fileName;
		this.uploadMember = uploadMember;
	}







	public MultipartFile getGoodpic() {
		return goodpic;
	}

	public void setGoodpic(MultipartFile goodpic) {
		this.goodpic = goodpic;
	}

	public Integer getid() {
		return id;
	}

	public void setid(Integer id) {
		this.id = id;
	}

	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Integer goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsInt() {
		return goodsInt;
	}

	public void setGoodsInt(String goodsInt) {
		this.goodsInt = goodsInt;
	}

	public Integer getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	public Integer getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(Integer sumPrice) {
		this.sumPrice = sumPrice;
	}

	public Blob getImageData() {
		return imageData;
	}

	public void setImageData(Blob imageData) {
		this.imageData = imageData;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getUploadMember() {
		return uploadMember;
	}


	public void setUploadMember(String uploadMember) {
		this.uploadMember = uploadMember;
	}


	
	
	
	
	



	
	
	
	
	
	
}
