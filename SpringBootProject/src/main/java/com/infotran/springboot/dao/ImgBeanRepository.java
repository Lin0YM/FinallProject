package com.infotran.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infotran.springboot.model.goodsbean.ImageBean;

public interface ImgBeanRepository extends JpaRepository<ImageBean, Integer> {

}
