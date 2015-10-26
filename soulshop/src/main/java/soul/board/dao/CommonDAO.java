package soul.board.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import soul.board.photo.AbstractDAO;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> phoselectFileInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.phoselectFileInfo", map);
	}

}
