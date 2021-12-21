package com.infotran.springboot.model.wishpool;

import java.sql.Blob;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "wishpool")
public class WishPoolBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer 		wishpoolId;
	private String 			title;
	private String 			content;
	private String 			fileName;
	private Blob   			coverImage;
	@Transient
	private MultipartFile 	productImage;
		
	private String  		sort;
	private Integer  		supportting;
	private Integer  		endsupport;
	private String 			creator;
	private Date 			createtime;
	private Date	 		stoptime;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "wishpool", cascade = CascadeType.ALL)
	private Set<memberbean> memberBeans = new HashSet<memberbean>(0);

	public WishPoolBean() {
		super();
	}

	public WishPoolBean(String title, String content, String fileName, Blob coverImage, String sort,
			Integer supportting, Integer endsupport, String creator, Date createtime, Date stoptime,
			Set<memberbean> memberBeans) {
		super();
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.coverImage = coverImage;
		this.sort = sort;
		this.supportting = supportting;
		this.endsupport = endsupport;
		this.creator = creator;
		this.createtime = createtime;
		this.stoptime = stoptime;
		this.memberBeans = memberBeans;
	}

	public WishPoolBean(Integer wishpoolId, String title, String content, String fileName, Blob coverImage, String sort,
			Integer supportting, Integer endsupport, String creator, Date createtime, Date stoptime,
			Set<memberbean> memberBeans) {
		super();
		this.wishpoolId = wishpoolId;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.coverImage = coverImage;
		this.sort = sort;
		this.supportting = supportting;
		this.endsupport = endsupport;
		this.creator = creator;
		this.createtime = createtime;
		this.stoptime = stoptime;
		this.memberBeans = memberBeans;
	}

	public Integer getWishpoolId() {
		return wishpoolId;
	}

	public void setWishpoolId(Integer wishpoolId) {
		this.wishpoolId = wishpoolId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Integer getSupportting() {
		return supportting;
	}

	public void setSupportting(Integer supportting) {
		this.supportting = supportting;
	}

	public Integer getEndsupport() {
		return endsupport;
	}

	public void setEndsupport(Integer endsupport) {
		this.endsupport = endsupport;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getStoptime() {
		return stoptime;
	}

	public void setStoptime(Date stoptime) {
		this.stoptime = stoptime;
	}

	public Set<memberbean> getMemberBeans() {
		return memberBeans;
	}

	public void setMemberBeans(Set<memberbean> memberBeans) {
		this.memberBeans = memberBeans;
	}
	

}