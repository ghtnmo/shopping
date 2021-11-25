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
	
	public int checkMemberId(String id) throws Exception{
		int re = -1;
		MemberBean mb = sqlSession.selectOne("login_check", id);
		if(mb != null) {
			re = 1;
		}
		return re;
	}
	public int insertImage(ImageBean image) throws Exception{
		int re = -1;
		System.out.println("ssss");
		re = sqlSession.insert("insertImage", image);
		return re;
	}
}
