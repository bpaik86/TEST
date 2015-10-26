package soul.admin.controller;

// GIT Commit Test
// GIT Commit Test2
// GIT Commit Test3


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.authentication.session.ChangeSessionIdAuthenticationStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import soul.admin.model.ChangeStatus;
import soul.admin.service.AdminService;
import soul.main.model.Member;
import soul.mypage.model.OrderVo;

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	private static final Logger log=LoggerFactory.getLogger(AdminController.class);
	
	
	@RequestMapping("/admin.soul")
	public String admin(){
		
			return "admin";
	}
	
	@RequestMapping("/member_management.soul")
	public String member_management(Model model){
		List<Member> memberList=adminService.getAllMembers();
		int count=adminService.getMemberCount();
		model.addAttribute("memberList", memberList);
		model.addAttribute("count",count);
		return "member_management";
	}
	
	@RequestMapping("/deleteMember.soul")
	public String deleteMember(@RequestParam(value="shop_mem_id",required=true)List<String> shop_mem_id){
			
			log.info(shop_mem_id.get(0));
			adminService.deleteMember(shop_mem_id);
			
			return "admin";
	}
	
	
	@RequestMapping(value="/delivery_management.soul",method=RequestMethod.GET)
	public String delivery_management(Model model){
		System.out.println("겟방식");
		List<OrderVo> orderVoList=adminService.getOrderList("배송전");
		model.addAttribute("orderList", orderVoList);
		model.addAttribute("status", "배송전");
		return "delivery_management";
	}
	
	@RequestMapping(value="/delivery_management.soul",method=RequestMethod.POST)
	public String delivery_management12(@RequestParam(value="status", required=true)String status,Model model){
		System.out.println("포스트방식");
		List<OrderVo> orderVoList=adminService.getOrderList(status);
		model.addAttribute("orderList", orderVoList);
		model.addAttribute("status", status);
		return "delivery_management";
	}
	
	@RequestMapping(value="/change.soul",method=RequestMethod.POST)
	public String delivery_status_change(Model model,ChangeStatus change){
		System.out.println("체인지");
		adminService.changeStatus(change);
		List<OrderVo> orderVoList=adminService.getOrderList(change.getOriginal());
		model.addAttribute("orderList", orderVoList);
		model.addAttribute("status", change.getOriginal());
		return "delivery_management";
	}
	
	/*@RequestMapping("/item_modify.soul")
	public String item_modify(){
		return "item_modify";
	}
	
	@RequestMapping("/item_sales.soul")
	public String item_sales(){
		return "item_sales";
	}*/
	
}
