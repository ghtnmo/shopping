package model;

public class ItemBean {
	private int item_code;
	private String item_title;
	private int item_price;
	private int item_discount;
	private int item_stock;
	//아이템설명은 이미지 외래키로, 이미지테이블의 code값을 가짐 
	private String item_description;
	private String item_thumbnail;
	private String item_cdate;
	
	public ItemBean() {}
	
	public ItemBean(String item_title, int item_price, int item_discount, int item_stock, String item_description,String item_thumbnail) {
		super();
		this.item_title = item_title;
		this.item_price = item_price;
		this.item_discount = item_discount;
		this.item_stock = item_stock;
		this.item_description = item_description;
		this.item_thumbnail = item_thumbnail;
	}
	
	
	public String getItem_thumbnail() {
		return item_thumbnail;
	}


	public void setItem_thumbnail(String item_thumbnail) {
		this.item_thumbnail = item_thumbnail;
	}


	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_discount() {
		return item_discount;
	}
	public void setItem_discount(int item_discount) {
		this.item_discount = item_discount;
	}
	public int getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	public String getItem_description() {
		return item_description;
	}
	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}
	public String getItem_cdate() {
		return item_cdate;
	}
	public void setItem_cdate(String item_cdate) {
		this.item_cdate = item_cdate;
	}
	
	
}