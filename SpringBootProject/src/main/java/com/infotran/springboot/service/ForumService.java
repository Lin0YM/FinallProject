package com.infotran.springboot.service;

import java.util.List;
import java.util.Optional;

import com.infotran.springboot.model.forum.Forum;

//呼叫Dao服務做事,例如經紀人與藝人關係,只有說明，沒有實作方法

public interface ForumService {
	List<Forum> getAllForum();
	void savaForum(Forum forum);
	Forum getForumById(long id);
	void deleteForumById(long id);	
	Forum insert(Forum forum);
	Optional<Forum> ForumById(long id);
	public Forum getProductById(long id);

}
