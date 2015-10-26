package soul.mypage.model;

import java.sql.Timestamp;

public class BasketVo {
	
	private int basket_no;
	private String mem_id;
	private String item_name;
	private int item_price;
	private Timestamp item_date;
	private String item_op1;
	private String item_op2;
	private int item_count;
	private String item_id;
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public Timestamp getItem_date() {
		return item_date;
	}
	public void setItem_date(Timestamp item_date) {
		this.item_date = item_date;
	}
	public String getItem_op1() {
		return item_op1;
	}
	public void setItem_op1(String item_op1) {
		this.item_op1 = item_op1;
	}
	public String getItem_op2() {
		return item_op2;
	}
	public void setItem_op2(String item_op2) {
		this.item_op2 = item_op2;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	
	
}
