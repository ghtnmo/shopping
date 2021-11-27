package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ImageBean;
import model.ItemBean;
import model.MemberBean;

@Repository
public class ItemDAOImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertItem(ItemBean item) throws Exception{
		int re = 0;
		System.out.println("ssss");
		re = sqlSession.insert("insertItem", item);
		return re;
	}
	
	public List<ItemBean> listItem(Map<String,String> map)throws Exception{
		return sqlSession.selectList("listItem",map);
	}
	
	public int listItemCount()throws Exception{
		return sqlSession.selectOne("listItemCount");
	}
	
	public ItemBean detailItem(int item_code)throws Exception{
		return sqlSession.selectOne("detailItem",item_code);
	}
}
