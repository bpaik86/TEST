package soul.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import soul.common.common.CommandMap;
import soul.board.service.BoardService;
import soul.board.service.BoardService2;
import soul.board.dao.BoardDAO;

import soul.common.common.Paging;
import soul.common.common.pagingAction;

import soul.common.common.Paging2;
import soul.common.common.pagingAction2;


@Controller
public class BoardController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private BoardDAO dao;
	
	
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="boardService2")
	private BoardService2 boardService2;
	
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 7;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private pagingAction page;
	private Date regdate;
	
	
	
	private int currentPage2 = 1;	 
	private int totalCount2; 		 
	private int blockCount2 = 7;	 
	private int blockPage2 = 5; 	 
	private String pagingHtml2;  
	private pagingAction2 page2;
	private Date regdate2;
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/qna.soul")
    public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	
	    ModelAndView mv = new ModelAndView("qna");
    	
	 
	    
	  
    	List<Map<String, Object>> list = boardService.selectBoardList(commandMap.getMap());

    	if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = list.size();   
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "noticeList");
		pagingHtml=page.getPagingHtml().toString();  
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		list = list.subList(page.getStartCount(), lastCount);
    	
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
    	mv.addObject("list", list);
    	
    	
    	return mv;
    }
	
	@RequestMapping(value="/qna_view.soul")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qna_view");
		
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		
		
/*		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());*/
		
		

		
		mv.addObject("map", map);
		
		
		return mv;
	}
	
	@RequestMapping(value="/qna_insert.soul")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qna_insert");
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard.soul")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna.soul");
		
		boardService.insertBoard(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/replyBoard.soul")
	public ModelAndView replyBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna.soul");
		
		boardService.replyBoard(commandMap.getMap());
/*		boardService.updateBoard3(commandMap.getMap());*/
		
		/*mv.addObject("QB_IMG_NO", commandMap.get("QB_IMG_NO"));*/
		return mv;
	}
	
	@RequestMapping(value="/updateBoard.soul")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna.soul");
		
		boardService.updateBoard(commandMap.getMap());
		
		mv.addObject("QB_IMG_NO", commandMap.get("QB_IMG_NO"));
		return mv;
	}	
	
	@RequestMapping(value="/qna_reply.soul")
	public ModelAndView openBoardReply(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qna_reply");
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	@RequestMapping(value="/qna_modify.soul")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qna_modify");
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/deleteBoard.soul")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna.soul");
		
		Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		boardService.deleteBoard(commandMap.getMap());
		
		return mv;
	}

	
	
	
	@RequestMapping(value="/faq.soul")
    public ModelAndView openBoardList2(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("faq");
    	
    	List<Map<String,Object>> list = boardService2.selectBoardList2(commandMap.getMap());
    	
    	if(request.getParameter("currentPage2") == null || request.getParameter("currentPage2").trim().isEmpty() || request.getParameter("currentPage2").equals("0")) {
            currentPage2 = 1;
        } else {
            currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
        }
		
		totalCount2 = list.size();   
		page2 = new pagingAction2(currentPage2, totalCount2, blockCount2, blockPage2, "noticeList");
		pagingHtml2=page2.getPagingHtml2().toString();  
		int lastCount2 = totalCount2;
		 
		if (page2.getEndCount2() < totalCount2)
			lastCount2 = page2.getEndCount2() + 1;
		 
		list = list.subList(page2.getStartCount2(), lastCount2);
    	
		mv.addObject("pagingHtml2", pagingHtml2);
		mv.addObject("currentPage2", currentPage2);
    	
    	
    	mv.addObject("list", list);
    	
    	return mv;
    }
	
	@RequestMapping(value="/faq_view.soul")
	public ModelAndView openBoardDetail2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("faq_view");
		
		Map<String,Object> map = boardService2.selectBoardDetail2(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/faq_insert.soul")
	public ModelAndView openBoardWrite2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("faq_insert");
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard2.soul")
	public ModelAndView insertBoard2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/faq.soul");
		
		boardService2.insertBoard2(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/faq_modify.soul")
	public ModelAndView openBoardUpdate2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("faq_modify");
		
		Map<String,Object> map = boardService2.selectBoardDetail2(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/updateBoard2.soul")
	public ModelAndView updateBoard2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/faq.soul");
		
		boardService2.updateBoard2(commandMap.getMap());
		
		mv.addObject("FB_ARTICLE_NO", commandMap.get("FB_ARTICLE_NO"));
		return mv;
	}	
	
	@RequestMapping(value="/deleteBoard2.soul")
	public ModelAndView deleteBoard2(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/faq.soul");
		
		boardService2.deleteBoard2(commandMap.getMap());
		
		return mv;
	}

	
	



}
