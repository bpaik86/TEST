package soul.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import soul.admin.dao.AdminDao;
import soul.admin.model.ChangeStatus;
import soul.main.model.Member;
import soul.mypage.model.OrderVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name="adminDao")
	AdminDao adminDao;
	
	
	@Override
	public List<Member> getAllMembers() {
		
		return adminDao.getAllMembers();
	}

	@Override
	public void deleteMember(List<String> memberIDList ) {
		
		for(int i=0; i<memberIDList.size();i++){
			adminDao.deleteMember(memberIDList.get(i));
		}
			
			
	}

	@Override
	public int getMemberCount() {
		
		return adminDao.getMemberCount();
	}

	@Override//회원들 주문내역 가져오기 배송 관리에 쓰임
	public List<OrderVo> getOrderList(String status) {
		
		return adminDao.getOrderList(status);
	}

	@Override//회원 배송 상태 바꾸기
	public void changeStatus(ChangeStatus change) {
		
		for(int i=0; i<change.getOrder_no().size();i++){
			change.setNo(change.getOrder_no().get(i));
			adminDao.changeStatus(change);
		}
		//adminDao.changeStatus();
	}
	
	
	
	
}
