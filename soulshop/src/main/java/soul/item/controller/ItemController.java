package soul.item.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import soul.common.utils.ImageUtils;
import soul.common.utils.ThumbnailUtil;
import soul.item.dao.ItemDaoImpl;
import soul.item.vo.ItemImgVO;
import soul.item.vo.ItemVO;

@Controller
public class ItemController {
	
private static final Logger log=LoggerFactory.getLogger(ItemController.class);
	
	
	private void printLog(String content){
		log.info(content);
	}
	
	
	@Resource(name="itemDao")
	private ItemDaoImpl itemDao;
	
	
	private String getMenuImgae(String cat){
		System.out.println("cat value  ="+cat);
		Map<String,String> menu=new HashMap<String,String>();
		String[] value={"t1_title.gif","t2_title.gif","t3_title.gif",
										"p1_title.gif","p2_title.gif","p3_title.gif",
										"o1_title.gif","o2_title.gif","o3_title.gif",
										"s1_title.gif","s2_title.gif","s3_title.gif",
										"a1_title.gif","a2_title.gif","a1_title.gif"};
		String[] key={"t1","t2","t3",
								"p1","p2","p3",
								"o1","o2","o3",
								"s1","s2","s3",
								"a1","a2","a3"};
		for(int i=0;i<key.length;i++){
			menu.put(key[i], value[i]);
		}
		System.out.println( menu.get(cat)+"gygygygygy");
		return menu.get(cat);
	}
	//리스트 페이지
	@RequestMapping("/item_list.soul")
	public ModelAndView item_list(HttpServletRequest request,HttpSession session){
		String cat = request.getParameter("cat");
		//System.out.println(cat);
		String menu_images=getMenuImgae(cat);
		ModelAndView result = new ModelAndView();
		if (cat == null){
		
			System.out.println(menu_images);
			List<ItemVO> itemList = itemDao.itemList();
			result.addObject("menu_images","main_title.gif");
			result.addObject("result",itemList);
			result.setViewName("item_list");
			
			return result;
			}		
		List<ItemVO> itemList = itemDao.itemCate(cat);
		//menu_images
		result.addObject("menu_images",menu_images);
		result.addObject("result", itemList);
		result.setViewName("item_list");
		return result;
	}
	
	
	//검색 페이지
		@RequestMapping("/item_search.soul")
		public ModelAndView item_search(HttpServletRequest request,HttpSession session){
			String searchBytitle = request.getParameter("search");
			ModelAndView result = new ModelAndView();
			//System.out.println(cat);
			if(searchBytitle==null){
				result.addObject("result", null);
			}else{
				List<ItemVO> itemList = itemDao.searchItem(searchBytitle);
				result.addObject("result", itemList);
			}
				result.addObject("menu_images", "search_title.gif");
				result.setViewName("item_list");
			
			return result;
		}
	
	
	//상세보기
	@RequestMapping("/item_view.soul")
	public ModelAndView item_view(HttpServletRequest request,HttpSession session) throws Exception{

		String ITEM_ID = request.getParameter("ITEM_ID");
		ModelAndView result = new ModelAndView();
		System.out.println(ITEM_ID);
		ItemVO itemVO = itemDao.itemView(ITEM_ID);
		List<ItemImgVO> itemImgVO = itemDao.imgView(ITEM_ID);
		
		String realFolder="/resources/upload/";  //서버 내 폴더 
		
		for(int i=0; i<itemImgVO.size();i++){
			String path=itemImgVO.get(i).getFILENAME();
			itemImgVO.get(i).setFILENAME(realFolder+path);
		}
				
		result.addObject("result",itemVO);
		result.addObject("list",itemImgVO);
		result.setViewName("item_view");
		System.out.println(itemImgVO.get(0).getFILENAME());
		
		return result;
	}
	
	//입력 페이지
	@RequestMapping(value="/item_insert.soul")
	public String item_insert(){
		return "item_insert";
		
	}
	//입력 쿼리전송페이지
	@RequestMapping(value="/item_add.soul", method=RequestMethod.POST)
	public String item_add(HttpServletRequest request,ItemVO itemAdd,ItemImgVO images,HttpSession session) throws Exception{

		printLog("***경로***"+session.getServletContext().getRealPath("/")+"*******");
		MultipartHttpServletRequest mhsq=(MultipartHttpServletRequest)request;
		itemAdd.setITEM_MAIN("");
		itemDao.itemAdd(itemAdd);//상품 내용 등록
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
					switch(i){
					case 0:
						images.setFILENUM("mainImg");
						itemAdd.setITEM_MAIN(saveFilename);
						break;
					case 1:
						images.setFILENUM("img1");
						break;
					case 2:
						images.setFILENUM("img2");
						break;
					case 3:
						images.setFILENUM("img3");
						break;
					}
					images.setORINAME(originalFilename);//images 자바빈에 값 세팅
					images.setFILENAME(saveFilename);//자바빈에 값 세팅
					images.setFILESIZE(fileSize);//자바빈에 값 세팅
					mf.get(i).transferTo(uploadFile);//파일 저장
					if(ImageUtils.isImageFile(saveFilename)){
						printLog("통과");
						ThumbnailUtil.makeThumbnail(uploadFile, thumbFile, 100, 100);
					}
					printLog(i+"번째"+images.getFILENAME());
					itemAdd.setITEM_ID(images.getITEM_ID());
					itemDao.itemImg(images);//이미지 테이블에 입력
				}
				
			}
			
		}
		
		
		return "redirect:/item_mainImg.soul";
		
	}
	
	@RequestMapping("item_mainImg.soul")
	public String item_mainImg() throws Exception{
		itemDao.itemMain("mainImg");
		return "redirect:/item_list.soul";
	}
	
	
	
	/*@RequestMapping(value="showImages_test.soul")//이미지 뿌리기!!!!!
	public String showImages(Model model,HttpSession session) throws Exception{//세션통해서 서버 폴더 위치 찾기
		List<TestImagesVo> list=testDao.selectImages();
		String realFolder=session.getServletContext().getRealPath("/")+"resources\\upload\\";  //서버 내 폴더 
		for(int i=0; i<list.size(); i++){
			list.get(i).setFilename(realFolder+list.get(i).getFilename());//이미지 명에 경로 입혀서 셋팅해주기
			printLog(list.get(i).getFilename());//체크 
		}
		model.addAttribute("imageList", list);//어트리뷰트 추가
		return "showImages_test";
	}*/
	
}
