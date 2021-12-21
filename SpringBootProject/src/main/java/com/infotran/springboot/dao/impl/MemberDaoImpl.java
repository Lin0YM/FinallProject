package com.infotran.springboot.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.dao.MemberDao;
import com.infotran.springboot.model.member.*;

@Repository
public class MemberDaoImpl implements MemberDao{
//	SessionFactory factory;
//	
//	@Autowired
//	public MemberDaoImpl(SessionFactory factory) {
//		this.factory = factory;
//	}
	
	private Session session;
	
	@Autowired
	MemberDaoImpl(Session session) {
	this.session = session;
	}
	
	@Override
	public String insert(Member member) {
//		Session session = factory.getCurrentSession();
		Query<Member> query3 = session.createQuery("from Member where username=:musername", Member.class);
		query3.setParameter("musername", member.getUsername());
		Member resultBean2 = query3.uniqueResult();
		String result;
		if(resultBean2==null) {
			session.save(member);
			result = "Data entered successfully!!";
		}else {
			result = "username already existed";
		}
		return result;
	}
	@Override
	public List<Member> selectById(Integer id) {
		List<Member> members = new ArrayList<>();
//		Session session = factory.getCurrentSession();
		Member member2 = session.get(Member.class, id);
		if(member2!=null) {
			members.add(member2);
			System.out.println("查詢成功");
			return members ;
		}else {
			System.out.println("查無此Id");
			return null;
		}
	}
	
	@Override
	public List<Member> selectAll() {
//		Session session = factory.getCurrentSession();
		Query<Member> query = session.createQuery("from Member", Member.class);
		List<Member> resultList = query.list();
		return resultList;
	}
	@Override
	public String update(Member member) {
//		Session session = factory.getCurrentSession();
		Member resultBean = session.get(Member.class, member.getId());
		String result ;
		
		if(resultBean!=null) {
			resultBean.setUsername(member.getUsername());
			resultBean.setPassword(member.getPassword());
			resultBean.setName(member.getName());
			resultBean.setSex(member.getSex());
			resultBean.setPhonenumber(member.getPhonenumber());
			resultBean.setEmailaddress(member.getEmailaddress());
			resultBean.setAddress(member.getAddress());
			resultBean.setStatus(member.getStatus());
			resultBean.setAct_level(member.getAct_level());
			resultBean.setRegisterTime(member.getRegisterTime());
			session.update(resultBean);
			result = "Data updated successfully!!";
		}else {
			result = "Data not updated";
			
		}
		return result;
	}
	@Override
	public String deleteById(Integer id) {
//		Session session = factory.getCurrentSession();
		Member resultBean = session.get(Member.class, id);
		String result; 
		if(resultBean!=null) {
			session.delete(resultBean);
			result = "Data deleted successfully!!";
		}else {
			result = "Data not deleted";
		}
		return result;
	}
	@Override
	public Member validate(String username, String password) {
//		Session session = factory.getCurrentSession();
		Query<Member> query3 = session.createQuery("from Member where username=:musername and password=:mpassword", Member.class);
		query3.setParameter("musername", username);
		query3.setParameter("mpassword", password);
		Member resultBean2 = query3.uniqueResult();
		if(resultBean2!=null) {
			return resultBean2;
		}else {
			System.out.println("No Result2");
			return null;
		}
	}

	@Override
	public boolean usernameCheck(String username) {
//		Session session = factory.getCurrentSession(); 
		String hql = "from Member where username=:user"; 
		Query<Member> query = session.createQuery(hql, Member.class); 
		query.setParameter("user", username); 
		Member result = query.uniqueResult(); 
		if(result!=null) {     
			return true; 
		} 
		return false; 
	}
	@Override
	public List<Member> selectByUsername(String username) {
		List<Member> members = new ArrayList<>();
//		Session session = factory.getCurrentSession(); 
		String hql = "from Member where username=:user"; 
		Query<Member> query = session.createQuery(hql, Member.class); 
		query.setParameter("user", username); 
		Member result = query.uniqueResult(); 
		if(result!=null) { 
			members.add(result);
			return members ; 
		} 
		return null; 
	}
	
	@Override
	public Member forgetPasswordCheck(String username,String emailaddress) {
//		Session session = factory.getCurrentSession();
		String hql = "from Member where username=:user and emailaddress=:emailaddress"; 
		Query<Member> query = session.createQuery(hql, Member.class); 
		query.setParameter("user", username); 
		query.setParameter("emailaddress", emailaddress); 
		Member result = query.uniqueResult(); 
		if(result!=null) {     
			return result; 
		} 
		return null; 
	}
}
