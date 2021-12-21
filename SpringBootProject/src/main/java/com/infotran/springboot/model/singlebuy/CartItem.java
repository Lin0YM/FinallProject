package com.infotran.springboot.model.singlebuy;

public class CartItem {
	
	private int itemId;
	private int quantity;
	private SingleBuyItem singleBuyItem;
	
	public CartItem() {
	}
	
	public CartItem(int itemId, int quantity, SingleBuyItem singleBuyItem) {
		this.itemId = itemId;
		this.quantity = quantity;
		this.singleBuyItem = singleBuyItem;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public SingleBuyItem getSingleBuyItem() {
		return singleBuyItem;
	}

	public void setSingleBuyItem(SingleBuyItem singleBuyItem) {
		this.singleBuyItem = singleBuyItem;
	}
	
}
