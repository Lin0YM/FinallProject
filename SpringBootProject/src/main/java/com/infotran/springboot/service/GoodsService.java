package com.infotran.springboot.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.infotran.springboot.model.goodsbean.GoodsBean;
import com.infotran.springboot.model.goodsbean.ImageBean;
import com.infotran.springboot.model.goodsbean.MemberOrderListBean;
import com.infotran.springboot.model.goodsbean.OrderItemGoodsBean;



public interface GoodsService {

	GoodsBean insert(GoodsBean gBean);
	
	Optional<GoodsBean> goodById(Integer id);
	
	 List<GoodsBean> findAllGoods();
	 
	 void updategood(GoodsBean bean);
	 
	 void deletegood(Integer id);
	 
	 List<GoodsBean> findUploadByMember(String uploadmember);

	 
	//=======================Restful=============================
	 
		 GoodsBean addgood(GoodsBean gb);
			
		 GoodsBean update(GoodsBean gb);
		
		 void delete(GoodsBean gb);
		 
		//=====================ajax============================
		 
		 Optional<GoodsBean> checkgoods(GoodsBean gb);
	//========================shopcarhistory==================
		 void shopCarAddGoods(String membername,Map<Long, OrderItemGoodsBean> odrin , String shopDate);
	
		 void ordergoodsin(List<OrderItemGoodsBean> list,String username);
		 
		 List<MemberOrderListBean> findByOrderitemusername(String orderitemusername);
	//=======================findbytype=======================
		 
		 List<GoodsBean> findByGoodsType(String goodsType);
		 
	//======================goodsordercheck==================
		 List<MemberOrderListBean> findByGoodsuploadusername(String goodsuploadusername);
	
	//======================changeorderstatusconfirm=========
		 Optional<MemberOrderListBean> changeOrderGoodsById(Integer id);
		 
		 MemberOrderListBean confirmorcancel(MemberOrderListBean bean);
		 
	//============================賣家評價功能==============================
		 
		 Optional<MemberOrderListBean> scopeById(Integer id);
		 
		 List<MemberOrderListBean> findAllScope();
		 
	//===========================管理員搜尋上架商品列表======================
		 
		 List<GoodsBean> findAllMemberUpload();
		 
	
	//==========================================管理員查詢下訂商品列表==============================
		 List<MemberOrderListBean> findAllgoodsorderlist();	
			
		 void deleteOrderRecord(Integer id);
	
		 List<MemberOrderListBean> findByGoodsscope(String goodsscope);
	//==========================================管理員新增圖片==================================
		 ImageBean addimg(ImageBean ib);
		 
	//=========================================資料庫抓圖片====================================
		 public Optional<ImageBean> getPictureById(Integer id);
		 
}