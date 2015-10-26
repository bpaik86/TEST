package soul.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public interface BoardService2 {

	List<Map<String, Object>> selectBoardList2(Map<String, Object> map) throws Exception;

	void insertBoard2(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail2(Map<String, Object> map) throws Exception;

	void updateBoard2(Map<String, Object> map) throws Exception;

	void deleteBoard2(Map<String, Object> map) throws Exception;

}
