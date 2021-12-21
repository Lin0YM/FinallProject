package com.infotran.springboot.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotran.springboot.dao.GoodsBeanRepository;
import com.infotran.springboot.dao.ImgBeanRepository;
import com.infotran.springboot.dao.MemberOrderListBeanRepository;
import com.infotran.springboot.dao.OrderGoodsBeanRepository;
import com.infotran.springboot.dao.OrderItemGoodsBeanRepository;
import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.ImageBean;
import com.infotran.springboot.model.goodsbean.MemberOrderListBean;
import com.infotran.springboot.model.goodsbean.OrderGoodsBean;
import com.infotran.springboot.model.goodsbean.OrderItemGoodsBean;
import com.infotran.springboot.service.GoodsService;




@Service
public class GoodsServiceImpl implements GoodsService {

	private SessionFactory factory;
	GoodsBeanRepository goodsbeanDao;
	OrderGoodsBeanRepository ordergoodsbeanDao;
	OrderItemGoodsBeanRepository orderitemgoodsbeanDao;
	MemberOrderListBeanRepository memberOrderListBeanDao;
	ImgBeanRepository imgbeanDao;
	
	
	@Autowired
	public GoodsServiceImpl(SessionFactory factory, GoodsBeanRepository goodsbeanDao,
			OrderGoodsBeanRepository ordergoodsbeanDao,
			OrderItemGoodsBeanRepository orderitemgoodsbeanDao, MemberOrderListBeanRepository memberOrderListBeanDao,
			ImgBeanRepository imgbeanDao) {
		this.factory = factory;
		this.goodsbeanDao = goodsbeanDao;
		this.ordergoodsbeanDao = ordergoodsbeanDao;
		this.orderitemgoodsbeanDao = orderitemgoodsbeanDao;
		this.memberOrderListBeanDao = memberOrderListBeanDao;
		this.imgbeanDao=imgbeanDao;
	}

	@Override
	@Transactional
	public GoodsBean insert(GoodsBean gBean) {
		return goodsbeanDao.save(gBean);
	}
	



	@Override
	@Transactional
	public Optional<GoodsBean> goodById(Integer id) {
		return goodsbeanDao.findById(id);
		
	}
	
	@Override
	@Transactional
	public  List<GoodsBean> findAllGoods() {
		return goodsbeanDao.findAll();
	}
	
	@Override
	@Transactional
	public void updategood(GoodsBean bean) {
		goodsbeanDao.save(bean);
	}
	
	@Override
	@Transactional
	public void deletegood(Integer id) {
		goodsbeanDao.deleteById(id);
	}
	
	public List<GoodsBean> findUploadByMember(String uploadmember){
		return goodsbeanDao.findByUploadMember(uploadmember);
	}
	

	
	//=========================Restful======================
	@Transactional
	public GoodsBean addgood(GoodsBean gb) {
		return goodsbeanDao.save(gb);
	}
	@Transactional
	public GoodsBean update(GoodsBean gb) {
		return goodsbeanDao.save(gb);
	}
	@Transactional
	public void delete(GoodsBean gb) {
		goodsbeanDao.delete(gb);
	}
	@Transactional
	public Optional<GoodsBean> checkgoods(GoodsBean gb) {
		Integer id=gb.getid();
		return goodsbeanDao.findById(id);
		}
	
	//=========================shopcaradd===================
	@Transactional
	public void shopCarAddGoods(String username,Map<Long, OrderItemGoodsBean> odrin ,String shopDate) {
		
		
		OrderGoodsBean odrBean =new OrderGoodsBean();
		odrBean.setMemberName(username);
		odrBean.setOrderDate(shopDate);
		List<OrderItemGoodsBean> items = new LinkedList<OrderItemGoodsBean>();
		Double totalamount=0.0;
		
		for(Long ordercount :odrin.keySet()) {
			OrderItemGoodsBean itembean =new OrderItemGoodsBean();
			OrderItemGoodsBean odritmbean=odrin.get(ordercount);
			Integer goodssingleprice=odritmbean.getBean().getGoodsPrice();
			Integer odrgoodscount=odritmbean.getAllCount();
			String odrgoodsname = odritmbean.getBean().getGoodsName();
			String orderaddress = odritmbean.getOrderuseradress();
			itembean.setAllCount(odrgoodscount);
			itembean.setOrdergoodsname(odrgoodsname);
			itembean.setOrdergoodssingleprice(goodssingleprice);
			itembean.setOrderuseradress(orderaddress);
			totalamount+=odrgoodscount*goodssingleprice;
			itembean.setOrderGoodsBean(odrBean);
			items.add(itembean);
		}
		
		odrBean.setTotalAmount(totalamount);
		odrBean.setItems(items);
		
		ordergoodsbeanDao.save(odrBean);

	}
	
	@Transactional
	public void ordergoodsin(List<OrderItemGoodsBean> list,String username) {
		MemberOrderListBean listbean;
		for(OrderItemGoodsBean li : list) {
			listbean = new MemberOrderListBean();
			listbean.setOrderitemname(li.getBean().getGoodsName());
			listbean.setOrderitemsingleprice(li.getBean().getGoodsPrice());
			listbean.setOrderitemtype(li.getBean().getGoodsType());
			listbean.setOrderitemusername(username);
			listbean.setOrderitemtotalcount(li.getBean().getGoodsNum());
			listbean.setOrderitemsumprice(li.getBean().getGoodsPrice()*li.getBean().getGoodsNum());
			listbean.setGoodsuploadusername(li.getBean().getUploadMember());
			listbean.setOrderuseraddress(li.getOrderuseradress());
			listbean.setGoodstransationstatus("請等候賣家....");
			Date orderDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			listbean.setOrderitemfinishdate(sdf.format(orderDate));
			memberOrderListBeanDao.save(listbean);
		}
		
	}
	
	//========================ordergoodsfindbyusername==========================
	
	@Transactional
	public List<MemberOrderListBean> findByOrderitemusername(String orderitemusername){
		return memberOrderListBeanDao.findByOrderitemusername(orderitemusername);
	}
	
	//=======================findbytype=======================
	@Transactional
	public List<GoodsBean> findByGoodsType(String goodsType){
		return goodsbeanDao.findByGoodsType(goodsType);
	}
	
	
	//======================goodsordercheck==================
	@Transactional
	public List<MemberOrderListBean> findByGoodsuploadusername(String goodsuploadusername){
		return memberOrderListBeanDao.findByGoodsuploadusername(goodsuploadusername);	
	}
	
	//======================changeorderstatusconfirm or cancel=========
	@Transactional
	public Optional<MemberOrderListBean> changeOrderGoodsById(Integer id) {
		return memberOrderListBeanDao.findById(id);
	}
	
	@Transactional
	public MemberOrderListBean confirmorcancel(MemberOrderListBean bean) {
		return memberOrderListBeanDao.save(bean);
		
	}
	
	//============================賣家評價功能==============================
	
	@Transactional
	public Optional<MemberOrderListBean> scopeById(Integer id) {
		return memberOrderListBeanDao.findById(id);
	}
	
	@Transactional
	public List<MemberOrderListBean> findAllScope(){
		return memberOrderListBeanDao.findAll();
		
	}
	
	//===========================管理員搜尋上架商品列表======================
	
	@Transactional
	public List<GoodsBean> findAllMemberUpload(){
		return goodsbeanDao.findAll();
	}
	
	
	//==========================================管理員查詢下訂商品列表==============================
	@Transactional
	public List<MemberOrderListBean> findAllgoodsorderlist(){
		return memberOrderListBeanDao.findAll();
	}
	
	@Transactional
	public void deleteOrderRecord(Integer id) {
		memberOrderListBeanDao.deleteById(id);
	}
	
	@Transactional
	public List<MemberOrderListBean> findByGoodsscope(String goodsscope){
		return memberOrderListBeanDao.findByGoodsscope(goodsscope);
		
	}
	
	//=========================================管理員新增圖片====================================
	@Transactional
	public ImageBean addimg(ImageBean ib) {
		return imgbeanDao.save(ib);
		
	}
	
	//=========================================資料庫取圖片====================================
	
	@Transactional
	public Optional<ImageBean> getPictureById(Integer id) {
		return imgbeanDao.findById(id);
		
	}
	
}	
