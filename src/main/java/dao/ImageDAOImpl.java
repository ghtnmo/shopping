package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ImageBean;
import model.MemberBean;

@Repository
public class ImageDAOImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertImage(ImageBean image) throws Exception{
		int re = 0;
		System.out.println("ssss");
		re = sqlSession.insert("insertImage", image);
		return re;
	}
}
