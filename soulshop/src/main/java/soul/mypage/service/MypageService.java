package soul.mypage.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import soul.main.model.Member;
import soul.mypage.model.BasketVo;
import soul.mypage.model.OderItemVo;
import soul.mypage.model.OrderListVo;
import soul.mypage.model.OrderVo;

public interface MypageService {
	/**************회원 정보 수정 메소드*************/
	public Member getMember(String id)throws Exception;
	
	public void updateMember(Member member);
	
	/**************장바구니 메소드*************/
	public List<BasketVo> getBasketList(String mem_id);
	public void insertBasketItem(BasketVo basket);
	public void deleteBasketItem(List<String> basket_no);

	public List<OderItemVo> getOderItemList(List<String> basket_no,HttpSession session);

	public void insertOrderList(OrderListVo orderList, Member member);

	public List<OrderVo> getOrderList(String shop_mem_id);

	public List<OderItemVo> exchangeFromView(BasketVo basket, String item_img, HttpSession session);
}
