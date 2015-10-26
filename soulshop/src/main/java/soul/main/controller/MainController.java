package soul.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import soul.item.dao.ItemDaoImpl;
import soul.item.vo.ItemVO;
import soul.main.dao.MemberDao;
import soul.main.model.Member;
import soul.main.model.Zipcode;
import soul.test.controller.TestController;


@Controller
public class MainController {
	
	MemberDao memberDao; //회원 
	
	@Resource(name="itemDao")
	private ItemDaoImpl itemDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	private static final Logger log=LoggerFactory.getLogger(TestController.class);
	
	private void printLog(String content){
		log.info(content);
	}
	
	
	//메인페이지
	@RequestMapping("/main.soul")
	public String main(Model model){

		List<ItemVO> itemList = itemDao.itemList();
		model.addAttribute("result",itemList);

		return "main";
	}
	
	//로그인화면
	@RequestMapping(value="/login.soul")
	public String memberLogin(@ModelAttribute("Member")Member member, BindingResult result, HttpSession session) throws Exception{ //Login()
		
		return "login";
	}
	
	//로그인 체크
	@RequestMapping("loginCheck.soul")
	public String memberLoginCheck(Model model,Member member, HttpSession session){
		//memberFindChk
		String page="";
		Member resultMember=memberDao.memberLogin(member);//아이디와 비밀 체크해서 결과값 전달
		if(resultMember==null){
			model.addAttribute("code", -1);
			page="IDfindError";
		}else{
			if(member.getShop_mem_pw().trim().equals(resultMember.getShop_mem_pw())){
				session.setAttribute("member", resultMember);
				page="main";
			}else{
				model.addAttribute("code", 0);
				page="IDfindError";
			}
				
		}
		printLog(member.getShop_mem_id());
		return page;
	}
	//로그아웃페이지
	@RequestMapping("logout.soul")
	public String memberLogout(HttpSession session){
		
		session.setAttribute("member", null);
		
	
		return "login";
	}
	
	//아이디찾기 입력페이지
	@RequestMapping("/find_idAction.soul")
	public ModelAndView memberFindForm(){
		System.out.println("아이디 찾기 입력페이지입니다.");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("find_id");
		return mav;	
	}
	
	//아이디찾기 결과페이지
	@RequestMapping("find_id.soul")
	public ModelAndView find_id(@ModelAttribute("member") Member member, HttpServletRequest request)throws Exception{
		Member smember;
		System.out.println("find_id 아이디찾기 결과페이지입니다.");
		
		ModelAndView mav=new ModelAndView();
		
		int memberFindChk;
		
		System.out.println(member.getShop_mem_name());
		System.out.println(member.getShop_mem_email());
		
		smember = memberDao.idFindByName(member);
		
		//System.out.println(smember.getShop_mem_email());
		if(smember == null){
			memberFindChk = 0; //가입되어 있는 이름이 없음.
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("IDfindError");
			return mav;
		}else{
			if(member.getShop_mem_email().equals(smember.getShop_mem_email())){ 
				memberFindChk = 1; //회원가입되어 있는 이름이 있고 이메일이 있으면
				System.out.println("성공....");
				mav.addObject("member", smember); // smember의 값을 member로....
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("memberidfindend"); // IDfindOk.jsp(보여주는 페이지)
				return mav;
			}else{
				memberFindChk = -1; //이름과 이메일이 맞지 않을때
				System.out.println("실패...");
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("IDfindError");
				return mav;
			}
		}			
	}
	
	//패스워드찾기 입력페이지
	@RequestMapping("/find_pwAction.soul")
	public ModelAndView memberFindForm2(){
		System.out.println("패스워드찾기 입력페이지입니다.");
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("find_pw");
		return mav;	
	}
	
	//패스워드찾기 결과페이지
	@RequestMapping("/find_pw.soul")
	public ModelAndView find_pw(@ModelAttribute("member") Member member, HttpServletRequest request) throws Exception{
		Member imember;
		
		System.out.println("패스워드찾기 결과페이지입니다.");
		
		ModelAndView mav = new ModelAndView();
		
		int memberFindChk;
		
		System.out.println(member.getShop_mem_name());
		System.out.println(member.getShop_mem_email());
		
		imember = memberDao.idFindByName2(member);
		
		if(imember == null){
			memberFindChk = 0; //가입되어 있는 이름이 없음.
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("IDfindError");
			return mav;
		}else{
			if(member.getShop_mem_email().equals(imember.getShop_mem_email())){
				memberFindChk = 1; //회원가입되어 있는 이름이 있고 이메일이 있으면
				
				System.out.println("성공....");
				mav.addObject("member", imember); //imember의 값을 member로
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("memberpwfindend"); //PWfindOk.jsp(보여주는 페이지)
				return mav;
			}else{
				memberFindChk = -1; // 이름과 이메일이 맞지 않을때
				System.out.println("실패.....");
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("IDfindError");
				return mav;
			}
		}
	}
	
	//회원가입 약관 페이지
	@RequestMapping("/agreement.soul")
	public String areement(){
		System.out.println("회원가입 약관페이지입니다.");
		return "agreement";
	}
	
	//회원가입 페이지
	@RequestMapping("/join_form.soul")
	public String join_form(){
		System.out.println("회원가입 페이지입니다.");	
		return "join_form";
	}
	
	//회원가입 완료페이지
	@RequestMapping("/join.soul")
	public String join(Member member)throws Exception{
		
		System.out.println("회원가입 완료페이지입니다.");
		
		System.out.println(member.getShop_mem_id());
		System.out.println(member.getShop_mem_pw());
		System.out.println(member.getShop_mem_name());
		System.out.println(member.getShop_mem_bdt());
		System.out.println(member.getShop_mem_email());
		System.out.println(member.getShop_mem_cell());
		System.out.println(member.getShop_mem_phone());
		System.out.println(member.getShop_mem_addr1());
		
		memberDao.insert(member);
		return "join";
	}
	
	//아이디중복체크
	@RequestMapping("/memberIdChkAction.soul")
	public ModelAndView memberIdCheck(HttpServletRequest request) throws Exception{
		
		System.out.println("아이디중복체크시작.....");
		
		ModelAndView mav=new ModelAndView();
		String shop_mem_id = request.getParameter("shop_mem_id");
		int chkId;
			
		System.out.println(shop_mem_id);
		
		Member memberM = memberDao.select(shop_mem_id);
		if(memberM == null){
				chkId = 0; //아이디없음, 사용가능한 아이디
		}else{
				chkId = 1; //아이디있음, 사용불가한 아이디
		}
		mav.addObject("chkId", chkId);
		mav.addObject("shop_mem_id", shop_mem_id);
		mav.setViewName("memberIdCheck");
		return mav;			
	}
	
	//우편번호 체크
	@RequestMapping("zipCheckAction.soul")
	public ModelAndView zipCheck(HttpServletRequest request) throws Exception{
		System.out.println("우편번호체크시작...........");
		
		ModelAndView mav = new ModelAndView();
		
		List<Zipcode> zipcodeList;
		zipcodeList = new ArrayList<Zipcode>();
		String dong;
		
		dong = request.getParameter("dong");
		zipcodeList = memberDao.zipCheckAction(dong);
		
		mav.addObject("dong", dong);
		mav.addObject("zipcodeList", zipcodeList);
		mav.setViewName("zipCheck");
		return mav;
	}
}
