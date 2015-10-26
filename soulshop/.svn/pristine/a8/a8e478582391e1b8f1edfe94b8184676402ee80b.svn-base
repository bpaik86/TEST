package soul.main.dao;

import java.io.IOException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import soul.main.model.Member;
import soul.main.model.Zipcode;

public class MemberDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//로그인체크
	public Member memberLogin(Member member) {
		
		
		return (Member)sqlSessionTemplate.selectOne("test1.loginCheck", member);
	}
	
	//회원가입
	public void insert(Member member) throws Exception{
		sqlSessionTemplate.insert("test1.insert",member);
		
	}

	//회원 정보 수정
	public void memberAllUpdate(Member member) throws IOException{
		sqlSessionTemplate.update("test1.allUpdate", member);
	}
	//아이디 중복체크
	public Member select(String id) throws Exception{
		return (Member)sqlSessionTemplate.selectOne("test1.idCheck", id);
	}
	
	//우편번호 검색 체크
	public List<Zipcode> zipCheckAction(String dong) throws Exception{
		return sqlSessionTemplate.selectList("test1.zipCheckAction", "%" + dong + "%");
	}
		
	//아이디찾기
	public Member idFindByName(Member member) throws Exception{
		System.out.println("아이디찾기 (idFindByName) MemberDao시작...");
		
		return (Member)sqlSessionTemplate.selectOne("test1.idfind", member);
	}
	
	//패스워드찾기
	public Member idFindByName2(Member member) throws Exception{
		System.out.println("비밀번호찾기 (idFindByName) MemberDao시작...");
		
		return (Member)sqlSessionTemplate.selectOne("test1.pwfind", member);
	}
}
