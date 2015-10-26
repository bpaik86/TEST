package soul.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soul.admin.model.ChangeStatus;
import soul.main.model.Member;
import soul.mypage.model.OrderVo;

@Repository("adminDao")
public class AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getMemberCount(){
		return sqlSessionTemplate.selectOne("admin.getMemberCount");
	}
	public List<Member> getAllMembers(){
		
		return sqlSessionTemplate.selectList("admin.getAllMembers");
	}
	
	public void deleteMember(String id){
		sqlSessionTemplate.delete("admin.deleteMember", id);
	}
	public List<OrderVo> getOrderList(String status) {
	
		return sqlSessionTemplate.selectList("admin.getOrderList", status);
	}
	public void changeStatus(ChangeStatus change) {
		sqlSessionTemplate.update("admin.changeStatus",change);
	}
}
