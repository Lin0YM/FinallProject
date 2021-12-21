package com.infotran.springboot.dao;

import java.util.List;

import com.infotran.springboot.model.member.*;

public interface MemberDao {
	
		//新增
		 public String insert(Member member);

		//ID查詢
		 public List<Member> selectById(Integer id);

		//總查詢
		 public List<Member> selectAll();

		//更新
		 public String update(Member member);

		//刪除
		 public String deleteById(Integer id);
		 
		//身分驗證
		 public Member validate (String username, String password);
		 
		//帳戶驗證
		 public boolean usernameCheck(String username);
		 
		//忘記密碼驗證
		 public Member forgetPasswordCheck(String username,String emailaddress);
		 
		//帳戶驗證(回傳資料)
		 public List<Member> selectByUsername(String username);
}
