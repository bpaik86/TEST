package soul.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import soul.board.photo.CommandMap;
import soul.board.service.PhotoService;

@Controller
public class PhotoController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="photoService")
	private PhotoService photoService;
	
	@RequestMapping(value="photozone.soul")
    public ModelAndView phoopenBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("photozone");
    	
    	//Map<String,Object> map = photoService.selectBoardDetail(commandMap.getMap());
    	
    	List<Map<String,Object>> list = photoService.phoselectBoardList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	//mv.addObject("Imglist", map.get("list"));
		
    	return mv;
    }
	
	@RequestMapping(value="photo_insert.soul")
	public ModelAndView phoopenBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("photo_insert");
		
		return mv;
	}
	
	@RequestMapping(value="insert.soul")
	public ModelAndView phoinsertBoard(CommandMap commandMap, HttpServletRequest request,HttpSession session) throws Exception{
		String filePath="";
		ModelAndView mv = new ModelAndView("redirect:/photozone.soul");
		filePath=session.getServletContext().getRealPath("/");
		photoService.phoinsertBoard(commandMap.getMap(), request,filePath);
		
		return mv;
	}
	
	@RequestMapping(value="photo_view.soul")
	public ModelAndView phoopenBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("photo_view");
		System.out.println();
		Map<String,Object> map = photoService.phoselectBoardDetail(commandMap.getMap());
		System.out.println(map);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
		
	}
	
	@RequestMapping(value="photo_modify.soul")
	public ModelAndView phoopenBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("photo_modify");
		
		Map<String,Object> map = photoService.phoselectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="updatePhoBoard.soul")
	public ModelAndView phoupdateBoard(CommandMap commandMap, HttpServletRequest request,HttpSession session) throws Exception{
		String filePath;
		ModelAndView mv = new ModelAndView("redirect:photo_view.soul");
		filePath=session.getServletContext().getRealPath("/");
		photoService.phoupdateBoard(commandMap.getMap(), request,filePath);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="deleteboard.soul")
	public ModelAndView phodeleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:photozone.soul");
		
		photoService.phodeleteBoard(commandMap.getMap());
		
		return mv;
	}
	
}

