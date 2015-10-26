package soul.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soul.main.model.Member;
import soul.test.vo.TestArticleVo;
import soul.test.vo.TestCheckBoxVo;
import soul.test.vo.TestImagesVo;
import soul.test.vo.TestVo;


@Repository("testDao")
public class TestDaoImpl implements TestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public TestVo selectOne(String username)throws Exception{
		
		return (TestVo)sqlSessionTemplate.selectOne("test.select",username);
	}
	public List<TestCheckBoxVo> selectBasket(){
		return sqlSessionTemplate.selectList("test.selectBaket");
	}
	public List<TestImagesVo> selectImages(){
		return sqlSessionTemplate.selectList("test.selectImages");
	}
	public void insertTest()throws Exception{
		sqlSessionTemplate.insert("test.insert");
	}
	
	public void insertArticle(TestArticleVo article)throws Exception{
		sqlSessionTemplate.insert("test.insertarticle",article);
	}
	
	public void insertImages(TestImagesVo images)throws Exception{
		sqlSessionTemplate.insert("test.insertImages", images);
	}
	
	public void delete(String item_name)throws Exception{
		sqlSessionTemplate.delete("test.deleteBaket", item_name);
	}
	public List<Member> selectMemberList(){
		return sqlSessionTemplate.selectList("test.selectMemberList");
	}
	public void deleteMember(String shop_mem_id)throws Exception{
		sqlSessionTemplate.delete("test.deleteMember", shop_mem_id);
	}
}
