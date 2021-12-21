package com.infotran.springboot.model.goodsbean;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@Entity@Table(name = "imagebean")
public class ImageBean {
	
	@Id@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Transient
	private MultipartFile goodpic;
	

	private Blob imageStream;
	
	private String fileName;
	
	
	public ImageBean() {

	}

	
	public ImageBean(Integer id, Blob imageStream) {
		super();
		this.id = id;
		this.imageStream = imageStream;
	}
	
	

	public ImageBean(Integer id, MultipartFile goodpic, Blob imageStream, String fileName) {
		super();
		this.id = id;
		this.goodpic = goodpic;
		this.imageStream = imageStream;
		this.fileName = fileName;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Blob getImageStream() {
		return imageStream;
	}

	public void setImageStream(Blob imageStream) {
		this.imageStream = imageStream;
	}
	
	
	public MultipartFile getGoodpic() {
		return goodpic;
	}
	
	public void setGoodpic(MultipartFile goodpic) {
		this.goodpic = goodpic;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
}
