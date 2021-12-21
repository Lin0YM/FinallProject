package com.infotran.springboot.model.forum;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

	@Entity //給hibernate抓//
	@Table(name = "Reply") //給hibernate抓，在database創建table//
	public class Reply{ //Bean
		
		@Id  //設定此為主鍵//
		@GeneratedValue(strategy =  GenerationType.IDENTITY) //主鍵自動增加//
		private Long replyId;
		
		private String replyArticle;
		
		private String replyDate;
		
		private String replyLastDate;
		
		@ManyToOne
		@JoinColumn(name="id")
		private Forum forum;
		

		public Forum getForum() {
			return forum;
		}

		public void setForum(Forum forum) {
			this.forum = forum;
		}

		public Long getReplyId() {
			return replyId;
		}

		public void setReplyId(Long replyId) {
			this.replyId = replyId;
		}

		public String getReplyArticle() {
			return replyArticle;
		}

		public void setReplyArticle(String replyArticle) {
			this.replyArticle = replyArticle;
		}

		public String getReplyDate() {
			return replyDate;
		}

		public void setReplyDate(String replyDate) {
			this.replyDate = replyDate;
		}

		public String getReplyLastDate() {
			return replyLastDate;
		}

		public void setReplyLastDate(String replyLastDate) {
			this.replyLastDate = replyLastDate;
		}
		
		

		
		
}
