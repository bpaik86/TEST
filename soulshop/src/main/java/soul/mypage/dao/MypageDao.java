package soul.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soul.main.model.Member;
import soul.mypage.model.BasketVo;
import soul.mypage.model.OrderVo;

@Repository("mypageDao")
public class MypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**************장바구니 메소드*************/
	public List<BasketVo> getBasketList(String mem_id) {
		
		return sqlSessionTemplate.selectList("mypage.getBasketList", mem_id);
	}
	public BasketVo getBasket(int basket_no){//주문페이지를 위해
		
		return sqlSessionTemplate.selectOne("mypage.getBasket", basket_no);
	}
	public String getMainImgName(int item_id){
		return sqlSessionTemplate.selectOne("mypage.getMainImg", item_id);
	}
	public void insertBasketItem(BasketVo basket){
		sqlSessionTemplate.insert("mypage.insertBasketItem", basket);
	}
	public void subItemCount(BasketVo basket){//수량 감소
		sqlSessionTemplate.update("mypage.subItemCount", basket);
	}
	public void deleteBasketItem(int basket_no) {

		sqlSessionTemplate.delete("mypage.deleteBasketItem",basket_no);
	}
	public void insertOrderList(OrderVo order) {
		
		sqlSessionTemplate.insert("mypage.insertOrderList", order);
	}
	public List<OrderVo> getOrderList(String shop_mem_id) {
		
		return sqlSessionTemplate.selectList("mypage.getOrderList", shop_mem_id);
	}	
	
}
