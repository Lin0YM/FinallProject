package com.infotran.springboot.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotran.springboot.dao.ForumRepository;
import com.infotran.springboot.model.forum.Forum;
import com.infotran.springboot.service.ForumService;


@Service  //通常放在impl,讓spring boot去判別這個是service
public class ForumServiceImpl implements ForumService  {  //spring透過介面(Service)操作介面做事,Service介面是呼叫Impl實際操作方式，使用Impl是方便Override

	@Autowired // 從ForumRepository創建forumRepository(算是Impl別名)實例，用@Autowired抓取Dao(Repository CRUD)注入forumRepository
	private ForumRepository forumRepository; //有幾個table就有幾個"BeanForumRepository1 forumRepository1/BeanForumRepository2 forumRepository2"
	
	@Transactional
	@Override
	public Forum getProductById(long id) {
		return forumRepository.getById(id);
	}
	
	
	@Override
	@Transactional
	public Optional<Forum> ForumById(long id) {
		return forumRepository.findById(id);
		
	}
	
	@Override
	public List<Forum> getAllForum() {
		return forumRepository.findAll();
	}

	@Override
	public void savaForum(Forum forum) {
		this.forumRepository.save(forum);
		
	}
	
	@Override
	@Transactional
	public Forum insert(Forum forum) {
		return forumRepository.save(forum);
	}
	

	@Override
	public Forum getForumById(long id) {
		Optional<Forum> optional = forumRepository.findById(id);
		Forum forum = null;
		if(optional.isPresent()) {
			forum = optional.get();
		}else {
			throw new RuntimeException("Forum not found for id ::" + id);
		}
		return forum;
		
	}

	@Override
	public void deleteForumById(long id) {
		this.forumRepository.deleteById(id);
		
	}

}
