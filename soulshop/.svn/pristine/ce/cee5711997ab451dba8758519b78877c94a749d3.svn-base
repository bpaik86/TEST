package soul.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


import soul.board.dao.BoardDAO;


@Component
@Service("parent=boardService2")
public class BoardServiceImpl2 implements BoardService2{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	

	
	@Override
	public List<Map<String, Object>> selectBoardList2(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList2(map);
		
	}

	@Override
	public void insertBoard2(Map<String, Object> map) throws Exception {
		boardDAO.insertBoard2(map);
	}

	@Override
	public void updateBoard2(Map<String, Object> map) throws Exception{
		boardDAO.updateBoard2(map);
	}

	@Override
	public void deleteBoard2(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard2(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail2(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = boardDAO.selectBoardDetail2(map);
		return resultMap;
	}
	
	
	
	
	
	
	
	
}
