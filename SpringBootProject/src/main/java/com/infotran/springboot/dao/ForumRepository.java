package com.infotran.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.forum.Forum;


//JpaRepository 自動產生CRUD簡易版 <Forum 抓Bean, Long 抓主鍵型態>//

@Repository  //讓Spring知道是Dao；將類識別為Bean 
public interface ForumRepository extends JpaRepository<Forum, Long>{

	//可增加HQL請它做事，使用SQL語法叫資料庫做事。
	//要改寫DAO請參考老師範例 Spring boot p.67
	//介面繼承用系統(JpaRepository)建立DAO(CRUD)類別
	
}
