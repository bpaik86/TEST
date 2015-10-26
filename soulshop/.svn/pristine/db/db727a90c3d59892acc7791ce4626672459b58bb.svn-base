package soul.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import soul.board.dao.BoardDAO;



@Component
@Service("parent=boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
		
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		boardDAO.insertBoard(map);
	}

	@Override
	public void replyBoard(Map<String, Object> map) throws Exception {
		boardDAO.replyBoard(map);
	}

	@Override
	public void updateBoard3(Map<String, Object> map) throws Exception{
		boardDAO.updateBoard3(map);
	}
	
	
	@Override
	public void updateBoard(Map<String, Object> map) throws Exception{
		boardDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = boardDAO.selectBoardDetail(map);
		return resultMap;
	}

	

	
	
	
	
	
	
	
}
