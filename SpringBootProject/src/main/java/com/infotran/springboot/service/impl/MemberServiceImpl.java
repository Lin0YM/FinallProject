package com.infotran.springboot.service.impl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infotran.springboot.dao.MemberDao;
import com.infotran.springboot.model.member.*;
import com.infotran.springboot.service.MemberService;
@Transactional
@Service
public class MemberServiceImpl implements MemberService {

	SessionFactory factory;
	MemberDao memberDao;
	
	
	@Autowired
	public MemberServiceImpl(SessionFactory factory, MemberDao memberDao) {
		this.factory = factory;
		this.memberDao = memberDao;
	}
	@Override
	public String insert(Member member) {
		return memberDao.insert(member);
	}
	@Override
	public List<Member> selectById(Integer id) {
		return memberDao.selectById(id);
	}
	@Override
	public List<Member> selectAll() {
		return memberDao.selectAll();
	}
	@Override
	public String update(Member member) {
		return memberDao.update(member);
	}
	@Override
	public String deleteById(Integer id) {
		return memberDao.deleteById(id);
	}
	@Override
	public Member validate(String username, String password) {
		return memberDao.validate(username,password);
	}
	@Override
	public boolean usernameCheck(String username) {
		return memberDao.usernameCheck(username);
	}
	@Override
	public Member forgetPasswordCheck(String username, String emailaddress) {
		return memberDao.forgetPasswordCheck(username, emailaddress);
	}
	@Override
	public List<Member> selectByUsername(String username) {
		return memberDao.selectByUsername(username);
	}

}
