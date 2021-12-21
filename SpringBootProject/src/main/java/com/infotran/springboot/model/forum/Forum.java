package com.infotran.springboot.model.forum;

import java.sql.Blob;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

	@Entity //給hibernate抓//
	@Table(name = "forum") //給hibernate抓，在database創建table//
	public class Forum{ //Bean
		
		@Id  //設定此為主鍵//
		@GeneratedValue(strategy =  GenerationType.IDENTITY) //主鍵自動增加//
		private long id;
		
		private String category;
		
		private long count;
		
		private String theme;
		
		private String article;
		
		private String date;
		
		private String lastdate;
		
		private Blob imageData;
		
		@Transient
		private MultipartFile forumpic;
		
		private String fileName;

		@OneToMany(mappedBy = "forum",fetch = FetchType.EAGER)
		private List<Reply> replyList;
		

		public List<Reply> getReplyList() {
			return replyList;
		}

		public void setReplyList(List<Reply> replyList) {
			this.replyList = replyList;
		}

		public String getLastdate() {
			return lastdate;
		}

		public void setLastdate(String lastdate) {
			this.lastdate = lastdate;
		}

		public Blob getImageData() {
			return imageData;
		}

		public void setImageData(Blob imageData) {
			this.imageData = imageData;
		}

		public MultipartFile getForumpic() {
			return forumpic;
		}

		public void setForumpic(MultipartFile forumpic) {
			this.forumpic = forumpic;
		}

		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}
		
		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getTheme() {
			return theme;
		}

		public void setTheme(String theme) {
			this.theme = theme;
		}

		public String getArticle() {
			return article;
		}

		public void setArticle(String article) {
			this.article = article;
		}

		public long getCount() {
			return count;
		}

		public void setCount(long count) {
			this.count = count;
		}
		
		
		
		
}
