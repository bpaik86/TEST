package soul.test.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import soul.common.utils.ImageUtils;
import soul.common.utils.ThumbnailUtil;
import soul.main.model.Member;
import soul.test.dao.TestDaoImpl;
import soul.test.vo.TestArticleVo;
import soul.test.vo.TestCheckBoxVo;
import soul.test.vo.TestImagesVo;
import soul.test.vo.TestVo;

@Controller
public class TestController {
	
	private static final Logger log=LoggerFactory.getLogger(TestController.class);
	
	
	private void printLog(String content){
		log.info(content);
	}
	@Resource(name="testDao")
	private TestDaoImpl testDao;
	
	//입력 테스트
	@RequestMapping("test.soul")
	public String test(TestVo testVo) throws Exception{
		
		testDao.insertTest();
		return "admin";
	}
	//@자바 스크립트 실험
	@RequestMapping("jQuery.soul")
	public String jQuery_test() throws Exception{
		
		
		return "jQuery";
	}
	
	@RequestMapping("test123.soul")//리스트 보내서 뷰단에서 인덱스 지정해서 값 뽑아주기
	public String test123(Model model) throws Exception{
		TestVo aaa=new TestVo();
		List<TestVo> result=new ArrayList<TestVo>();
		result.add(aaa);
		
		//log.info(result.get(0));
		model.addAttribute("result", result);
		return "result_test";
	}
	//다중 이미지 입력 테스트
	@RequestMapping("write_test.soul")
	public String write_test() throws Exception{
	
		return "write_test";
	}
	//다중 이미지 입력 테스트
	@RequestMapping(value="result_test.soul", method=RequestMethod.POST)
	public String result_test(HttpServletRequest request, TestArticleVo article,TestImagesVo images,HttpSession session) throws Exception{
			//session.getServletContext().getRealPath("/") 
			
			printLog("***경로***"+session.getServletContext().getRealPath("/")+"*******");
			MultipartHttpServletRequest mhsq=(MultipartHttpServletRequest)request;
			testDao.insertArticle(article);// 글은 등록 성공
			printLog("글등록 성공");
			String realFolder=session.getServletContext().getRealPath("/")+"resources/upload/"; //원본 저장소
			String thumFolder=realFolder+"thum/"; //썸네일 저장소
			File dir=new File(realFolder);
			File dir1=new File(thumFolder);
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
			if(!dir1.isDirectory()){
				dir1.mkdirs();
			}
			List<MultipartFile> mf=mhsq.getFiles("uploadFile");//업로드 파일들 받아서 리스트에 넣기;
			
			//썸네일 만들어서 썸네일 따로 만들기 우선 썸네일 만들어서 저장하는 것까지만 하자
			if(mf.size()==0||mf.get(0).getOriginalFilename().equals("")){
				printLog("파일이 없는경우");
			}else{
				for(int i=0; i<mf.size();i++){
					String genId=UUID.randomUUID().toString().substring(0, 12);//랜덤 유니크 숫자 12자리 추출
					String originalFilename=mf.get(i).getOriginalFilename();//원본 이름 
					String saveFilename=genId+"."+originalFilename;//저장 이름
					String savePath=realFolder+saveFilename;//원본저장경로
					String tsavePath=thumFolder+saveFilename;
					
					File uploadFile=new File(savePath);
					File thumbFile=new File(tsavePath);
					long fileSize=mf.get(i).getSize();//파일 사이즈
					if(fileSize<=0){
						printLog("파일 사이즈가 0이라 저장 안함");
					}else{
						images.setOriname(originalFilename);//images 자바빈에 값 세팅
						images.setFilename(saveFilename);//자바빈에 값 세팅
						images.setFilesize(fileSize);//자바빈에 값 세팅
						mf.get(i).transferTo(uploadFile);//파일 저장
						if(ImageUtils.isImageFile(saveFilename)){
							printLog("통과");
							ThumbnailUtil.makeThumbnail(uploadFile, thumbFile, 100, 100);
						}
						printLog(i+"번째"+images.getFilename());
						testDao.insertImages(images);//이미지 테이블에 입력
					}
				}
				
			}
				
		return "redirect:/write_test.soul";//"result_test"; 리다이렉트 시켜서 새로고침시 중복 저장되는것을 방지
	}
	
	@RequestMapping(value="showImages_test.soul")//이미지 뿌리기!!!!!
	public String showImages(Model model,HttpSession session) throws Exception{//세션통해서 서버 폴더 위치 찾기
		List<TestImagesVo> list=testDao.selectImages();
		String realFolder=session.getServletContext().getRealPath("/")+"resources\\upload\\";  //서버 내 폴더 
		for(int i=0; i<list.size(); i++){
			list.get(i).setFilename(realFolder+list.get(i).getFilename());//이미지 명에 경로 입혀서 셋팅해주기
			printLog(list.get(i).getFilename());//체크 
		}
		model.addAttribute("imageList", list);//어트리뷰트 추가
		return "showImages_test";
	}
	
	@RequestMapping(value="checkBox_test.soul", method=RequestMethod.GET)//장바구니리스트 로드
	public String tocheckBox_test(Model model,TestCheckBoxVo testCheckBoxVo) throws Exception{
	
		printLog("장바구니 리스트로드.....");
		List<TestCheckBoxVo> list=testDao.selectBasket();
		printLog(String.valueOf(list.size()));
		
		
		model.addAttribute("basketList", list);
		model.addAttribute(testCheckBoxVo);
		printLog("장바구니 리스트로드.. 완료");
		return "checkBox_test";
	}
	@RequestMapping(value="checkBoxDelect_test.soul")//장바구니 삭제 
	public String checkBox_test(Model model,TestCheckBoxVo testCheckBoxVo,@RequestParam(value="item_name", required=true)List<String> item_name) throws Exception{
		printLog("결과창");
		printLog(String.valueOf(item_name.size()));
		printLog(item_name.get(0));
		for(int i=0; i<item_name.size();i++){
			testDao.delete(item_name.get(i));
		}
		printLog("결과창..끝");
		return "result_test";//"redirect:/checkBox_test";
	}
	
	@RequestMapping(value="membermanage_test.soul")//회원리스트 로드
	public String membermanage_test(Model model) throws Exception{
	
		printLog("회원 리스트로드.....");
		List<Member> list=testDao.selectMemberList();
		printLog(String.valueOf(list.size()));
		model.addAttribute("memberList", list);
		//리스트에 list.get(i).shop_mem_dt 의 데이터 타입을 변환 하는 서비스 단을 만들어 보자 나중에
		
		printLog("회원 리스트로드.. 완료");
		return "membermanage_test";
	}
	@RequestMapping(value="member_delete_test.soul")//장바구니 삭제 
	public String deleteMember(Model model,@RequestParam(value="shop_mem_id", required=true)List<String> shop_mem_id) throws Exception{
		printLog("결과창");
		printLog(String.valueOf(shop_mem_id.size()));
		
		for(int i=0; i<shop_mem_id.size();i++){
			testDao.deleteMember(shop_mem_id.get(i));
		}
		printLog("결과창..끝");
		return "result_test";//"redirect:/checkBox_test";
	}
	
	
}
