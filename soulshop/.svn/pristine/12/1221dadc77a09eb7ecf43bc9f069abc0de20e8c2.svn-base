package soul.admin.service;

import java.util.List;

import soul.admin.model.ChangeStatus;
import soul.main.model.Member;
import soul.mypage.model.OrderVo;

public interface AdminService {
	
	public List<Member> getAllMembers();
	
	public int getMemberCount();
	
	public void deleteMember(List<String> memberIDList);

	public List<OrderVo> getOrderList(String status);

	public void changeStatus(ChangeStatus change);
}
