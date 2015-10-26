package soul.item.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import soul.item.vo.ItemImgVO;
import soul.item.vo.ItemVO;

@Repository("itemDao")
public class ItemDaoImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//리스트 전체 페이지
	public List<ItemVO> itemList(){
		return sqlSessionTemplate.selectList("item.item_List");
	}
	
	//상세보기
	public ItemVO itemView(String ITEM_ID){
		return sqlSessionTemplate.selectOne("item.item_View", ITEM_ID);
	}
	public List<ItemImgVO> imgView(String ITEM_ID){
		return sqlSessionTemplate.selectList("item.img_View", ITEM_ID);
	}
	
	//리스트 카테고리 구분
	public List<ItemVO> itemCate(String cat){
		return sqlSessionTemplate.selectList("item.list_cate", cat);
	}
	
	public List<ItemVO> searchItem(String title){
		return sqlSessionTemplate.selectList("item.searchItem", title);
	}
	
	//상품 등록
	public void itemAdd(ItemVO itemAdd)throws Exception{
		sqlSessionTemplate.insert("item.item_Add", itemAdd);
	}
	
	
	public void itemMain(String model)throws Exception{
		sqlSessionTemplate.update("item.item_Main", model);
	}
	
		
	public void itemImg(ItemImgVO images)throws Exception{
		sqlSessionTemplate.insert("item.item_img", images);
	}
	
	
	
	public List<ItemImgVO> selectImg(){
		return sqlSessionTemplate.selectList("item.img_View");
	}
	
	
}
