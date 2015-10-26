package soul.mypage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import soul.main.model.Member;
import soul.mypage.model.BasketVo;
import soul.mypage.model.OderItemVo;
import soul.mypage.model.OrderListVo;
import soul.mypage.model.OrderVo;
import soul.mypage.service.MypageService;

@Controller
public class MypageController {
	
	@Resource(name="mypageServiceImpl")
	private MypageService mypageService;
	
	private static final Logger log=LoggerFactory.getLogger(MypageController.class);
	
	private void printLog(String content){
		log.info(content);
	}
	
	@RequestMapping("mypage.soul")
	public String mypage(){
		return "mypage";
	}
	
	@RequestMapping("mypage_modify.soul")//개인정보 수정 페이지
	public String mypage_modify(Member member,Model model,HttpSession session)throws Exception{
		Member paramMember=(Member)session.getAttribute("member");
		printLog("******개인정보 수정페이지로 이동 콘트롤러 시작******");
		member=mypageService.getMember(paramMember.getShop_mem_id());//나중에 세션 값 가져와서 세션에 저장된 아이디로 !!
																		//내 생각에는 운영자가 회원관리 페이지에서 회원 정보 요청했을때 매핑 주소와 그 메서드 하나거 더 필요할듯
																		//그리고 @RequestParam 으로 아이디 값  받아서 (회원 정보에거 아이디에 URL?아이디=값)처리 해줄 필요가 있음
		//아니면 아이디 클릭시 우편번호 검색이나 아이디 중복 창과 동일한 팝업창 띄워서 그 위에서 보여지게 하는것도 생각 해보자 !!
		model.addAttribute("member", member);
		printLog("******개인정보 수정페이지로 이동 콘트롤러 마지막******");
		return "mypage_modify";//개인정보 수정 페이지로 이동!!!
	}
	
	@RequestMapping(value="member_update.soul", method=RequestMethod.POST)
	public String updateMember(Member member){
		printLog("******개인정보 수정 로직 시작******");
		mypageService.updateMember(member);
		printLog("******개인정보 수정 로직 완료******");
		return "order_list";//여기 값은 무의미 jsp 단에서  location 부분을에서 이동할 페이지 설정
	}
	
	
	@RequestMapping("AddBasket.soul")//
	public String addBasket(Model model,HttpSession session,BasketVo basket){
		//basket에 받아서  basket
		Member member=(Member)session.getAttribute("member");
		basket.setMem_id(member.getShop_mem_id()); //이 녀석은 세션 작업후 설정
		//basket.setMem_id("play");테스트용
		mypageService.insertBasketItem(basket);
		
		return "main";
	}
	
	@RequestMapping("basket.soul")//바스켓 테이블에서 데이터 뽑아 와서 페이지로 이동
	public String basket(Model model,HttpSession session){
		Member member=(Member)session.getAttribute("member");
		List<BasketVo> list= mypageService.getBasketList(member.getShop_mem_id());
		model.addAttribute("basketList", list);
		
		return "basket";
	}
	
	@RequestMapping("deleteBasketItem.soul")
	public String deleteBasketItem(@RequestParam(value="basket_no", required=true)List<String> basket_no){
		
		printLog(basket_no.get(0));
		mypageService.deleteBasketItem(basket_no);
		
		return "basket";
	}
	
	@RequestMapping("order.soul")
	public String order(String item_img,BasketVo basket,Model model,HttpSession session,@RequestParam(value="basket_no", required=false, defaultValue="default")List<String> basket_no){
		Member member=(Member)session.getAttribute("member");
		int total_price=0;
		model.addAttribute("member", member);
		
		if(basket_no.get(0).equals("default")){//기본적으로 이미지는 아이템 아이디에 매핑시켜서 가져온다 메인꺼만 가져다 쓰자
			printLog("상세페이지에서 넘어온 데이터를 가져와서 셋팅");
		
			List<OderItemVo> oderList=mypageService.exchangeFromView(basket,item_img,session);
			model.addAttribute("orderList", oderList);
			model.addAttribute("total_price", oderList.get(0).getTotal_price());
		}else{
			printLog("장바구니에서 넘어온 데이터를 가져와서 셋팅");
			
			List<OderItemVo> oderList=mypageService.getOderItemList(basket_no,session);
			for(int i=0;i<oderList.size();i++){
				total_price +=oderList.get(i).getTotal_price();
			}
			model.addAttribute("orderList", oderList);
			model.addAttribute("total_price", total_price);
		}
		//바스켓으로 는 상세페이지 정보를
		//basket_no 로는 장바구니에서 정보를 얻어자
		return "order";
	}
	
	@RequestMapping("pay.soul")
	public String pay(Model model,OrderListVo orderList,String pay_price,HttpSession session ){
		
		/*List<String> idList=orderList.getItem_id();
		List<String> nameList=orderList.getItem_name();
		for(int i=0;i<idList.size();i++){
			System.out.println(idList.get(i));
			System.out.println(nameList.get(i));
		}
		
		System.out.println(pay_price);*/
		session.setAttribute("orderList", orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pay_price",pay_price);
		return "pay";
	}
	@RequestMapping("order_list.soul")
	public String order_list(String pay_price, Model model, HttpSession session){
		OrderListVo orderList=(OrderListVo)session.getAttribute("orderList");
		Member member=(Member)session.getAttribute("member");
		mypageService.insertOrderList(orderList,member);
		List<OrderVo> orderVoList=mypageService.getOrderList(member.getShop_mem_id());
		
		model.addAttribute("orderList", orderVoList);
		return "order_list";
	}
	@RequestMapping("orderListView.soul")
	public String orderListView(Model model,HttpSession session){
		Member member=(Member)session.getAttribute("member");
		List<OrderVo> orderVoList=mypageService.getOrderList(member.getShop_mem_id());
		
		model.addAttribute("orderList", orderVoList);
		return "order_list";
		
	}
	
}
