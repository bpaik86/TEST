package soul.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;



import soul.board.dao.PhotoDAO;
import soul.board.photo.FileUtils;



@Service("photoService")
public class PhotoServiceImpl implements PhotoService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="photoDAO")
	private PhotoDAO photoDAO;
	
	@Override
	public List<Map<String, Object>> phoselectBoardList(Map<String, Object> map) throws Exception {
		
		
		return photoDAO.phoselectBoardList(map);
		
	}

	@Override
	public void phoinsertBoard(Map<String, Object> map, HttpServletRequest request,String filePath) throws Exception {
		photoDAO.phoinsertBoard(map);
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request,filePath);
		for(int i=0, size=list.size(); i<size; i++){
			photoDAO.phoinsertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> phoselectBoardDetail(Map<String, Object> map) throws Exception {
		photoDAO.phoupdateHit(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = photoDAO.phoselectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = photoDAO.phoselectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void phoupdateBoard(Map<String, Object> map, HttpServletRequest request,String filePath) throws Exception{
		photoDAO.phoupdateBoard(map);
		photoDAO.phodeleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request,filePath);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				photoDAO.phoinsertFile(tempMap);
			}
			else{
				photoDAO.phoupdateFile(tempMap);
			}}
		}
	

	@Override
	public void phodeleteBoard(Map<String, Object> map) throws Exception {
		photoDAO.phodeleteBoard(map);
	}

	
	
	
	
}
