package soul.board.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import soul.board.photo.AbstractDAO;

@Repository("photoDAO")
public class PhotoDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> phoselectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("photo.phoselectBoardList", map);
	}

	public void phoinsertBoard(Map<String, Object> map) throws Exception{
		insert("photo.phoinsertBoard", map);
	}

	public void phoupdateHit(Map<String, Object> map) throws Exception{
		update("photo.phoupdateHit", map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> phoselectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("photo.phoselectBoardDetail", map);
		
	}

	public void phoupdateBoard(Map<String, Object> map) throws Exception{
		update("photo.phoupdateBoard", map);
	}

	public void phodeleteBoard(Map<String, Object> map) throws Exception{
		update("photo.phodeleteBoard", map);
	}

	public void phoinsertFile(Map<String, Object> map) throws Exception{
		insert("photo.phoinsertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> phoselectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("photo.phoselectFileList", map);
	}

	public void phodeleteFileList(Map<String, Object> map) throws Exception{
		update("photo.phodeletefilelist", map);
	}

	public void phoupdateFile(Map<String, Object> map) throws Exception{
		update("photo.phoupdateFile", map);
	}
	
	
	
}