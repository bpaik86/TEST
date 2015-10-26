package soul.board.dao;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Repository;

import soul.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}

	public void replyBoard(Map<String, Object> map) throws Exception{
		insert("board.replyBoard", map);
		update("board.addStep", map);
	}
	
	public void updateBoard3(Map<String, Object> map) throws Exception{
		update("board.addStep", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("board.deleteBoard", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board2.selectBoardList2", map);
	}

	public void insertBoard2(Map<String, Object> map) throws Exception{
		insert("board2.insertBoard2", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail2(Map<String, Object> map) throws Exception{
		update("board2.addRcount", map);
		return (Map<String, Object>) selectOne("board2.selectBoardDetail2", map);
	}

	public void updateBoard2(Map<String, Object> map) throws Exception{
		update("board2.updateBoard2", map);
	}

	public void deleteBoard2(Map<String, Object> map) throws Exception{
		update("board2.deleteBoard2", map);
	}
	

	
	
	
	
}
