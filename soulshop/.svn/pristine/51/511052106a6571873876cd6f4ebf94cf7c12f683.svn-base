package soul.mypage.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import soul.main.dao.MemberDao;
import soul.main.model.Member;
import soul.mypage.dao.MypageDao;
import soul.mypage.model.BasketVo;
import soul.mypage.model.OderItemVo;
import soul.mypage.model.OrderListVo;
import soul.mypage.model.OrderVo;

@Service("mypageServiceImpl")
public class MypageServiceImp implements MypageService {
	

	@Resource(name = "mypageDao")
	private MypageDao mypageDao;

	@Resource(name = "member1")
	private MemberDao memberDao;

	// 회원 정보 수정페이지에 보여질 데이터를 위한 데이터 뽑기
	public Member getMember(String id) throws Exception {

		return memberDao.select(id);
	}

	// 회원 정보 수정하기
	public void updateMember(Member member) {
		try {
			memberDao.memberAllUpdate(member);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BasketVo> getBasketList(String mem_id) {
		
		return mypageDao.getBasketList(mem_id);
	}
	
	@Override
	public void insertBasketItem(BasketVo basket) {
		mypageDao.insertBasketItem(basket);
		//mypageDao.subItemCount(basket);//아이템 수량 조절 이 녀석은 주문 페이지에 넣자
		
	}
	@Override
	public void deleteBasketItem(List<String> basket_no) {
		
		for(int i=0; i<basket_no.size();i++){
			int no=Integer.parseInt(basket_no.get(i));
			mypageDao.deleteBasketItem(no);
		}
		
	}

	@Override
	public List<OderItemVo> getOderItemList(List<String> basket_no, HttpSession session) {
		
		List<OderItemVo> orderList=new ArrayList<OderItemVo>();
		for(int i=0; i<basket_no.size();i++){
			OderItemVo oderItem=new OderItemVo();
			int no=Integer.parseInt(basket_no.get(i));
			
			BasketVo basket=mypageDao.getBasket(no);
		
			oderItem=changeVo(oderItem, basket,session);
		
			orderList.add(i,oderItem);
					
		}
	
		return orderList;
	}
	
	private OderItemVo changeVo(OderItemVo oderItem,BasketVo basket,HttpSession session){
		oderItem.setItem_id(basket.getItem_id());
		oderItem.setItem_name(basket.getItem_name());
		oderItem.setItem_price(basket.getItem_price());
		oderItem.setItem_count(basket.getItem_count());
		oderItem.setTotal_price(basket.getItem_count()*basket.getItem_price());
		oderItem.setItem_img(findImg(basket,session));
		return oderItem;
	}
	
	private String findImg(BasketVo basket,HttpSession session){
		String realPath=session.getServletContext().getRealPath("/");
		int item_id=Integer.parseInt(basket.getItem_id());
		String filename=realPath+"resources\\upload\\"+mypageDao.getMainImgName(item_id);
		return filename;
	}

	@Override
	public void insertOrderList(OrderListVo orderList, Member member) {
		String mem_id=member.getShop_mem_id();
		
		for(int i=0;i<orderList.getItem_id().size();i++){
			OrderVo order=new OrderVo();
			order.setMem_id(mem_id);
			order.setReceiver_name(orderList.getReceiver_name());
			order.setReceiver_addr(orderList.getReceiver_addr());
			order.setReceiver_phone(orderList.getReceiver_phone());
			order.setItem_id(orderList.getItem_id().get(i));
			order.setItem_name(orderList.getItem_name().get(i));
			order.setItem_count(orderList.getItem_count().get(i));
			order.setTotal_price(orderList.getTotal_price().get(i));
			
			mypageDao.insertOrderList(order);
		}
		
	}

	@Override
	public List<OrderVo> getOrderList(String shop_mem_id) {
		List<OrderVo> orderlist=mypageDao.getOrderList(shop_mem_id);
		SimpleDateFormat dateFomat=new SimpleDateFormat("yy-MM-dd");
		
		for(int i=0;i<orderlist.size();i++){
			
			orderlist.get(i).setDate(dateFomat.format(orderlist.get(i).getOrder_date()));
		}
		return orderlist;
	}

	@Override//상세페이지에서 넘어온 바스켓vo에 담긴것을 오더아이템vo에 옮겨 주자
	public List<OderItemVo> exchangeFromView(BasketVo basket, String item_img,HttpSession session) {
		List<OderItemVo> orderItemVo=new ArrayList<OderItemVo>();
		OderItemVo orderItem=new OderItemVo();
		String realPath=session.getServletContext().getRealPath("/")+"resources\\upload\\"+item_img;
		orderItem.setItem_id(basket.getItem_id());
		orderItem.setItem_name(basket.getItem_name());
		orderItem.setItem_img(realPath);
		orderItem.setItem_count(basket.getItem_count());
		orderItem.setItem_price(basket.getItem_price());
		orderItem.setTotal_price(basket.getItem_count()*basket.getItem_price());
		orderItemVo.add(orderItem);
		return orderItemVo;
	}
	
	
	

}
