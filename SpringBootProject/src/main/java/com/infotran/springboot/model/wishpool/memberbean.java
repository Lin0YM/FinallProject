package com.infotran.springboot.model.wishpool;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "memberbean")
public class memberbean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer 			memberId;
	private String 				username;
	
	@Transient @Column(name = "memberId")
	private int stockid;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "wishpoolId")
	private WishPoolBean wishpool;
	
	public memberbean() {
		super();
	}

	public memberbean(Integer memberId, String username, WishPoolBean wishpool) {
		super();
		this.memberId = memberId;
		this.username = username;
		this.wishpool = wishpool;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public WishPoolBean getwishpool() {
		return wishpool;
	}

	public void setwishpool(WishPoolBean wishpool) {
		this.wishpool = wishpool;
	}


}
